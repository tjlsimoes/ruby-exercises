alphabet_array = ("a".."z").to_a 
alphabet_array_cap = ("A".."Z").to_a 

string = "hello"

string_array = string.split("")

string_array.reduce("") do |new_string, element|

   if (alphabet_array.include?(element))
    index = alphabet_array.index(element)
    new_string + alphabet_array[index + 2]

   elsif (alphabet_array_cap.include?(element))
    index = alphabet_array_cap.index(element)
    new_string + alphabet_array_cap[index + 2]

   else
    new_string + element 

   end

end
