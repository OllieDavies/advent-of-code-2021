require 'csv'

data = CSV.read('input.txt').map{ |n| n[0].scan /\w/ } 

gamma_rate = []
epsilon_rate = []
data.transpose.each do |x|
  zeros,ones = [x.count("0"), x.count("1")]
  gamma_rate.push(zeros > ones ? 0 : 1)
  epsilon_rate.push(zeros < ones ? 0 : 1)
end

puts "part1: #{gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)}"
