# You are given an array(list) strarr of strings and an integer k.
# Your task is to return the first longest string consisting of k consecutive strings taken in the array.

# Examples:
# strarr = ["tree", "foling", "trashy", "blue", "abcdef", "uvwxyz"], k = 2

# Concatenate the consecutive strings of strarr by 2, we get:

# treefoling   (length 10)  concatenation of strarr[0] and strarr[1]
# folingtrashy ("      12)  concatenation of strarr[1] and strarr[2]
# trashyblue   ("      10)  concatenation of strarr[2] and strarr[3]
# blueabcdef   ("      10)  concatenation of strarr[3] and strarr[4]
# abcdefuvwxyz ("      12)  concatenation of strarr[4] and strarr[5]

# Two strings are the longest: "folingtrashy" and "abcdefuvwxyz".
# The first that came is "folingtrashy" so
# longest_consec(strarr, 2) should return "folingtrashy".

# In the same way:
# longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"
# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

# Note
# consecutive strings : follow one after another without an interruption

def longest_consec1(arr, int)
  longest = ''

  return '' if int < 1 || int > arr.length

  arr.each_index do |index|
    pointer = 0
    string = ''

    while pointer < int
      string.concat(arr[index + pointer].to_s)
      pointer += 1
    end
    string.length > longest.length ? longest = string : next
  end

  longest
end

p longest_consec1(%w[zone abigail theta form libe zas], 2) # "abigailtheta"
p longest_consec1(%w[ejjjjmmtthh zxxuueeg aanlljrrrxx dqqqaaabbb oocccffuucccjjjkkkjyyyeehh], 1) # "oocccffuucccjjjkkkjyyyeehh"
p longest_consec1([], 3) # ""
p longest_consec1(%w[itvayloxrp wkppqsztdkmvcuwvereiupccauycnjutlv vweqilsfytihvrzlaodfixoyxvyuyvgpck], 2) # "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
p longest_consec1(%w[zone abigail theta form libe zas], -2) # ""
p longest_consec1(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 3) # "ixoyx3452zzzzzzzzzzzz"
p longest_consec1(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 15) # ""
p longest_consec1(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 0) # ""

# other solutions
def longest_consec(strarr, k)
  return '' unless k.between?(1, strarr.length)

  strarr.each_cons(k).map(&:join).max_by(&:length) || ''
end

# each_cons Iterates the given block for each array of consecutive <n> elements.
# max_by Returns the object in enum that gives the maximum value from the given block.
