# Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid.
# The function should return true if the string is valid, and false if it's invalid.

# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true
# Constraints
# 0 <= input.length <= 100

# Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters.
# Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).

def valid_parentheses1(string)
  score = 0

  string.chars.each do |value|
    score += 1 if value == '('

    score -= 1 if value == ')'

    return false if score == - 1
  end

  score.zero?
end

p valid_parentheses1('  (') # false
p valid_parentheses1(')test') # false
p valid_parentheses1('') # true
p valid_parentheses1('hi())(') # false
p valid_parentheses1('hi(hi)()') # true
p valid_parentheses1('hi((hi))') # true

# other solutions
def valid_parentheses2(string)
  string.chars.each_with_object([]) do |c, stack|
    if c == '('
      stack.push(c)
    elsif c == ')'
      stack.pop or return(false)
    end
  end.empty?
end

def valid_parentheses3(string)
  str = string.delete('^()')
  while str.gsub!('()', ''); end
  str == ''
end

def valid_parentheses4(string)
  ~ Regexp.new(string).nil?
rescue StandardError
  false
end
# explanation for above ^^
# Basically, any Regexp without closed parentheses will throw an exception, which Insti rescues by returning false. Tricky.

# Just punch this in your repl:

# /asdas()/
# Regexp.new("gf()((asda)asd)()sds") rescue "I won't need rescuing"
# Regexp.new("gf(sds") rescue "please rescue me!!!"
# The trickier part is tilde. I found the answer here - Stackoverflow & Ruby Regexp Docs very last method #~

# It's matching the Regexp to the last 'gets' prompt (only if it's valid, i.e., only if it has closed or no parenthesis).
# The variable $_ holds the most recent and scoped value of gets, which, in the case of #valid_parentheses is nothing, nada, nil.

# For illustration:

# def what_does_tidle_do?(string)
#   print "Type something: "
#   gets.chomp
#   puts "Your last gets statement was, '" + $_.chomp + "', now I'll find the first index of what you typed against your regexified method argument."
#   ~ Regexp.new(string)
# end
# > what_does_tidle_do?("cheese")
#  Type something: string cheese mmmm
#  Your last gets statement was, 'string cheese mmmm', now I'll find the first index of what you typed against your regexified method argument.
# => 7
