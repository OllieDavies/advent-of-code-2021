require 'csv'

data = CSV.read('input.txt').map{ |n| n[0] } 

position = { x: 0, y: 0 }
data.each do |x|
  direction,distance = x.split(' ')
  distance = distance.to_i
  position[:x] += distance if direction == 'forward'
  position[:y] += distance if direction == 'down'
  position[:y] -= distance if direction == 'up'
end

puts "part1: #{position[:x] * position[:y]}"

aim = 0
position = { x: 0, y: 0 }
data.each do |x|
  direction,distance = x.split(' ')
  distance = distance.to_i

  aim += distance if direction == 'down'
  aim -= distance if direction == 'up'

  if direction == 'forward'
    position[:x] += distance
    position[:y] += aim * distance
  end
end

puts "part2: #{position[:x] * position[:y]}"