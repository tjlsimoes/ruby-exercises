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

        def any_colour_match?(combo)
            combo.any? {|colour| @secret_code.include?(colour)}
        end

        def colour_and_pos_matches(combo)

            exactly_pos_colours = []

            i = 0
            while i < 4
                if combo[i] == @secret_code[i]
                    exactly_pos_colours << combo[i]
                end

                i += 1
            end

            exactly_pos_colours
        end

        def colour_matches(combo)

            correct_colours = []

            i = 0
            while i < 4
                if @secret_code.include?(combo[i])
                    correct_colours << combo[i]
                end
                
                i += 1
            end

            correct_colours
            
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
                elsif any_colour_match?(combination)

                    just_correct_colours = colour_matches(combination) - colour_and_pos_matches(combination)
                    num_just_correct_colours = just_correct_colours.length

                    num_exactly_pos_colours = colour_and_pos_matches(combination).length

                    puts "\nYour combination doesn't match the secret code."
                    puts "Your combination was: #{combination.join(" ")}."
                    puts ("You have #{num_exactly_pos_colours} correctly located colours\nand #{num_just_correct_colours} just correct colours.")
                    
                    # puts "These are the just correct colours: #{just_correct_colours}."
                    # puts "The are the correctly positioned colours: #{colour_and_pos_matches(combination)}"

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

