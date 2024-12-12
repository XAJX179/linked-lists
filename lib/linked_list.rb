# frozen_string_literal: true

# class LinkedList for creating linked list with help of Node class's objects
class LinkedList
  attr_reader :head, :tail

  def initialize
    # head/start of the list
    @head = nil
    # tail/end of the list
    @tail = nil
  end

  # appends value at the end of the list
  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
  end

  # prepends value at the top of the list
  def prepend(value)
    node = Node.new(value)

    if @head.nil?
      @tail = node
    else
      node.next = @head
    end
    @head = node
  end

  # including this means every method that uses each to work is copied here
  # and will become useful by using below modified each method
  include Enumerable
  # iterates over each node of the list and calls the block on it
  def each
    return nil if @head.nil?

    pointer = @head
    index = 0
    until pointer.nil?
      yield(pointer, index)
      pointer = pointer.next
      index += 1
    end
  end

  # returns number of nodes in the list
  def size
    size = 0
    each { size += 1 }
    size
  end

  # return node of the list at the given index start from 0
  def at(index)
    return nil if index >= size || index.negative?

    # uncomment the pp elem to see data structure returned by filter
    node, _node_index = detect { |_node, node_index| node_index == index }
    node
  end

  # removes last element of the list
  def pop
    return nil if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
    else
      before_tail = at size - 2
      before_tail.next = nil
      @tail = before_tail
    end
  end

  # returns true if a node with given value exists in list else returns false.
  def contains?(value)
    _node, index = detect { |node, _node_index| node.data == value }
    !!index
  end

  # finds index of the node with data equals given value
  def find(value)
    _node, index = detect { |node, _node_index| node.data == value }
    index
  end

  # prints list in a readable format
  def to_s
    string = String.new
    each { |elem| string << "( #{elem.data} )->" }
    string << '( nil )'
  end

  # inserts node with given value at index
  def insert_at(value, index)
    list_size = size
    return 'only positive index' if index.negative? || index > list_size

    node = Node.new value
    if index.zero?
      prepend(value)
    elsif index == list_size - 1
      append(value)
    else
      insert(index, node)
    end
  end

  # insert_at's insert method for inserting node in between
  # list with given index
  def insert(index, node)
    # current node at the index
    current_node = at(index)
    # previous node from the index
    previous_node = at(index - 1)
    # pp current_node
    # pp previous_node
    node.next = current_node
    previous_node.next = node
  end

  def remove_at(index)
    return nil if at(index).nil?

    if index == size - 1
      pop
    elsif index.zero?
      @head = @head.next
    else
      previous_node = at(index - 1)
      next_node = at(index + 1)
      previous_node.next = next_node
    end
  end
end
