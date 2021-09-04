# The rgb function is incomplete. Complete it so that passing in RGB
# decimal values will result in a hexadecimal representation being returned.
# Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.

# NOTE: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

# The following are examples of expected output values:

# rgb(255, 255, 255) # returns FFFFFF
# rgb(255, 255, 300) # returns FFFFFF
# rgb(0,0,0) # returns 000000
# rgb(148, 0, 211) # returns 9400D3

def substituter(color)
  color.to_s.gsub('10', 'A').gsub('11', 'B').gsub('12', 'C').gsub('13', 'D').gsub('14', 'E').gsub('15', 'F')
end

def color_converter(color)
  color < 0 ? color = 0 : nil
  color > 255 ? color = 255 : nil

  color_first = substituter(color / 16)
  color_second = substituter((((color.to_f / 16) - (color / 16)) * 16).to_i)

  "#{color_first}#{color_second}"
end

def rgb1(red, green, blue)
  "#{color_converter(red)}#{color_converter(green)}#{color_converter(blue)}"
end

# puts rgb1(0, 0, 0) # '000000'
# puts rgb1(0, 0, -20) # '000000'
# puts rgb1(300, 255, 255) # 'FFFFFF'
# puts rgb1(173, 255, 47) # 'ADFF2F'

# other solutions
# rubocop:disable Style/FormatStringToken, Style/FormatString
def rgb2(r, g, b)
  # map to a new array
  # take number, compare it with 255, get the min value
  # ##if number is more than 255, 255 will be returned
  # ##if number is less than 255, the number will be returned
  # take number, compare it to 0
  # ##if number is more than 0, the number will be returned
  # ##if number is less than 0, 0 will be returned
  array = [r, g, b].map { |i| [[i, 255].min, 0].max }

  # you now have an array of valid numbers e.g [16, 16, 16]
  # create a template string and apply it to the array with % (called format_string in ruby docs %[flags][width][.precision]type)
  # template string location corresponds to array location ie template[0] => array[0]
  # %.2X does two things. .2x is converting the corresponding number in the array to hexidecimal with a precision of 2 digits
  # the % is placing it in that spot in the template string
  # the template string filled with the elements is returned
  '%.2X%.2X%.2X' % array

  # in one line:
  # '%.2X%.2X%.2X' % [r, g, b].map { |i| [[i, 255].min, 0].max }
end
# rubocop:enable Style/FormatStringToken, Style/FormatString

puts rgb2(173, 255, -47) # 'ADFF00'
