string = "hello"
dictionary = ["hi", "hello", "he", "hell", "bye", "au revoir"]

the_substrings = dictionary.select do |element|
    string.include?(element)
end

the_substrings.reduce(Hash.new(0)) do |hash_substrings, element|
    hash_substrings[element] += 1
    hash_substrings
  end
