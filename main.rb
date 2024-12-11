# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/linked_list'

list = LinkedList.new

list.append('node1')
list.append('node2')
list.append('node3')
list.append('node4')
list.append('node5')

pp list

list.prepend('node6')
list.prepend('node7')
list.prepend('node8')
list.prepend('node9')
list.prepend('node10')

pp list

list.each { |e| puts e }
# because of Include Enumerable
x = list.map { |e| e.data == 'node7' || e.data == 'node3' }
pp x

pp list.size

pp list.head
pp list.tail
