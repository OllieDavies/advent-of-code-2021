require 'csv'

# merge crabs into one array
data = CSV.read('input.txt', converters: :numeric)[0]
grouped_crabs = data.group_by(&:itself).transform_values(&:count)
positions = Array.new(grouped_crabs.keys.max+1).map.with_index{ |n, i| grouped_crabs[i] || 0 }

current_position, weights = 0, []
until current_position == positions.count do
  weights.push(positions.map.with_index{ |n, j| n * (j - current_position).abs }.sum)
  current_position += 1
end

puts "part1: #{weights.min}"

def get_consumption(current_position, i)
  distance = (i - current_position).abs
  distance * (distance + 1) / 2
end

current_position, weights = 0, []
until current_position == positions.count do
  weights.push(positions.map.with_index{ |n, i| n * get_consumption(current_position, i) }.sum)
  current_position += 1
end

puts "part2: #{weights.min}"
