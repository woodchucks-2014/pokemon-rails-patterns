require 'spec_helper'

describe Pokemon do
  let(:captured_pokemon) do
    Pokemon.create(
      name: "Pikachu",
      type: "electric",
      caught: true
    )
  end

  let(:free_pokemon) do
    Pokemon.create(
      name: "Magikarp",
      type: "water"
    )
  end

  describe ".free" do
    it "includes free pokemon" do
      expect(Pokemon.free).to include(free_pokemon)
    end

    it "doesn't include caught pokemon" do
      expect(Pokemon.free).to_not include(captured_pokemon)
    end
  end

  describe "#catch" do
    context "when type hasn't been caught before" do
      it "sets caught to true" do
        free_pokemon.catch
        expect(free_pokemon.reload.caught).to be_true
      end
    end

    context "when type has been caught twice already" do
      before do
        2.times do |n|
          Pokemon.create(
            name: n.to_s,
            type: free_pokemon.type,
            caught: true
          )
        end

        it "doesn't set caught to true" do
          free_pokemon.catch
          expect(free_pokemon.reload.caught).to be_false
        end
      end
    end
  end
end
