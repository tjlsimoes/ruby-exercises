board = "1 2 3 \n4 5 6 \n7 8 9"

class WinningBoards 
    attr_reader :symbol

    def initialize(symbol)
        @symbol = symbol
    end

    # Horizontal lines:
    def first_win_case?
        board[0, 5] == [@symbol," ", @symbol, " ", @symbol].join
    end

    def second_win_case?
        board[7, 5] == [@symbol," ", @symbol, " ", @symbol].join
    end

    def third_win_case?
        board[14, 5] == [@symbol," ", @symbol, " ", @symbol].join
    end

    # Vertical lines:
    def fourth_win_case?
        board[0] << board[7] << board[14] == [@symbol, @symbol, @symbol].join
    end

    def fifth_win_case?
        board[2] << board[9] << board[16] == [@symbol, @symbol, @symbol].join
    end

    def sixth_win_case?
        board[4] << board[11] << board[18] == [@symbol, @symbol, @symbol].join
    end

    # Diagonal lines:
    def seventh_win_case?
        board[0] << board[9] << board[18] == [@symbol, @symbol, @symbol].join
    end

    def eight_win_case?
        board[14] << board[9] << board[4] == [@symbol, @symbol, @symbol].join
    end
end

p board
x_symbol_win = WinningBoards.new("x")
o_symbol_win = WinningBoards.new("o")

i = 2
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
    puts "Choose an available number and write out the corresponding word!"

    user_input = gets.chomp

    if i.odd?

        if string_conversion.include?(user_input)

            if available_numbers.include?(user_input)

                available_numbers.delete(user_input)

                board[relative_position[user_input]] = "x"
           
            else
                puts "Choose an available number."
            end

        else
            puts "You better not joke around! Try again."
        end

    elsif i.even?

        if string_conversion.include?(user_input)

            if available_numbers.include?(user_input)

                available_numbers.delete(user_input)

                board[relative_position[user_input]] = "o"

            else
                puts "Choose an available number."
            end

        else
            puts "You better not joke around! Try again."
        end

    end

    i += 1
end