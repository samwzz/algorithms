# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.
require_relative 'p04_linked_list'

class LinkedList
  # ....

  def reverse
    @head, @tail = @tail, @head
    each do |node|
      node.next, node.prev = node.prev, node.next
    end
  end
end
