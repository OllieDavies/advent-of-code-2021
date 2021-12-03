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

def number_to_delete(reading, zeros, ones)
  return zeros <= ones ? "0" : "1" if reading == "o2" 
  return zeros > ones ? "0" : "1" if reading == "co2" 
end

def get_reading(data, type)
  i = 0
  until data.length == 1 do
    bits = data.transpose[i]
    zeros,ones = [bits.count("0"), bits.count("1")]
    data.delete_if{ |n| n[i] == number_to_delete(type, zeros, ones) }
    i+=1
  end
  data[0].join.to_i(2)
end

co2 = get_reading(data.clone, "co2")
o2 = get_reading(data.clone, "o2")
puts "part2: #{co2*o2}"
