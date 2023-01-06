string = "hello"
dictionary = ["hell", "hello", "he", "hi", "bye"]

substrings = []

i = 0
while i < string.length do
    substrings.push(string[0..i])
    i += 1
end

substrings

the_substrings = dictionary.select do |element|
   substrings.include?(element)
end

the_substrings