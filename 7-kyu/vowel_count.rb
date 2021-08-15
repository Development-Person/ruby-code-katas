# Return the number (count) of vowels in the given string.

# We will consider a, e, i, o, u as vowels for this Kata (but not y).

# The input string will only consist of lower case letters and/or spaces.

def get_count1(input_str)
  # scan without block pushes to a results array
  input_str.scan(/[aeiou]/).length
end

puts get_count1('abracadabra') # 5

# other solutions
def getCount2(inputStr)
  inputStr.count('aeiou')
end
