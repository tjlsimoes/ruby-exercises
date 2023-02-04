module Hangman

    class Game

        def initialize
            @secret_word = ""
            @available_letters = []
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


        def play

            puts "Hangman initialized"

            get_secret_word

            p @secret_word

            get_available_letters

            p @available_letters

            i = 0
            while i < 5

                puts "Guess the secret word or one of its letters."
                puts "You have #{5 - i} remaining attempts."
                puts conceal_secret_word

                user_input = gets.chomp.downcase

                if user_input == @secret_word

                    puts "Congratulations, you have guessed it!"
                    puts "The secret word was: #{@secret_word}."
                    return

                elsif @secret_word.split("").include?(user_input)

                    if available_letters_empty?(user_input)
                        puts "Congratulations, you have guessed it!"
                        puts "The secret word was: #{@secret_word}."
                        return
                    else 
                        puts "You guessed one letter!"
                        @available_letters = @available_letters - [user_input]
                    end

                else
                    "Let your input be valid!"
                end


                i += 1
            end
            
            puts "Game over."
            puts "The secret word was: #{@secret_word}"
            puts "You came this far: #{conceal_secret_word}"
            
        end
    end
end

include Hangman

Game.new.play