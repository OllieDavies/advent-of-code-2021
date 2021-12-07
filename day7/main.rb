require 'csv'

# merge crabs into one array
data = CSV.read('input.txt', converters: :numeric)[0]
grouped_crabs = data.group_by(&:itself).transform_values(&:count)
positions = Array.new(grouped_crabs.keys.max+1).map.with_index{ |n, i| grouped_crabs[i] || 0 }

i = 0
weights = Hash.new
until i == positions.count do
  # get the crabs to the left and right of i
  left = positions[0..i];
  right = positions[i..positions.count]

  # weight each crab, based on it's current distance from i
  left_weighted = left.reverse.map.with_index{ |n, j| n * j }.sum
  right_weighted = right.map.with_index{ |n, j| n * j }.sum

  weights[i] = left_weighted + right_weighted
  i += 1
end

puts "part1: #{[weights.min_by{ |k, v| v }].to_h}"