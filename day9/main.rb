require 'csv'

@data = CSV.read('input.txt').map{ |n| n[0].split('').map(&:to_i) }

def get_value(data, x, y)
  data[x][y] unless (x < 0 || x > data.size-1 || y < 0 || y > data[x].size-1)
end

def get_adjacent(x, y)
  [
    get_value(@data, x, y-1),
    get_value(@data, x, y+1),
    get_value(@data, x-1, y),
    get_value(@data, x+1, y),
  ].compact
end

low_points = []
for x in 0..@data.size-1
  for y in 0..@data[x].size-1
    if @data[x][y] < get_adjacent(x,y).min
      low_points.push([x, y])
    end
  end
end

part1 = low_points.reduce(0){ |acc, cur| 1+acc+@data[cur[0]][cur[1]] }
puts "part1: #{part1}"
