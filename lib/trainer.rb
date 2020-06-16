class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons

  def pick_pokemon
    Pokemon.list_all
    puts "Pick your first pokemon from the list above!!"
    loop do
      name = gets.chomp
      if pokemon = Pokemon.find_by(name: name) 
        TrainerPokemon.create(trainer_id: self.id, pokemon_id: pokemon.id)
        break
      elsif name == "help"
        # puts Game.help
        puts "help commands will go here"

      elsif name == "relist"
        Pokemon.list_all
      else
        puts "That is not one of the options. Please try again."
      end
    end
  end

  def show_pokemon
    tp_list = TrainerPokemon.where(trainer: self)
    tp_list.each do |tp|
      puts tp.pokemon.name
      tp.moves.each do |move|
        puts "  " + move.name
      end
    end
    nil
  end

  def list_opponents
    trainer_list = Trainer.all.select {|trainer| trainer != self}
    trainer_list.each do |trainer|
      puts trainer.name
      trainer.trainer_pokemons.each do |tp|
        puts "  " + tp.pokemon.name
      end
    end
    nil
  end
end
