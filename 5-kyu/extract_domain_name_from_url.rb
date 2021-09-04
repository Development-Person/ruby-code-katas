# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

# domain_name("http://github.com/carbonfive/raygun") == "github"
# domain_name("http://www.zombie-bites.com") == "zombie-bites"
# domain_name("https://www.cnet.com") == "cnet"

#rubocop:ignore Style/RegexpLiteral
def domain_name1(url)
  url.scan(/(https?:\/\/w?w?w?\.?|www\.)?(\w+-?\w+)(.+)/)[0][1]
end

# %r{} is equivalent to the /.../ notation, but allows you to have '/' in your regexp without having to escape them

# puts domain_name1('http://wwgoogle.com') # "google" <-- this fails (w at front)!
# puts domain_name1('http://google.co.jp') # "google"
# puts domain_name1('www.xakep.ru') # "xakep"
# puts domain_name1('https://youtube.com') # "youtube"
# puts domain_name1('https://hyphen-site.org') # "hyphen-site"
# puts domain_name1('http://www.codewars.com/kata/') # "codewars"
# puts domain_name1('icann.org') # "icann"

#other solutions 

def domain_name2(url)
  url.match(/^(https?:\/\/)?(www\.)?([\w-]{1,63})\.[a-z]{2,3}(\.[a-z]{2,3})?/)[3]
end

puts domain_name2('http://wwgoogle.com') # "google" <-- this fails (w at front)!
puts domain_name2('http://google.co.jp') # "google"
puts domain_name2('www.xakep.ru') # "xakep"
puts domain_name2('https://youtube.com') # "youtube"
puts domain_name2('https://hyphen-site.org') # "hyphen-site"
puts domain_name2('http://www.codewars.com/kata/') # "codewars"
puts domain_name2('icann.org') # "icann"