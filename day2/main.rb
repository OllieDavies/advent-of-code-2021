require 'csv'

data = CSV.read('input.txt').map{ |n| n[0] } 

position = {
  x: 0,
  y: 0
}
data.each do |x|
  direction,distance = x.split(' ')
  position[:x] += distance.to_i if direction == 'forward'
  position[:y] += distance.to_i if direction == 'down'
  position[:y] -= distance.to_i if direction == 'up'
end

puts "part1: #{position[:x] * position[:y]}"