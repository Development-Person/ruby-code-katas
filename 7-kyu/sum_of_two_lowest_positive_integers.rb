# Create a function that returns the sum of the two lowest positive numbers given an
#  array of minimum 4 positive integers. No floats or non-positive integers will be passed.

# For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.

# [10, 343445353, 3453445, 3453545353453] should return 3453455.

def sum_two_smallest_numbers1(numbers)
  sorted = numbers.sort { |a, b| a - b }

  sorted[0] + sorted[1]
end

p sum_two_smallest_numbers1([5, 8, 12, 18, 22]) # 13
p sum_two_smallest_numbers1([7, 15, 12, 18, 22]) # 19
p sum_two_smallest_numbers1([25, 42, 71, 12, 18, 22]) # 30

# other solutions

def sum_two_smallest_numbers2(numbers)
  numbers.min(2).reduce(:+)
end

def sum_two_smallest_numbers3(numbers)
  numbers.min(2).sum
end

def sum_two_smallest_numbers4(numbers)
  numbers.select(&:positive?).min(2).reduce(:+)
end
