class Trainer < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons


  def list_pokemon
    puts Pokemon.list_all
  end

  def pick_from_roster
    puts "pick a pokemon from your roster or enter 'choose new pokemon'"
    show_pokemon_with_moves
    input = get_valid_input(list_my_pokemon_nicknames.push("choose new pokemon"))
    if input == "choose new pokemon"
      list_pokemon
      pick_pokemon(Pokemon.list_all)
    else
      puts input
      return TrainerPokemon.find_by(trainer_id: self.id, nickname: input)
    end
  end

  def pick_random_pokemon
    poke_list = list_my_pokemon
    poke_list.sample
  end

  def pick_first_pokemon
    puts "Pick your first pokemon from the list above!!"
    list_pokemon
    pick_pokemon(Pokemon.list_all)
  end

  def pick_pokemon(list_of_names)
    name = get_valid_input(list_of_names)
    pokemon = Pokemon.find_by(name: name)  
    picked_mon = TrainerPokemon.create(trainer_id: self.id, pokemon_id: pokemon.id, nickname: pokemon.name, hp: pokemon.base_hp)
    puts "Would you like to give your pokemon a nickname? y/n"
    yn = get_valid_input(['y','n'])
    if yn == 'y'
      puts "Enter the nick name here"
      nickname = gets.chomp
      picked_mon.update(nickname: nickname)
    end
    picked_mon.pick_moves
    picked_mon
    # Maybe ???? self.show_pokemon
  end

  def show_pokemon_with_moves
    tp_list = TrainerPokemon.where(trainer: self)
    tp_list.each do |tp|
      puts tp.nickname
      tp.moves.each do |move|
        puts "  " + move.name
      end
    end
    nil
  end

  def list_my_pokemon
    TrainerPokemon.where(trainer: self)
  end

  def list_my_pokemon_nicknames
    tp_list = TrainerPokemon.where(trainer: self)
    tp_list.map do |tp|
      tp.nickname
    end
  end

  def show_my_pokemon_nicknames
    list_my_pokemon_nicknames.each do |name|
      puts name
    end
  end 

  def show_opponents_with_pokemon
    opponents = list_opponents
    opponents.each do |opponent|
      puts opponent.name
      opponent.trainer_pokemons.each do |tp|
        puts "  " + tp.nickname
      end
    end
    nil
  end

  def opponent_names
    opponents = list_opponents
    opponents.map do |opponent|
      opponent.name
    end
  end

  def list_opponents
    Trainer.all.select {|trainer| trainer != self}
  end

  def pick_opponent
    system "clear"
    puts "Who will you challenge?"
    show_opponents_with_pokemon
    opponent_name = get_valid_input(opponent_names)
    Trainer.find_by(name: opponent_name)
  end

  def self.list_all
    self.all.map do |trainer|
      trainer.name
    end
  end

  def get_valid_input(valid_list)
    loop do 
      input = $stdin.gets.chomp
      if valid_list.include?(input)
        return input
      else
        puts "That is not one of the options"
      end
    end
  end
end
