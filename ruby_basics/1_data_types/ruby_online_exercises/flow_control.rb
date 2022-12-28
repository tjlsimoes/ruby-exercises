# def id_num_range ()
#     puts "Insert a number."
#     num = gets.to_i
#    if (0 >= num && num <= 50) 
#     puts("It is between 0 and 50, including.")
#    elsif (50 >= num && num <= 100) 
#     puts("It is between 50 and 100, including.")
#    elsif (num > 100)
#     puts("It is greater than 100.")
#    end

# end

# id_num_range()

puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

if number < 0
  puts "You can't enter a negative number!"
elsif number <= 50
  puts "#{number} is between 0 and 50"
elsif number <= 100
  puts "#{number} is between 51 and 100"
else
  puts "#{number} is above 100"
end

FALSE

Did you get it right?

Alright now!

Error
Error ----- FALSE
FALSE
true
FALSE
true