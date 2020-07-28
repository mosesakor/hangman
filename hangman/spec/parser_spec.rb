require "spec_helper"

module Hangman
    RSpec.describe Parser, "value" do

        context "#initialize" do
            it "loads a dictionary of words into an array" do
                parser = Parser.new
                expect(parser.load_dictionary.instance_of? Array).to eq true
            end

            it "filters the dictionary for correct type of word" do
                parser = Parser.new
                expect(parser.filter_dictionary[0].length).to be_between(5, 12) 
            end

            it "sets the word for the game" do
                parser = Parser.new
                expect(parser.set_word.instance_of? String).to eq true
            end

            


        end
    end
end
