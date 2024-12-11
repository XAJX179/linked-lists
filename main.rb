# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/linked_list'

list = LinkedList.new

list.append('node1')
list.append('node2')
list.append('node3')
list.append('node4')
list.append('node5')

pp 'append', list

list.prepend('node6')
list.prepend('node7')
list.prepend('node8')
list.prepend('node9')
list.prepend('node10')

pp 'prepend', list

pp 'each'
list.each { |e| puts e }

# because of Include Enumerable
x = list.map { |e| e.data == 'node7' || e.data == 'node3' }
pp 'map', x

pp 'size', list.size

pp 'head', list.head

pp 'tail', list.tail

pp 'list at index 5 : ', list.at(5)

pp 'pop'
list.pop
list.pop
pp list

pp 'tail', list.tail
