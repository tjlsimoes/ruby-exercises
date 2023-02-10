module Hangman

    require "csv"
    
    class Game

        def initialize
            @secret_word = ""
            @available_letters = []
            @i = 0
        end

        def get_secret_word

            while (@secret_word.length > 12 || 
                        @secret_word.length < 5)

                dictionary = File.readlines("dictionary.txt")

                dictionary.map { |word| word.chomp!}

                @secret_word = dictionary.sample.downcase
            end

            @secret_word
        end

        def get_available_letters

            @available_letters = @secret_word.split("").uniq
            
        end

        def conceal_secret_word
            
            concealed_word = @secret_word.split("")
            
            concealed_word = concealed_word.map do |letter| 
                
                @available_letters.include?(letter) ? letter = "_" : letter

            end

            concealed_word = concealed_word.join(" ")
        end

        def available_letters_empty?(letter)
            (@available_letters - [letter]).length == 0
        end

        def save_game


            filename = "output/hangman_save.txt"

            File.open(filename, "w") do |file|
                file.write ("#{@available_letters.join(" ")}, #{@secret_word},#{@i}")
            end

        end

        def retrieve_saved_data
            
            retrieved_data = File.readlines("output/hangman_save.txt", "r")

            retrieved_data = retrieved_data[0].to_s.split(",")

            # p retrieved_data

            @secret_word = retrieved_data[1].strip!

            # p @secret_word

            @available_letters = get_available_letters - retrieved_data[0].split(" ")

            # p @available_letters

            @i = retrieved_data[2].to_i

        end


        def play

            puts "Hangman initialized"

            puts "Do you want to continue the saved game or play a new one?"
            puts "Write saved to continue saved game or play to play a new one."

            user_input0 = gets.chomp.downcase

            if user_input0 == "saved"

                retrieve_saved_data

            elsif user_input0 == "play"

                get_secret_word

                # p @secret_word

                get_available_letters

                # p @available_letters

            end

            while @i < 5
                
                puts "If you want to save enter the key word save."
                puts "Otherwise try and guess the secret word or one of its letters."
                puts "You have #{5 - @i} remaining attempts."
                puts conceal_secret_word

                user_input1 = gets.chomp.downcase

                if  user_input1 == "save"
                    
                    save_game
                    return

                elsif user_input1 == @secret_word

                    puts "Congratulations, you have guessed it!"
                    puts "The secret word was: #{@secret_word}."
                    return

                elsif @secret_word.split("").include?(user_input1)

                    if available_letters_empty?(user_input1)
                        puts "Congratulations, you have guessed it!"
                        puts "The secret word was: #{@secret_word}."
                        return
                    else 
                        puts "You guessed one letter!"
                        @available_letters = @available_letters - [user_input1]
                    end

                else
                    "Let your input be valid!"
                end


                @i += 1
            end
            
            puts "Game over."
            puts "The secret word was: #{@secret_word}"
            puts "You came this far: #{conceal_secret_word}"
            
        end
    end
end

include Hangman

Game.new.play