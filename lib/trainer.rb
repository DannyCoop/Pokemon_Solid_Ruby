class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons

  def pick_pokemon
    Pokemon.list_all
    puts "Pick your first pokemon from the list above!!"
    name = gets.chomp
    if pokemon = Pokemon.find_by(name: name) 
      TrainerPokemon.create(trainer_id: self.id,pokemon_id: pokemon.id)
    elsif name == "help"
      # puts Game.help
      puts "help commands will go here"
    elsif name == "relist"
       Pokemon.list_all
    else
      puts "That is not one of the options"
    end
  end
end
