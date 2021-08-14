# frozen_string_literal: true

# Complete the square sum function so that it squares
# each number passed into it and then sums the results together.

def square_sum1(numbers)
  return 0 if numbers.length.zero?

  accum = 0

  numbers.each { |n| accum += n.abs**2 }

  accum
end

puts square_sum1([1, 2]) # 5
puts square_sum1([0, 3, 4, 5]) # 50
puts square_sum1([]) # 0
puts square_sum1([-1, -2]) # 5
puts square_sum1([-1, 0, 1]) # 2
puts square_sum1([9, -17, 1, -20, 19, -7, 8]) # 1245

# other ways

def square_sum2(numbers)
  numbers.map { |n| n * n }.reduce(:+)
end

def square_sum3(numbers)
  numbers.reduce(0) { |product, n| product + n**2 }
end

puts square_sum3([9, -17, 1, -20, 19, -7, 8])
