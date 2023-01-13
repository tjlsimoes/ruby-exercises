# arr = [1, 3, 5, 7, 9, 11]
# number = 3

# puts(arr.include?(number))



# # 1
# arr = ["b", "a"]
# arr = arr.product(Array(1..3))
# #    arr.first.delete(arr.first.last) ?

# [b,1][b,2][b,3][a,1][a,2][a,3]

# arr.first = [b,1] #Product is is "destructive".

# arr.first.last = 1

# arr.first.delete(1) = arr.first = [b]

# arr = [[b], [b,2], [b,3], [a, 1], [a, 2], [a, 3]]


# #2
# arr = ["b", "a"]
# arr = arr.product([Array(1..3)])

# [b, [1, 2, 3]] [a, [1, 2, 3]]

# arr.first.delete(arr.first.last)
# arr.first.last = 
# arr.first.delete([1, 2, 3]) => [b] 

# arr = [[b], [a, [1, 2, 3]]]




# How do you return the word "example" from the following array?

# arr = [["test", "hello", "world"],["example", "mem"]]

# arr[1][0]  #or arr.last.first



# 1. Return (first) index of specified element: 3

# 2. Returns an enumerator ... 8? Error.

# 3. 8


# a = "e"
# b = "A"
# c = Error? nil



# array = [1, 2, 3, 4, 5, 6]

# array.each_with_index { |val, idx| puts "#{idx + 1}. #{val}"}





# array = [1, 2, 3, 4, 5, 6]

# tarray = array.map {|x| x + 2}

# p(array)
# p(tarray)

# or

# arr = [1, 2, 3, 4, 5]
# new_arr = []

# arr.each do |n|
#   new_arr << n + 2
# end

# p arr
# p new_arr



