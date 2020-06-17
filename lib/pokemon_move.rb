class PokemonMove < ActiveRecord::Base

  belongs_to :move
  belongs_to :trainer_pokemon

  def pick_moves
    @moves = []
    puts Move.list_all
    until @moves.length == 4
      puts "Pick a move. (#{4 - @moves.length}) picks left"
      move = gets.chomp
      if check_input(Move.list_all, move)
        @moves << move
      else
        puts "Please try again"
      end
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

  #  def check_input(valid_list, input)
  #    if !valid_list.include?(input)
  #      puts "That is not one of the options"
  #    else
  #      true
  #    end
  #  end

end
