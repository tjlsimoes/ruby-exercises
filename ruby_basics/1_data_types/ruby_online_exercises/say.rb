# puts "hello"
# puts "hi"
# puts "how are you"
# puts "I'm fine"

# def say(words = "hello")
#     puts words + "."
# end

# say()
# say("hello")
# say("hi")
# say("how are you")
# say("I'm fine")

# Many Rubyists will leave off parentheses when calling methods as a style choice. For example, say() could be rewritten as just say. With arguments, instead of say("hi"), it could just be say "hi". This leads to more fluid reading of code, but sometimes it can be confusing. Keep that in mind when you're reading Ruby; it can get tricky deciphering between local variables and method names!



# a = [1, 2, 3]

# def mutate(array)
#     array.pop
# end

# p "Before mutate method: #{a}"

# p mutate(a)

# p "After mutate method: #{a}"


# def no_mutate(array)
#     array.last
# end

# p "Before no_mutate method: #{a}"

# no_mutate(a)

# p "After no_mutate method: #{a}"


# def add_three(number)
#     return number + 3
#     number + 4
# end

# returned_value = add_three(4)
# puts returned_value

# def just_assignment(number)
#     foo = number + 3
# end


# def add_three(n)
#     new_value = n + 3
#     puts new_value
#     new_value
# end

# add_three(5).times {puts "will this work?"}
# add_three(5).times {puts "this should print 8 times"}



# def add(a, b)
#     a + b 
# end

# def subtract(a, b)
#     a - b 
# end

# def multiply(num1, num2)
#     num1 * num2
# end

# add(20, 45)
# subtract(80, 10)

# multiply(add(20, 45), subtract(80, 10))





# def greeting(name)
#     "Hallo #{name}!"
# end

# puts greeting("James")




# 2
# nil
# "Joe"
# "four"
# nil




# def multiply(a, b)
#     a * b
# end

# puts multiply(1, 6)




def scream(words)
    words = words + "!!!!"
    return puts words
  end
  
scream("Yippeee")

