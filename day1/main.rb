require 'csv'

data = CSV.read('input.txt', converters: :numeric).map{ |n| n[0] } 

number_of_increases = 0
data.each_with_index do |x, index|
  next if index == 0
  number_of_increases+=1 if x > data[index-1]
end

puts "part1: #{number_of_increases}"


number_of_increases = 0
previous_reading = 0
data.each_with_index do |x, i|
  next if i == 0 || i+2 > data.length-1
  current_reading = data[i-1..i+1].inject(:+)
  number_of_increases+=1 if current_reading > previous_reading
  previous_reading = current_reading
end

puts "part2: #{number_of_increases}"
