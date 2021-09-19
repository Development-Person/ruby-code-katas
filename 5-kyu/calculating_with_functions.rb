# This time we want to write calculations using functions and get the results. Let's have a look at some examples:

# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3
# Requirements:

# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations: plus, minus, times, dividedBy (divided_by in Ruby and Python)
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function represents the right operand
# Division should be integer division. For example, this should return 2, not 2.666666...:
# eight(divided_by(three))

def zero(*args)
  args.push(0).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def one(*args)
  args.push(1).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def two(*args)
  args.push(2).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def three(*args)
  args.push(3).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def four(*args)
  args.push(4).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def five(*args)
  args.push(5).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def six(*args)
  args.push(6).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def seven(*args)
  args.push(7).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def eight(*args)
  args.push(8).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def nine(*args)
  args.push(9).flatten!
  args.length <= 2 ? args : args[1].call(args[2], args[0])
end

def plus(*args)
  plus = ->(a, b) { a + b }
  [*args, plus]
end

def minus(*args)
  minus = ->(a, b) { a - b }
  [*args, minus]
end

def times(*args)
  times = ->(a, b) { a * b }
  [*args, times]
end

def divided_by(*args)
  divide = ->(a, b) { a / b }
  [*args, divide]
end

p seven(times(five)) # 35
p four(plus(nine)) # 13
p eight(minus(three)) # 5
p six(divided_by(two)) # 3

# other solutions
# class Operation
#   def initialize(num, op)
#     @num = num
#     @op = op
#   end

#   def perform(num)
#     num.send(@op, @num.to_f)
#   end
# end

# NUMBER_WORDS = %w[zero one two three four five six seven eight nine]
# OPERATION_WORDS = {
#   "+": 'plus',
#   "-": 'minus',
#   "*": 'times',
#   "/": 'divided_by'
# }

# NUMBER_WORDS.each_with_index do |word, num|
#   define_method word.to_sym do |operation = nil|
#     operation ? operation.perform(num) : num
#   end
# end

# OPERATION_WORDS.each do |method, word|
#   define_method word.to_sym do |num|
#     Operation.new(num, method)
#   end
# end

##
# %w[zero one two three four five six seven eight nine].each_with_index do |name, index|
#   define_method(name) do |proc = nil|
#     proc.nil? ? index : proc.call(index)
#   end
# end

# def times(right)
#   proc { |left| left * right }
# end

# def plus(right)
#   proc { |left| left + right }
# end

# def minus(right)
#   proc { |left| left - right }
# end

# def divided_by(right)
#   proc { |left| left.to_f / right }
# end
