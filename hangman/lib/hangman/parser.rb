module Hangman
    class Parser
        attr_accessor :game_word
        def initialize
            @game_word
        end

        def load_dictionary
            File.open('lib/5desk.txt').readlines
        end

        def filter_dictionary
            load_dictionary.map {|word| word.chomp}.select {|word| word.length >= 5 && word.length <= 12}
        end

        def set_word
            filter_dictionary[rand(filter_dictionary.length)]
        end

        def generate_board
            @game_word = set_word
            Array.new(@game_word.length) {"_"}
        end
    end
end
        