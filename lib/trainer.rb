class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons


  def list_pokemon
    puts Pokemon.list_all
  end

  def pick_pokemon
    puts "Pick your first pokemon from the list above!!"
    name = get_valid_input(Pokemon.list_all)
    pokemon = Pokemon.find_by(name: name) 
    TrainerPokemon.create(trainer_id: self.id, pokemon_id: pokemon.id)
    # Maybe ???? self.show_pokemon
  end

  def show_pokemon
    puts "Pick a pokemon from your roaster or 'choose new pokemon'"
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

  def self.list_all
    self.all.map do |trainer|
      trainer.name
    end
  end

  def get_valid_input(valid_list)
    loop do 
    input = $stdin.gets.chomp
    # binding.pr!!y
      if valid_list.include?(input)
        return input
      else
        puts "That is not one of the options"
      end
    end
  end
end
