# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

# 'abba' & 'baab' == true

# 'abba' & 'bbaa' == true

# 'abba' & 'abbba' == false

# 'abba' & 'abca' == false
# Write a function that will find all the anagrams of a word from a list.
#  You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

# anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

# anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

def anagrams1(word, words)
  target = word.enum_for(:each_byte).reduce(0) { |a, b| a + b }

  words.select { |el| el.enum_for(:each_byte).reduce(0) { |a, b| a + b } == target }
end

p anagrams1('abba', %w[aabb abcd bbaa dada]) # ['aabb', 'bbaa']

p anagrams1('racer', %w[crazer carer racar caers racer]) # ['carer', 'racer']

p anagrams1('laser', %w[lazing lazy lacer]) # []

# other solutions
def anagrams2(word, words)
  words.select { |w| w.chars.sort == word.chars.sort }
end

def anagrams3(word, words)
  # Pure didactic code, anyone who reads it will understand

  result = []

  (0..words.size - 1).each do |i|
    element = words[i]
    error = 0
    (0..element.length - 1).each do |j|
      error = 1 if element.count(element[j]) != word.count(element[j])
    end
    result.push(words[i]) if error == 0
  end

  result
end
