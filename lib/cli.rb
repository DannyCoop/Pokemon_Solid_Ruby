class Cli

  attr_accessor :trainer
  
  def start
    welcome
    set_trainer
    @trainer.list_pokemon
    
    choose_opponent
  end

  def choose_opponent
    @trainer.list_opponents
  end

  def battle

  end

  def post_battle

  end

  def welcome
    puts "Welcome to Pokemon Battle Simulator. Please enter your name"
  end
  
  def set_trainer
    if returning_player
      get_save_file
    else
      make_new_file
    end
  end

  def returning_player
    list = ["y", "n"]
    puts "Do you have a save file? y/N"
    return get_valid_input(list) == "y"
  end

  def get_save_file
      puts "Please enter your trainer name"
      trainer = get_valid_input(Trainer.list_all)
      @trainer = Trainer.find_by(name: trainer)
  end 

  def make_new_file
      puts "Please enter a name for your trainer"
      name = $stdin.gets.chomp
      @trainer = Trainer.create(name: name)
      @trainer.pick_first_pokemon
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
