# You live in the city of Cartesia where all roads are laid out in a perfect grid.
# You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk.
# The city provides its citizens with a Walk Generating App on their phones --
# everytime you press the button it sends you an array of one-letter strings representing
# directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block
# for each letter (direction) and you know it takes you one minute to traverse one city block,
#     so create a function that will return true if the walk the app gives you will take you
#     exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point.
#     Return false otherwise.

# NOTE: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only).
# It will never give you an empty array (that's not a walk, that's standing still!).

def valid_walk1?(walk)
  north = walk.count('n')
  south = walk.count('s')
  east = walk.count('e')
  west = walk.count('w')
  minutes = [north, south, east, west].sum

  return true if minutes == 10 && north == south && east == west

  false
end

p valid_walk1?(%w[n s n s n s n s n s]) # 'should return true'
p valid_walk1?(%w[w e w e w e w e w e w e]) # 'should return false'
p valid_walk1?(['w']) # 'should return false'
p valid_walk1?(%w[n n n s n s n s n s]) # 'should return false'

# #other solutions
def valid_walk2?(walk)
  walk.count('w') == walk.count('e') and
    walk.count('n') == walk.count('s') and
    walk.count == 10
end

def valid_walk3?(walk)
  return false unless walk.length == 10

  x = 0
  y = 0
  walk.each do |step|
    case step
    when 'n' then y += 1
    when 's' then y -= 1
    when 'e' then x += 1
    when 'w' then x -= 1
    end
  end
  x == 0 && y == 0
end
