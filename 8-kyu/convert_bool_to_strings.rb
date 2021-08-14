# frozen_string_literal: true

# Complete the method that takes a boolean value
# and return a "Yes" string for true, or a "No" string for false.

def bool_to_word1(bool)
  return 'Yes' if bool == true

  'No'
end

puts bool_to_word1(true)
puts bool_to_word1(false)

# other ways
def bool_to_word2(bool)
  bool ? 'Yes' : 'No'
end
