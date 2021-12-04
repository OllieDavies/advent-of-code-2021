require 'csv'

data = File.open("input.txt").read.split(/\n{2,}/)

numbers_to_call = data[0].split(',').map(&:to_i)
data.delete_at(0)
boards = data.map{ |board| board.split(/\n/).map{ |n| n.split.map(&:to_i) } }

def has_been_called(number, called_numbers)
  called_numbers.include?(number)
end

def called_status_from_array(row, called_numbers)
  row.map{ |n| has_been_called(n, called_numbers) }
end

def check_rows(rows, called_numbers)
  rows.each do |row|
    return true if called_status_from_array(row, called_numbers).all?(true)
  end
  return false
end

def has_board_won(board, called_numbers)
  check_rows(board.clone, called_numbers) || check_rows(board.clone.transpose, called_numbers)
end

def get_uncalled(board, called_numbers)
  board.flatten.reject{ |n| has_been_called(n, called_numbers) }
end

numbers_to_call.each_with_index do |number, index|
  called_numbers = numbers_to_call[0..index]
  boards.each do |board|
    if has_board_won(board, called_numbers)
      puts "part1: #{get_uncalled(board, called_numbers).sum * number}"
      return
    end
  end
end
