# family = {  uncles: ["bob", "joe", "steve"],
#     sisters: ["jane", "jill", "beth"],
#     brothers: ["frank","rob","david"],
#     aunts: ["mary","sally","susan"]
#   }

# siblings_hash = family.select { |k, v| (k == :sisters) || 
#                                     (k == :brothers) }

# siblings_array = siblings_hash.to_a.flatten

# siblings_array.delete(:sisters)
# siblings_array.delete(:brothers)


# puts siblings_array


# Solutions! Notice the use of values...

# immediate_family = family.select do |k, v|
#     k == :sisters || k == :brothers
#   end
  
#   arr = immediate_family.values.flatten
  
#   p arr



# h1 = {
#     a: 300,
#     b: 400
# }

# h2 = {
#     b: 500,
#     c: 600
# }

# p h1.merge(h2)
# p h1

# p h1.merge!(h2)
# p h1



# family = {  uncles: ["bob", "joe", "steve"],
#     sisters: ["jane", "jill", "beth"],
#     brothers: ["frank","rob","david"],
#     aunts: ["mary","sally","susan"]
#   }


# puts family.each_key {|key| puts key}

# puts family.each_value {|value| puts value}

# family.each do |k, v|
#     puts "#{k}. #{v}"
# end



# person[:name]



# family = {  uncles: ["bob", "joe", "steve"],
#     sisters: ["jane", "jill", "beth"],
#     brothers: ["frank","rob","david"],
#     aunts: ["mary","sally","susan"]
#   }

# family.key(["bob", "joe", "steve"])

# Solutions (adapted)!!

# if family.value?(["bob", "joe", "steve"])
#     puts "Got it!"
#   else
#     puts "Nope!"
#   end




