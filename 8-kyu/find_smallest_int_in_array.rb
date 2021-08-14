# frozen_string_literal: true

# Given an array of integers your solution should find the smallest integer.

# For example:

# Given [34, 15, 88, 2] your solution will return 2
# Given [34, -345, -1, 100] your solution will return -345
# You can assume, for the purpose of this kata, that the supplied array will not be empty.

def find_smallest_int1(arr)
  sorted = arr.sort { |a, b| a - b }
  sorted[0]
end

print find_smallest_int1([78, 56, 232, 12, 8]) # 8

# other ways

def find_smallest_int2(arr)
  arr.min
end

def find_smallest_int3(arr)
  arr.sort.take(1)[0]
  # take array and sort it by low to high
  # grab index 0 < that will be the lowest

  # your code here
end
