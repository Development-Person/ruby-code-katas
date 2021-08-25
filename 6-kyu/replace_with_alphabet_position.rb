# Welcome.

# In this kata you are required to, given a string, replace every letter with its position
# in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

def alphabet_position1(text)
  text.downcase.gsub(/[^a-z]/, '').chars.map do |letter|
    letter.ord - 96 #-96 because 'a' ascii code is 97. so any lowercase letter - 96 will get you position of alphabet
  end.join(' ')
end

p alphabet_position1("The sunset sets at twelve o' clock.") # "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position1("-.-'") # ""
