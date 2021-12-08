require 'csv'

@segment_map = {
  abcefg: 0,
  cf: 1,
  acdeg: 2,
  acdfg: 3,
  bcdf: 4,
  abdfg: 5,
  abdefg: 6,
  acf: 7,
  abcdefg: 8,
  abcdfg: 9
}

data = File
  .open("input.txt")
  .read
  .split(/\n/)
  .map{ |reading| 
    signals, outputs = reading.split(" | ")
    { 
      signals: signals.split.map{ |s| s.split('').sort.join },
      outputs: outputs.split.map{ |o| o.split('').sort.join },
    } 
  }

def digit_from_length(length)
  @segment_map.find{ |item| item[0].length == length }[1]
end

actuals = data.map do |d|
  mappings = d[:signals].map{ |s| [s.to_s, digit_from_length(s.length)] }.to_h
  d[:outputs].map{ |o| mappings[o] }
end

puts "part1: #{actuals.flatten.select{ |n| [1, 4, 7, 8].include?(n) }.count}"

