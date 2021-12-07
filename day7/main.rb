require 'csv'

# merge crabs into one array
data = CSV.read('input.txt', converters: :numeric)[0]
grouped_crabs = data.group_by(&:itself).transform_values(&:count)
positions = Array.new(grouped_crabs.keys.max+1).map.with_index{ |n, i| grouped_crabs[i] || 0 }

current_position, weights = 0, Hash.new
until current_position == positions.count do
  weighted = positions.map.with_index{ |n, j| n * (j - current_position).abs  }
  weights[current_position] = weighted.sum
  current_position += 1
end

puts "part1: #{[weights.min_by{ |k, v| v }].to_h}"