class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons

  def pick_pokemon
    puts Pokemon.list_all
    puts "Pick your first pokemon from the list above!!"
    name = gets.chomp
    if pokemon = Pokemon.find_by(name: name) 
      TrainerPokemon.new(self.trainer_id, pokemon.pokemon_id)
    elsif name = "help"
      puts Game.help
    else
      puts "That is not one of the options"
    end
  end
end
