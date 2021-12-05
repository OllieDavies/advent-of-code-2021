data = File.open("input.txt").read
  .split(/\n/)
  .map{ |n| n.split(" -> ")
  .map{ |n| n.split(",").map(&:to_i) } }

def is_straight(from, to)
  from[0] == to[0] || from[1] == to[1]
end

def get_direction(start, finish)
  return 0 if start == finish
  start < finish ? +1 : -1
end

def get_points_for_line(from, to)
  x_direction = get_direction(from[0], to[0])
  y_direction = get_direction(from[1], to[1])

  current_x, current_y = from
  coords = []
  until current_x == to[0] && current_y == to[1]
    coords.push([current_x += x_direction, current_y += y_direction])
  end

  [from] + coords
end

grid = Hash.new
data.each_with_index do |cloud|
  from,to = cloud

  next if !is_straight(from, to)

  line_coords = get_points_for_line(from, to)
  line_coords.each{ |coords| grid[coords] = grid[coords] + 1 rescue 1 }
end

puts "part1: #{grid.values.count{ |n| n > 1 }}"