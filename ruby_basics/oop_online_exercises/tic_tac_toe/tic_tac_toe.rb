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