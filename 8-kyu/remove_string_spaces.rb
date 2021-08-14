# frozen_string_literal: true

def no_space1(str)
  arr = str.split('')
  arr.delete(' ')
  arr.join
end

print no_space1('8 j 8   mBliB8g  imjB8B8  jl  B') # '8j8mBliB8gimjB8B8jlB'

# other solutions

def no_space2(x)
  x.delete(' ')
end
