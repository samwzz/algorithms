## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.

# Files already sorted => first element will be the first element of one of the files
require_relative "heap"

def five_hundred_files(arr_of_arrs)
  result = []
  heap = BinaryMinHeap.new { |a, b| a.timestamp <=> b.timestamp }
  arr_of_arrs.each do |arr|
    heap.push(arr.shift)
  end
  result.push(heap.extract)
end
