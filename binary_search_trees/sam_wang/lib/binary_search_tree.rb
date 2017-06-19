# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value, tree_node = @root)
    BinarySearchTree.find!(tree_node, value)
  end

  def delete(value)
    if value == @root.value
      @root = nil
    else
      BinarySearchTree.delete!(@root, value)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    BinarySearchTree.max(tree_node)
  end

  def depth(tree_node = @root)
    BinarySearchTree.depth(tree_node)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value <= node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end
  end

  def self.max(node)
    return node unless node.right

    BinarySearchTree.max(node.right)
  end

  def self.delete_max!(node)
    return node.left unless node.right

    node.right = BinarySearchTree.delete_max!(node.right)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      target_node = node
      node = BinarySearchTree.max(target_node.left)
      node.left = BinarySearchTree.delete_max!(target_node.left)
      node.right = target_node.right
    end

    node
  end
end
