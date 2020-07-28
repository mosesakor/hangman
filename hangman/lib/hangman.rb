#require "./version.rb"
require_relative "./hangman/cell.rb"
require_relative "./hangman/board.rb"
require_relative "./hangman/parser.rb"
require_relative "./hangman/game.rb"
require_relative "./hangman/player.rb"

module Hangman
  class Error < StandardError; end
  # Your code goes here...
end
