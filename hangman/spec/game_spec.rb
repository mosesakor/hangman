require "spec_helper"

module Hangman
    RSpec.describe Game, "value" do
        
        context "#initialize" do

            it "initializes the player class" do
                player = Player.new("moe")
                expect(player.name).to eq("moe")
            end
        end

    end
end


