# In this little assignment you are given a string of space separated numbers,
# and have to return the highest and lowest number.

# Example:

# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"
# Notes:

# All numbers are valid Int32, no need to validate them.
# There will always be at least one number in the input string.
# Output string must be two numbers separated by a single space, and highest number is first.

def high_and_low1(numbers)
  numbers_array = numbers.split(' ').map(&:to_i).sort { |a, b| a - b }
  "#{numbers_array[-1]} #{numbers_array[0]}"
end

p high_and_low1('4 5 29 54 4 0 -214 542 -64 1 -3 6 -6') # "542 -214"

# other solutions
def high_and_low2(numbers)
  numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

def high_and_low3(numbers)
  numbers = numbers.split.map(&:to_i)
  "#{numbers.max} #{numbers.min}"
end

def high_and_low4(numbers)
  a = numbers.split.map(&:to_i).sort
  "#{a.last} #{a.first}"
end
