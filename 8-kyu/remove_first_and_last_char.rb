# frozen_string_literal: true

def remove_char1(str)
  str.delete_prefix(str[0]).delete_suffix(str[str.length - 1])
end

puts remove_char1('eloquent') # 'loquen'

# other ways
def remove_char2(str)
  str[1...-1] #return a range with the first and last letters omitted
end

def remove_char3(str)
  str[1..-2]
end
