# A friend of mine takes the sequence of all numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (n is always strictly greater than 0) and returns an array or
# a string (depending on the language) of the form:

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ... will be sorted in increasing order of the "a".

# It happens that there are several possible (a, b). The function returns an empty array (or an empty string)
# if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).

# Examples:
# removNb(26) should return [(15, 21), (21, 15)]
# or
# removNb(26) should return { {15, 21}, {21, 15} }
# or
# removeNb(26) should return [[15, 21], [21, 15]]
# or
# removNb(26) should return [ {15, 21}, {21, 15} ]
# or
# removNb(26) should return "15 21, 21 15"
# or

# in C:
# removNb(26) should return  {{15, 21}{21, 15}} tested by way of strings.
# Function removNb should return a pointer to an allocated array of Pair pointers, each one also allocated.

# def remove_n1(num)
#   a_plus_b = (0.5 * num * (num + 1) + 1).to_i
#   a = a_plus_b / (b + 1)
# end

# p remove_n1(26)  # [[15, 21], [21, 15]]
# p remove_n1(100) # []
def removNb(n)
  number_list = []
  sum = (1..n).inject(0, &:+)

  low_limit = sum / n

  mid_point = Math.sqrt(sum).to_i

  a = mid_point
  b = mid_point

  until a == low_limit || b > n
    total = sum - (a + b)
    product = a * b
    if total == product
      number_list << [a, b]
      a -= 1
    elsif total < product
      a -= 1
    else
      b += 1
    end
  end

  other_answers = number_list.map { |arr| arr.reverse }
  answer = number_list + other_answers
  answer.sort!
end
