# frozen_string_literal: true

# class Node for creating node objects
class Node
  def initialize(data = nil, next_pointer = nil)
    @data = data
    @next = next_pointer
  end
end
