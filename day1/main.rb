require 'csv'

data = CSV.read('input.txt', converters: :numeric).map{ |n| n[0] } 

number_of_increases = 0
data.each_with_index do |x, index|
  next if index == 0
  number_of_increases+=1 if x > data[index-1]
end

puts "part1: #{number_of_increases}"
