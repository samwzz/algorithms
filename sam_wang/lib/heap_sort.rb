require_relative "heap"

class Array
  def heap_sort!
    2.upto(count).each do |heap|
      BinaryMinHeap.heapify_up(self, heap - 1, heap) { |a, b| b <=> a}
    end

    count.downto(2).each do |heap|
      self[0], self[heap - 1] = self[heap - 1], self[0]
      BinaryMinHeap.heapify_down(self, 0, heap - 1) { |a, b| b <=> a}
    end
  end
end
