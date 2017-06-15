class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |a, b| a <=> b }
  end

  def count
    store.count
  end

  def extract
    val = store[0]

    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0, &prc)
    else
      store.pop
    end

    val
  end

  def peek
    @store[0]
  end

  def push(val)
    store << val
    self.class.heapify_up(store, self.count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select do |idx|
      idx < len
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    parent_val = array[parent_idx]

    l_child_idx, r_child_idx = child_indices(len, parent_idx)

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    return array if children.all? { |child| prc.call(child, parent_val) >= 0 }

    swap_idx = nil
    if children.length == 1
      swap_idx = l_child_idx
    else
      swap_idx = prc.call(array[l_child_idx], array[r_child_idx]) == -1 ? l_child_idx : r_child_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    parent_val, child_val = array[parent_idx], array[child_idx]
    if prc.call(parent_val, child_val) <= 0
      return array
    else
      array[parent_idx], array[child_idx] = child_val, parent_val
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
