module MathHelpers
    def exponent(num, exp)
        num ** exp
    end
end

class Calculator
    include MathHelpers

    def square_root(number)
        exponent(number, 0.5)
    end
end

p Calculator.new.square_root(100)

