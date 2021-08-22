# Welcome. In this kata, you are asked to square every digit of a number and concatenate them.

# For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1.

# NOTE: The function accepts an integer and returns an integer

def square_digits1(num)
  num.digits.reverse.map { |element| element**2 }.join.to_i
end

p square_digits1(3212) # 9414
p square_digits1(2112) # 4114
p square_digits1(1111) # 1111
p square_digits1(1_234_321) # 14916941
p square_digits1(0) # 0
