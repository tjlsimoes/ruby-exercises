module Mastermind

    class Game

        attr_reader :secret_code, :available_colors

        def initialize
            @available_colors = ["black", "white", "red", "blue", "green", "orange"]
            @secret_code = @available_colors.sample(4)
        end
    
        def get_color_from_user

            loop do
                puts "Choose one of the available colours."
                colour = gets.chomp.downcase
                return colour if @available_colors.include?(colour)
                    puts "The colour you have entered is not available. Choose one of the available colours."
            end

        end

        def combination_match?(combo)
            combo == @secret_code
        end
        
        def play

            puts secret_code

            i = 1
            while i < 13

                puts "\nYou have #{13 - i} attempts to guess the secret code."
            
                combination = []
                4.times {combination << get_color_from_user }
                
                if combination_match?(combination)
                    puts "\nSuccess! You've discovered the secret code!"
                    puts "The secret code was: #{secret_code.join(" ")}." 
                    return
                else 
                    puts "Your combination doesn't match the secret code."
                    puts "Your combination was: #{combination.join(" ")}."
                end
                
                i += 1
            end


        end

    end

end

include Mastermind

Game.new.play

