root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/hangman.rb"

moe = Hangman::Player.new("moe")
Hangman::Game.new(moe).play