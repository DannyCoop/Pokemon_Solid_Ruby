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

end
