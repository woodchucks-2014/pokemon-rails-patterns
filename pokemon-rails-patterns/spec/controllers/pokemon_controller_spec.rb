require "spec_helper"

describe PokemonController do
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

  describe "GET #index" do
    it "returns success" do
      get :index
      expect(response).to be_success
    end

    it "sets captured pokemons" do
      get :index
      expect(assigns(:captured_pokemon)).to eq([captured_pokemon])
    end

    it "sets free pokemons" do
      get :index
      expect(assigns(:free_pokemon)).to eq([free_pokemon])
    end
  end

  describe "POST #catch" do
    it "sets pokemon's caught to true" do
      post :catch, id: free_pokemon.id
      expect(free_pokemon.reload.caught).to be_true
    end

    it "calls catch on the pokemon" do
      post :catch, id: free_pokemon.id
      expect(free_pokemon).to receive(:catch)
    end
  end

  #it "creates a pokemon" do
    #expect {
      #post :create, { name: 'rebecca', type: 'electric' }
    #}.to change(Pokemon, :count).by(1)
  #end

end
