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
    return get_valid_input(list) == "y"
  end

  def set_trainer
    if returning_player
      get_save_file
    else
      make_new_trainer
    end

  end

  def get_save_file
      puts "Please enter your trainer name"
      @trainer = get_valid_input(Trainer.list_all)
  end 

  def make_new_file
      puts "Please enter a name for your trainer"
      name = gets.chomp
      @trainer = Trainer.create(name: name)
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
