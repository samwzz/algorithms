class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = array[1..-1].select { |n| n <= pivot }
    right = array[1..-1].select { |n| n > pivot }
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - left_length - 1

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |i|
      if prc.call(array[i], pivot) <= 0
        array[pivot_idx + 1], array[i] = array[i], array[pivot_idx + 1]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end
end
