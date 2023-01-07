string = "Howdy partner, sit down! How's it going?"
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

string_words = string.downcase.split

the_substrings = []

j = 0

while j < dictionary.length 

    i = 0
    while i < string_words.length
        if (string_words[i].include?(dictionary[j].downcase) == true)
            the_substrings.push(dictionary[j])
        end
        i += 1
    end

    j += 1
end

the_substrings.reduce(Hash.new(0)) do |hash_substrings, element|
    hash_substrings[element] += 1
    hash_substrings
  end

