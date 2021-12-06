require 'csv'

@fish = CSV.read('input.txt', converters: :numeric)[0]

def run(days_to_run)
  count_by_days = @fish.group_by(&:itself).transform_values(&:count)
  count_by_days.default = 0

  day = 0
  until day == days_to_run
    ready = count_by_days[0]
    count_by_days[0] = 0
  
    for i in 0..8
      count_by_days[i] = count_by_days[i+1]
    end
  
    count_by_days[6] += ready
    count_by_days[8] += ready
  
    day += 1
  end
  count_by_days.values.sum
end


puts "part1: #{run(80)}"
puts "part2: #{run(256)}"