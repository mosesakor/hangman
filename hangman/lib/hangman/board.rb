module Hangman
    class Board

        def initialize
        end

        def get_guess
            print "Enter a letter: "
            gets.chomp
        end

        def invalid_guess?(guess, prev_guess)
            prev_guess.include?(guess)
        end

        def check_guess(guess, word, correct_guess)
            word.downcase!
            guess.downcase!
            return :save if guess == "save"
            word.split("").each_with_index do |char, index|
                if char == guess
                    correct_guess.push(index)
                end
            end
        end

        def generate_board(word)
            Array.new(word.length) {"_"}
        end

        def update_board(guess, board, correct_guess)
            correct_guess.each do |index|
              board[index] = guess
            end
        end
        
        def incomplete_board?(board)
            board.include?("_")
        end

        def winner?
            return true if !incomplete_board?(board)
        end 

        def gameover(rounds, board)
            return :winner if board == false
            return :nowinner if rounds == 0
            false
        end


        



       # def check_human_guess(human_guess)
       #     current_word.each_with_index do |char, index|
       #     end
       # end


    end
end
