class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev.next = @next
    @next.prev = prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @sentinel = Node.new
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @sentinel.next
  end

  def last
    @sentinel.prev
  end

  def empty?
    @sentinel.next.nil? && @sentinel.prev.nil?
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    if empty?
      @sentinel.next = new_node
      new_node.prev = @sentinel
    else
      last.next = new_node
      new_node.prev = last
    end
    @sentinel.prev = new_node
    new_node.next = @sentinel
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    each do |node|
      node.remove if node.key == key
    end
  end

  def each(&prc)
    finder = first
    until finder == @sentinel || finder.nil?
      prc.call(finder)
      finder = finder.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
