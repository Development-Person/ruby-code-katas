# frozen_string_literal: true

# Write a function called repeatStr which repeats the given string string exactly n times.

def repeat_str(num, str)
  str * num
end

puts repeat_str(6, 'I') # "IIIIII"
puts repeat_str(5, 'Hello') # "HelloHelloHelloHelloHello"
