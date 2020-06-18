class TrainerPokemon < ActiveRecord::Base

  belongs_to :pokemon
  belongs_to :trainer
  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves

  def pick_moves
    moves = []
    puts Move.list_all
    until moves.length == 4
      puts "Pick a move. (#{4 - moves.length}) picks left"
      move = get_valid_input(Move.list_all)
      moves << move
    end

    moves.each do |string|
      move = Move.find_by(name: string)
      PokemonMove.create(trainer_pokemon: self, move: move)
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

  def list_pokemon_moves
    self.moves.map do |move|
      move.name
    end
  end

  def pick_move
    puts "Choose a move from the list"
    puts list_pokemon_moves
    move = get_valid_input(list_pokemon_moves)
    puts "#{self.nickname} used #{move}!"
    Move.find_by(name: move)
  end

  def pick_random_move
    move = list_pokemon_moves.sample
    puts "#{self.nickname} used #{move}!"
    Move.find_by(name: move)
  end

  def calculate_health(move)
    damage = move.damage
    self.hp -= damage
    puts "#{self.nickname} took #{damage} points of damage. Now at #{hp < 0 ? 0 : hp} hp."
  end
end
