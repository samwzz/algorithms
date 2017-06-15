## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. LRU Cache is built using two data structures, hash map and doubly linked list. Hash map gives us constant lookup time, and linked list gives us constant insertion and deletion. Each key in the hash map points to a node in the linked list, which stores the key and value.
2. When a key is added to the hash map, if the node already exists in the linked list, we remove it from the linked list, and the node is moved to the tail of the linked list. After we add a new node to the linked list, if the current count is greater than the max size of the LRU cache, we eject the first node (the least recently used). When a node is removed, the associations between the node and the linked list is destroyed.

### Part 2
```ruby
class LRUCache
end
```
