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
      move = gets.chomp
      if check_input(Move.list_all, move)
        moves << move
      else
        puts "Please try again"
      end
    end

    moves.each do |string|
      move = Move.find_by(name: string)
      PokemonMove.create(trainer_pokemon: self, move: move)
    end
  end

   def check_input(valid_list, input)
    if !valid_list.include?(input)
      puts "That is not one of the options"
    else
      true
    end
  end

end
