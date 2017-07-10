require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index) # logical idx of dynamic array
    check_index(index)
    @store[(start_idx + index) % capacity ] # physical idx of static array
  end

  # O(1)
  def []=(index, val)
    @store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    el = self[length - 1]
    self[length - 1] = nil
    @length -= 1
    el
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    @length += 1
    self[length - 1] = val
  end

  # O(1)
  def shift
    el = self[0]
    self[0] = nil
    @start_idx += 1
    @length -= 1
    el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    @start_idx = (start_idx - 1) % capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length || length == 0
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    (0..length - 1).each do |i|
      new_store[i] = self[i]
    end
    @capacity = new_capacity
    @store = new_store
    @start_idx = 0
  end
end
