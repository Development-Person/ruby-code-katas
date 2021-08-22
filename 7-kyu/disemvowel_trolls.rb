# Trolls are attacking your comment section!

# A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

# Your task is to write a function that takes a string and return a new string with all vowels removed.

# For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

# NOTE: for this kata y isn't considered a vowel.

def disemvowel1(str)
  str.gsub(/[aeiou]/i, '')
end

p disemvowel1('This website is for losers LOL!') # "Ths wbst s fr lsrs LL!"

# other solutions

def disemvowel2(str)
  str.delete 'aAeEiIoOuU'
end
