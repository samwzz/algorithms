class Array

  def self.partition(array, start, length, &prc)
    prc = Proc.new { |a, b| a <=> b }

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

#   def select_kth_smallest(k)
#     prc = Proc.new { |a, b| a <=> b }
#
#     (0...length).each do |i|
#       self.class.partition(self, start = 0, length = 0, &prc)
#       pivot_idx = i
#       left_length = pivot_idx - start
#       right_length = length - left_length - 1
#       return self[i] if left_length = k - 1 || right_length == 0
#     end
#   end

  def select_kth_smallest(k)
    left = 0
    right = self.length - 1
    while true
      return self[left] if left == right
      pivot_idx = Array.partition(self, left, right - left + 1)
      if k - 1 == pivot_idx
        return self[k - 1]
      elsif k - 1 < pivot_idx
        right = pivot_idx - 1
      else
        left = pivot_idx + 1
      end
    end
  end
end

arr = [1,4,2,5,3,5]
p arr.select_kth_smallest(1)
p arr.select_kth_smallest(2)
p arr.select_kth_smallest(3)
p arr.select_kth_smallest(4)
p arr.select_kth_smallest(5)
p arr.select_kth_smallest(6)
