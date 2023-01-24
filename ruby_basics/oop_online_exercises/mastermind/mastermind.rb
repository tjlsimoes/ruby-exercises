module Mastermind

    class Game

        attr_reader :secret_code, :available_colors

        def initialize(player_1_class, player_2_class)
            @available_colors = ["black", "white", "red", "blue", "green", "orange"]
            @secret_code = @available_colors.sample(4)

            @players = 
                [player_1_class.new(self), 
                player_2_class.new(self)]
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

        def get_colour_combination(player)
            combination = []
            4.times {combination << player.get_colour }
            combination
        end
        
        def play

            puts secret_code

            i = 1
            while i < 13

                puts "\nYou have #{13 - i} attempts to guess the secret code."
            
                combination = get_colour_combination(@players[0]) # Missing player identification!

                puts combination
                
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
                    puts "\nYou have #{num_exactly_pos_colours} correctly located colours"
                    puts " and #{num_just_correct_colours} just correct colours."
                    
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

    class Player
        def initialize(game)
            @game = game
        end
    end

    class HumanPlayer < Player

        def get_colour
            loop do
                puts "Choose one of the available colours."
                colour = gets.chomp.downcase
                return colour if @game.available_colors.include?(colour)
                    puts "The colour you have entered is not available. Choose one of the available colours."
            end
        end

    end

    class ComputerPlayer < Player

    end
end

include Mastermind

Game.new(HumanPlayer, ComputerPlayer).play

