require './chandrayaan3'

chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
chandrayaan3.get_commands

puts "final direction #{chandrayaan3.direction}"
puts "chandrayaan current position is #{chandrayaan3.position}"
