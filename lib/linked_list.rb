# frozen_string_literal: true

# class LinkedList for creating linked list with help of Node class's objects
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  # appends value at the end of the list
  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    end

    @tail.next = node
    @tail = node
  end
end
