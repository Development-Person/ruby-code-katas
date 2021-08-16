# Usually when you buy something, you're asked whether your credit card number,
# phone number or answer to your most secret question is still correct.
# However, since someone could look over your shoulder,
# you don't want that shown on your screen. Instead, we mask it.

# Your task is to write a function maskify,
# which changes all but the last four characters into '#'.

# Examples
# maskify('4556364607935616') # should return '############5616'
# maskify('64607935616')      # should return '#######5616'
# maskify('1')                # should return '1'
# maskify('')                 # should return ''

# # "What was the name of your first pet?"
# maskify('Skippy')
# should return '##ippy'

# maskify('Nananananananananananananananana Batman!')
# should return '####################################man!'

def maskify1(card_num)
  # your beautiful code goes here
  i = 0

  if card_num.length > 4

    while i < card_num.length - 4
      card_num[i] = '#'
      i += 1
    end
  end

  card_num
end

puts maskify1('4556364607935616') # '############5616'
puts maskify1('4556364 607935616') # '#############5616'
puts maskify1('1') # '1'

def maskify2(card_num)
  hash = card_num[0..-5].length
  '#' * hash + card_num[hash..-1]
end

def maskify3(card_num)
  return card_num if card_num.length <= 4

  card_num.split('').fill('#', 0...card_num.length - 4).join
end
