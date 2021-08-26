# frozen_string_literal: true

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
# Additionally, if the number is negative, return 0 (for languages that do have them).

# NOTE: If the number is a multiple of both 3 and 5, only count it once.

# Courtesy of projecteuler.net (Problem 1)
require 'set'

def solution1(number)
  set = Set.new

  pointer = 1

  while pointer < number
    set.add(pointer) if (pointer % 3.to_f).zero? || (pointer % 5.to_f).zero?

    pointer += 1
  end

  set.sum
end

p solution1(10) # 23
p solution1(20) # 78
p solution1(200) # 9168

# other solutions
def solution2(number)
  (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(0, :+)
end
