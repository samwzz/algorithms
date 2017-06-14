require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    el = self[length - 1]
    self[length - 1] = nil
    @length -= 1
    el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @length += 1
    self[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    el = self[0]
    (1..length - 1).each do |i|
      self[i - 1] = self[i]
    end
    # self[length - 1] = nil
    @length -= 1
    el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    length.downto(1).each do |i|
      self[i] = self[i - 1]
    end
    self[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    if index >= length || length == 0
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old_store = @store
    @capacity *= 2
    @store = StaticArray.new(@capacity)
    (0..length - 1).each do |i|
      self[i] = old_store[i]
    end
  end
end
