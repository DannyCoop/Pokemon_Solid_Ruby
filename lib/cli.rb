class Cli

  attr_accessor :trainer, :poke, :opponent, :opponent_poke

  def start
    welcome
    set_trainer
    battle_prep
    battle
  end

  def battle_prep
    @poke = @trainer.pick_from_roster
    @trainer.list_opponents
    @opponent = @trainer.pick_opponent
    @opponent_poke = @opponent.pick_random_pokemon
    puts "Your opponent is #{@opponent.name}!. #{@opponent.name} sent out #{@opponent_poke.nickname}!"
  end

  def battle
    order = turn_order
    first, second = order[0], order[1]
    while (@poke.hp > 0 && @opponent_poke.hp > 0)
      puts "#{@poke.nickname} currently has #{@poke.hp} hp.\n\n#{@opponent_poke.nickname} currently has #{@opponent_poke.hp} hp."
      move = first.pick_move
      second.calculate_health(move)
      move2 = second.pick_random_move
      first.calculate_health(move2)
    end
  end

  def turn_order
    [@poke, @opponent_poke].shuffle
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
