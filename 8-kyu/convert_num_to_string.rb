# We need a function that can transform a number into a string.

# frozen_string_literal: true

def number_to_string(num)
  num.to_s
end

string = number_to_string(420)

puts string.class
