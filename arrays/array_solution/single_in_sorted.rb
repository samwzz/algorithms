# Given a sorted array consisting of only integers where every element appears
# twice except for one element which appears once. find this single element that
# appears only once. Do it in O(logn) time and O(1) space!

def single_in_sorted(arr)
  return arr[0] if arr.length == 1
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid + 1..-1]

  if arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1]
    return arr[mid]
  elsif arr[mid] != arr[mid - 1]
    return single_in_sorted(left)
  elsif arr[mid] != arr[mid + 1] && mid.odd?
    return single_in_sorted(right)
  end
end

p single_in_sorted([0,0,1,1,2,3,3])
