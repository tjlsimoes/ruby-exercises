def caesar_cipher(string, key)

alphabet_array = ("a".."z").to_a 
alphabet_array_cap = ("A".."Z").to_a 

string_array = string.split("")

string_array.reduce("") do |new_string, element|

   if (alphabet_array.include?(element))
    index = alphabet_array.index(element)
    new_index = index + key
    new_index = (((new_index) % 25) - 1) if new_index > 25
    new_string + alphabet_array[new_index]

   elsif (alphabet_array_cap.include?(element))
    index = alphabet_array_cap.index(element)
    new_index = index + key
    new_index = (((new_index) % 25) - 1) if new_index > 25
    new_string + alphabet_array_cap[new_index]

   else
    new_string + element 

   end

end

end

caesar_cipher("What a string!", 5)