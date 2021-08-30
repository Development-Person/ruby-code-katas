# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] shold return 4, because it appears 1 time (which is odd).

# FUNDAMENTALS

def find_it1(seq)
  # your code here
  hash = {}

  seq.each { |num| hash[num] = (hash[num] || 0) + 1 }

  hash.select { |key, value| return key if value.odd? }
end

p find_it1([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5]) # 5
p find_it1([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5]) #-1
p find_it1([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5]) # 5
p find_it1([10]) # 10
p find_it1([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1]) # 10

# other solutions

def find_it2(seq)
  seq.detect { |n| seq.count(n).odd? }
end

def find_it3(seq)
  seq.reduce(:^)
end

# ^ is the bitwise XOR operator. If you're not familiar with bitwise XOR,
# it means that you take the individual bits of the number and match them up.
# If a pair of bits is a 0 and 1, or a 1 and 0, that results in a 1. If the bits are the same, that results in a 0.
# The important thing here is the following properties:
# X ^ X = 0, where X is any number.
# 0 ^ X = 0, where X is any nuber.
# So you see, a pair of numbers is 0, so you can ignore any pair of numbers.
# If there are an even number of Xs, then you can cleanly split those Xs into pairs of Xs (this is what 'even' means: it's groups of 2).
# Because all of those are pairs, you can ignore all of them.
# But, if you have an odd number, you have a bunch of pairs left, plus one. Those pairs all become 0, so you have 0 ^ X = X.
