board = "1 2 3 \n4 5 6 \n7 8 9"


# Horizontal lines:
def first_win_case?(board, symbol)
    board[0, 5] == [symbol," ", symbol, " ", symbol].join
end

def second_win_case?(board, symbol)
    board[7, 5] == [symbol," ", symbol, " ", symbol].join
end

def third_win_case?(board, symbol)
    board[14, 5] == [symbol," ", symbol, " ", symbol].join
end

# Vertical lines:
def fourth_win_case?(board, symbol)
    board[0] << board[7] << board[14] == [symbol, symbol, symbol].join
end

def fifth_win_case?(board, symbol)
    board[2] << board[9] << board[16] == [symbol, symbol, symbol].join
end

def sixth_win_case?(board, symbol)
    board[4] << board[11] << board[18] == [symbol, symbol, symbol].join
end

# Diagonal lines:
def seventh_win_case?(board, symbol)
    board[0] << board[9] << board[18] == [symbol, symbol, symbol].join
end

def eight_win_case?(board, symbol)
    board[14] << board[9] << board[4] == [symbol, symbol, symbol].join
end



i = 3
while i < 15

    available_numbers = 
    ["one", "two", "three", "four", 
    "five", "six", "seven", "eight", "nine"]

    string_conversion = 
        {"one" => 1, "two" => 2, "three" => 3, 
        "four" => 4, "five" => 5, "six" => 6,
        "seven" => 7, "eight" => 8, "nine" => 9}

    relative_position = 
        {"one" => 0, "two" => 2, "three" => 4, 
        "four" => 7, "five" => 9, "six" => 11,
        "seven" => 14, "eight" => 16, "nine" => 18}

    puts board

    if i.odd?

        puts "Player 1! Choose an available number and write out the corresponding word."

        user_input = gets.chomp


        if string_conversion.include?(user_input)

            if available_numbers.include?(user_input)

                available_numbers.delete(user_input)

                board[relative_position[user_input]] = "x"

                win = first_win_case?(board, "x") || second_win_case?(board, "x") || 
                        third_win_case?(board, "x") || fourth_win_case?(board, "x") || 
                        fifth_win_case?(board, "x") || sixth_win_case?(board, "x") ||
                        seventh_win_case?(board, "x") || eight_win_case?(board, "x")
                    
                if win == true
                    puts "Player one has won!"
                    break
                end
          
            else
                puts "Choose an available number."
            end

        else
            puts "You better not joke around! Try again."
        end

    elsif i.even?

        puts "Player 2! Choose an available number and write out the corresponding word."

        user_input = gets.chomp


        if string_conversion.include?(user_input)

            if available_numbers.include?(user_input)

                available_numbers.delete(user_input)

                board[relative_position[user_input]] = "o"

                win = first_win_case?(board, "x") || second_win_case?(board, "x") || 
                        third_win_case?(board, "x") || fourth_win_case?(board, "x") || 
                        fifth_win_case?(board, "x") || sixth_win_case?(board, "x") ||
                        seventh_win_case?(board, "x") || eight_win_case?(board, "x")
                    
                if win == true
                    puts "Player two has won!!"
                    break
                end

            else
                puts "Choose an available number."
            end

        else
            puts "You better not joke around! Try again."
        end

    end

    i += 1
end