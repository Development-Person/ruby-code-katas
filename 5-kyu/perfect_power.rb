# A perfect power is a classification of positive integers:

# In mathematics, a perfect power is a positive integer that can be expressed as an integer power of another positive integer.
# More formally, n is a perfect power if there exist natural numbers m > 1, and k > 1 such that mk = n.

# Your task is to check wheter a given integer is a perfect power. If it is a perfect power, return a pair m and k with mk = n as a proof.
# Otherwise return Nothing, Nil, null, NULL, None or your language's equivalent.

# NOTE: For a perfect power, there might be several pairs. For example 81 = 3^4 = 9^2, so (3,4) and (9,2) are valid solutions.
# However, the tests take care of this, so if a number is a perfect power, return any pair that proves it.

# Examples
# isPP(4) => [2,2]
# isPP(9) => [3,2]
# isPP(5) => nil

def isPP1(num)
  pointer = 2

  while pointer < num

    nth_root = (num**(1.0 / pointer)).rationalize(0.000000001)

    return [nth_root.to_i, pointer] if (nth_root % 1).zero?

    pointer += 1
  end

  nil
end

p isPP1(4) # [2,2], "4 = 2^2"
p isPP1(8) # [2,3], "8 = 2^3"
p isPP1(36) # [6,2], "36 = 6^2"
p isPP1(9) # [3, 2], "9 = 3^2"
p isPP1(5) # nil, "5 is not perfect"
p isPP1(125) # [5,3],

# other solutions
def isPP2(n)
  (2..(n**0.5)).each do |m|
    k = (Math.log(n) / Math.log(m)).round
    return [m, k] if m**k == n
  end
  nil
end
