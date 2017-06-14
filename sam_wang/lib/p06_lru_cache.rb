require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    value = nil
    if @map.include?(key)
      update_node!(@map.get(key))
      value = @map.get(key)
    else
      value = calc!(key)
      @store.append(key, value)
      @map.set(key, @store.last)
    end
    if count > @max
      eject!
    end
    value
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    @prc.call(key)
  end

  def update_node!(node)
    @store.remove(node.key)
    @store.append(node.key, node.val)
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove(@store.first.key)
  end
end
