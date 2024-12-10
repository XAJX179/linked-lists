# frozen_string_literal: true

# class LinkedList for creating linked list with help of Node class's objects
class LinkedList
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
end
