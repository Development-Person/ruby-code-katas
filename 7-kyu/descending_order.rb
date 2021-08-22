# Your task is to make a function that can take any non-negative integer as an argument
# and return it with its digits in descending order.
# Essentially, rearrange the digits to create the highest possible number.

# Examples:
# Input: 42145 Output: 54421

# Input: 145263 Output: 654321

# Input: 123456789 Output: 987654321

def descending_order1(num)
  array = num.digits.sort { |a, b| b - a }
  array.join.to_i
end

p descending_order1(0) # 0
p descending_order1(1) # 1
p descending_order1(123_456_789) # 987654321

# other solutions

def descending_order2(n)
  n.digits.sort.reverse.join.to_i
end
