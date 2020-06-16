class PokemonMove < ActiveRecord::Base

  belongs_to :move
  belongs_to :trainer_pokemon

  def pick_moves
    puts Move.list_all
    puts "Pick one of your move. (4) left"
    move1 = gets.chomp
    puts "Pick moves (3) left"
    move2 = gets.chomp
    puts "Pick moves (2) left"
    move3 = gets.chomp
    puts "Pick moves (1) left"
    move4 = gets.chomp
    
  end

  def check_input(valid_list, input)
    if !valid_list.include?(input)
      puts "That is not one of the options"
    end
  end

end
