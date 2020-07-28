require "spec_helper"

module Hangman
    RSpec.describe Board, "#value" do

        context "#initialize" do

          it "sets a board" do
            board = Board.new
            expect(board.board.length).to be_between(5,12)
          end

          it "gets a new guess" do
            input = StringIO.new("a")
            board = Board.new
            expect(board.get_guess(input)).to eq("a")
          end

          it "checks if the user guess is correct or not" do
            board = Board.new
            expect(board.check_guess.instance_of? Array).to eq(true)
          end

        end
    end
end
