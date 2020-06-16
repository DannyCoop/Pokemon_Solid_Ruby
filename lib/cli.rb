class Cli

  @trainer = nil
  
  def start
    
  end

  def make_new_trainer

  end

  def choose_opponent

  end

  def battle

  end

  def post_battle

  end

  def welcome
    puts "Welcome to Pokemon Battle Simulator. Please enter your name"
  end

  def returning_player
    list = ["y", "n"]
    puts "Do you have a save file? y/N"
    input = get_valid_input(list) 
    

  end

  # def
  
  #   if yn == 'y'
  #     puts "Please enter your trainer name"
  #     name = gets.chomp    
  #     if trainer = Trainer.find_by(name: name)
  #       binding.pry
  #       pokemon_list = TrainerPokemon.where(trainer_id: trainer.id)
  #       puts "These are the Pokemon you have captured so far:"
  #       print pokemon_list.join(', ')
  #       return trainer
  #     end
  #   else
  #     puts "Please enter a name for your trainer"
  #     name = gets.chomp
  #     Trainer.create(name: name)
  #   end
  # end

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
