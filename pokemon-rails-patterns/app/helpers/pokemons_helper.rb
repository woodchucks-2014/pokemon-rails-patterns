module PokemonsHelper
  def pokemon_classes(pokemon)
    "#{pokemon.type} pokemon-type"
  end

  def pokemon_form_action(action_type, pokemon)
    if action_type == :captured
      "/release/#{pokemon.id}"
    elsif action_type == :free
      "/catch/#{pokemon.id}"
    end
  end

  def pokemon_submit_text(action_type, pokemon)
    if action_type == :captured
      "Release!"
    elsif action_type == :free
      "Catch!"
    end
  end
end
