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
    filter do |elem|
      # pp elem
      elem[1] == index
    end[0][0] # second [0] is just to remove [] brackets from output
  end

  # removes last element of the list
  def pop
    return nil if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
    end
    before_tail = at size - 2
    before_tail.next = nil
    @tail = before_tail
  end

  # returns true if a node with given value exists in list else returns false.
  def contains?(value)
    result = filter do |elem|
      elem[0].data == value
    end
    # pp result
    !result.empty?
  end

  # finds index of the node with data equals given value
  def find(value)
    result = filter do |elem|
      elem[0].data == value
    end
    # pp result
    result.empty? ? nil : result[0][1]
  end

  # prints list in a readable format
  def to_s
    string = String.new
    each do |elem|
      string << "( #{elem.data} )"
      string << '->'
    end
    string << '( nil )'
  end

  # def insert_at(value, index)
  # end
end
