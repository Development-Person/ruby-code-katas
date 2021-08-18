# A square of squares
# You like building blocks. You especially like building blocks that are squares.
# And what you even like more, is to arrange them into a square of square building blocks!

# However, sometimes, you can't arrange them into a square.
# Instead, you end up with an ordinary rectangle!
# Those blasted things! If you just had a way to know,
# whether you're currently working in vain… Wait! That's it!
# You just have to check if your number of building blocks is a perfect square.

# Task
# Given an integral number, determine if it's a square number:

# In mathematics, a square number or perfect square is an integer that
# is the square of an integer; in other words, it is the product of some integer with itself.

# The tests will always use some integral number, so don't worry about
# that in dynamic typed languages.

# Examples
# -1  =>  false
#  0  =>  true
#  3  =>  false
#  4  =>  true
# 25  =>  true
# 26  =>  false

def square?(num)
  return false if num.negative?

  num_sqrt = Math.sqrt(num)

  return false if (num_sqrt - num_sqrt.floor).positive?

  true
end

puts square?(-1) # false, "-1 is not a perfect square"
puts square?(0)  # true,  "0 is a perfect square (0 * 0)"
puts square?(3)  # false,  "3 is not a perfect square"
puts square?(25) # true,  "25 is a perfect square"

# other solutions

def is_square1(x)
  x < 0 ? false : Math.sqrt(x) % 1 == 0
end

def is_square2(x)
  x >= 0 && Math.sqrt(x).modulo(1).zero?
end
