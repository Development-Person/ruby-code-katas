# This time no story, no theory. The examples below show you how to write function accum:

# Examples:
# accum("abcd") -> "A-Bb-Ccc-Dddd"
# accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# accum("cwAt") -> "C-Ww-Aaa-Tttt"
# The parameter of accum is a string which includes only letters from a..z and A..Z.

def accum1(string)
  mumble = ''
  max = string.length + 1
  start = 1

  while start < max
    mumble.concat("#{string[start - 1] * start}-".capitalize)
    start += 1
  end

  mumble.chop
end

p accum1('ZpglnRxqenU') # "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
p accum1('NyffsGeyylB') # "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
p accum1('MjtkuBovqrU') # "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"
p accum1('EvidjUnokmM') # "E-Vv-Iii-Dddd-Jjjjj-Uuuuuu-Nnnnnnn-Oooooooo-Kkkkkkkkk-Mmmmmmmmmm-Mmmmmmmmmmm"
p accum1('HbideVbxncC') # "H-Bb-Iii-Dddd-Eeeee-Vvvvvv-Bbbbbbb-Xxxxxxxx-Nnnnnnnnn-Cccccccccc-Ccccccccccc"

# other solutions

def accum2(string)
  string.chars.each_with_index.map { |c, i| c.upcase + c.downcase * i }.join('-')
end

def accum3(string)
  string.chars.map.with_index { |char, index| (char * (index + 1)).capitalize }.join('-')
end
