require "spec_helper"

module Hangman
    RSpec.describe Cell, "#value" do

        context "#initialize" do
          it "is initialized with a value of '_' by default" do
            cell = Cell.new
            expect(cell.value).to eq '_'
          end
        end

    end
end
