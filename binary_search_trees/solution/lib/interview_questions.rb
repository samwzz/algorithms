# Post Order Traversal:
def post_order_traversal(tree_node = @root, arr = [])
  # left children, right children, itself,
  if tree_node.left
    in_order_traversal(tree_node.left, arr)
  end

  if tree_node.right
    in_order_traversal(tree_node.right, arr)
  end

  arr.push(tree_node.value)

  arr
end

# Pre Order Traversal:
def pre_order_traversal(tree_node = @root, arr = [])
  # itself, left children, right children
  arr.push(tree_node.value)

  if tree_node.left
    in_order_traversal(tree_node.left, arr)
  end

  if tree_node.right
    in_order_traversal(tree_node.right, arr)
  end

  arr
end


# In Order Iterative:

# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.
