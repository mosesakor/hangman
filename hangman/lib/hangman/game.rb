require 'yaml'
require_relative 'parser.rb'
require_relative 'board.rb'
include Hangman

module Hangman
    class Game
        attr_accessor :player, :board1, :parser, :prev_guesses
        def initialize(player, board1 = Board.new, parser = Parser.new)
            @player = player
            @board1 = board1
            @parser = parser
            @board = nil
            @guess = nil
            @word = nil
            @prev_guesses = []
            @correct_guess = []
            @rounds = 3
        end

        def get_playername
            player_name = gets.chomp
            @player = Hangman::Player.new(player_name)
        end

        def guess_process
            loop do
                @guess = board1.get_guess
                if board1.invalid_guess?(@guess, @prev_guesses)
                    puts "#{@player.name} Letter #{@guess} has already been used."
                else
                    prev_guesses.push(@guess)
                    break
                end
            end
        end

        def incorrect_guess?
            @correct_guess.empty?
        end

        def game_over_message(status)
            if status == :winner
                puts "#{@player.name} won!"
                @rounds = 0
            end
            puts "You lose. It was #{@word}" if status == :nowinner
        end

        def clear_correct_guess
            @correct_guess = []
        end

        def display_board
            puts @board
        end



        def save_game
            puts "Save file as: "
            file_name = gets.chomp
            File.open(file_name + ".yml", "w") {|file| file.write({
                :player => @player,
                :word => @word,
                :board => @board,
                :prev_guesses => @prev_guesses,
                :rounds => @rounds
        }.to_yaml)}
        end

        def set_game_state(hash)
            @player = hash.fetch(:player)
            @word = hash.fetch(:word)
            @board = hash.fetch(:board)
            @prev_guesses = hash.fetch(:prev_guesses)
            @rounds = hash.fetch(:rounds)
        end



        def load_game
            puts "Enter file to load: "
            file_name = gets.chomp
            p save_file = YAML.load(File.read(file_name + ".yml"))
            set_game_state(save_file)
            simulate_game
        end
    
        def simulate_game
            while @rounds > 0
                puts @rounds
                guess_process
                if board1.check_guess(@guess, @word, @correct_guess) == :save 
                    save_game
                    next
                end
                if incorrect_guess?
                    @rounds -= 1
                    puts "#{@player.name} Letter #{@guess} does not exist."
                    game_status = board1.gameover(@rounds, board1.incomplete_board?(@board))
                    game_over_message(game_status)
                    next
                end
                board1.update_board(@guess, @board, @correct_guess)
                display_board
                clear_correct_guess
                game_status = board1.gameover(@rounds, board1.incomplete_board?(@board))
                game_over_message(game_status)
            end
        end

        def play
            @word = parser.set_word
            puts @word
            @board = board1.generate_board(@word)
            puts "Load saved game?: "
            load = gets.chomp
            if load == "yes"
                load_game
            else
                simulate_game
            end
        end
    end
end
