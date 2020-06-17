class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons


  def list_pokemon
    puts Pokemon.list_all
  end

  def pick_from_roster
    puts "pick a pokemon from your roster or enter 'choose new pokemon'"
    # binding.pry
    show_pokemon_with_moves
    input = get_valid_input(list_my_pokemon.push("choose new pokemon"))
    if input == "choose new pokemon"
      list_pokemon
      pick_pokemon(Pokemon.list_all)
    else
      puts input
      # binding.pry
      return TrainerPokemon.find_by(trainer_id: self.id, nickname: input)
    end
  end

  def pick_first_pokemon
    puts "Pick your first pokemon from the list above!!"
    list_pokemon
    pick_pokemon(Pokemon.list_all)
    # picked_mon = pick_pokemon(Pokemon.list_all)
    # picked_mon.pick_moves
  end

  def pick_pokemon(list_of_names)
    name = get_valid_input(list_of_names)
    pokemon = Pokemon.find_by(name: name) 
    TrainerPokemon.create(trainer_id: self.id, pokemon_id: pokemon.id, nickname: pokemon.name)
    # Maybe ???? self.show_pokemon
  end

  def show_pokemon_with_moves
    tp_list = TrainerPokemon.where(trainer: self)
    # binding.pry 
    tp_list.each do |tp|
      puts tp.nickname
      tp.moves.each do |move|
        puts "  " + move.name
      end
    end
    nil
  end

  def list_my_pokemon
    tp_list = TrainerPokemon.where(trainer: self)
    tp_list.map do |tp|
      tp.nickname
    end
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
