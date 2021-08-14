# frozen_string_literal: true

# Write a program that finds the summation of every number from 1 to num.
# The number will always be a positive integer greater than 0.

def summation1(num)
  # code here
  Array(1..num).reduce { |a, b| a + b } # .reduce(:+) or .sum
end

puts summation1(8) # 36

# other solutions

def summation2(num)
  num * (num + 1) / 2
end
