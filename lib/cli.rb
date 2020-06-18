class Cli

  attr_accessor :trainer, :poke, :opponent, :opponent_poke

  def start
    welcome
    set_trainer
    start_menu
  end

  def start_menu
    system "clear"
    puts "start battle\nview roster\nexit game"
    valid_inputs = ['start battle', 'view roster', 'exit game']
    input = get_valid_input(valid_inputs)
    case input 
    when valid_inputs[0]
      system "clear"
      battle_prep
    when valid_inputs[1]
      system "clear"
      puts "This is your roster what would you like to do?\n*******************************************************"
      @trainer.show_pokemon_with_moves
      roster_menu
    when valid_inputs[2]
      system "clear"
      abort("Thanks for playing!!")
    end
  end

  def roster_menu
    puts "*******************************************************\nchange nickname\nadd move\nrelease pokemon\nback"
    valid_inputs = ['change nickname', 'add move', 'release pokemon', 'back']
    input = get_valid_input(valid_inputs)
    case input
    when "change nickname"
      @trainer.show_my_pokemon_nicknames
      puts "Whose name would you like to change?"
      name = get_valid_input(@trainer.list_my_pokemon_nicknames)
      puts "What should the new nickname be?"
      my_pokemon = TrainerPokemon.find_by(nickname: name)
      my_pokemon.update(nickname: gets.chomp)
      puts "Here is your updated roster"
      @trainer.show_my_pokemon_nicknames
      roster_menu
    when 'add move'
      @trainer.show_pokemon_with_moves
      puts "Whose moves would you like to edit?"
      name = get_valid_input(@trainer.list_my_pokemon_nicknames)
      if TrainerPokemon.find_by(nickname: name).moves.length >= 4
        puts "Which move would you like change?"
        tp = TrainerPokemon.find_by(nickname: name)
        move = get_valid_input(tp.list_pokemon_moves)
        # puts "What would you like to change it to?"
        PokemonMove.find_by(trainer_pokemon: tp, move: Move.find_by(name: move)).destroy
      end
      puts Move.list_all
      puts "What move would you like to add?"
      new_move = get_valid_input(Move.list_all)
      PokemonMove.create(trainer_pokemon: tp, move: Move.find_by(name: new_move))
      roster_menu
    when 'back'
      start_menu
    when 'release pokemon'
      @trainer.show_my_pokemon_nicknames
      puts "Who would you like to release back in to the wild?"
      name = get_valid_input(@trainer.list_my_pokemon_nicknames)
      released_mon = TrainerPokemon.find_by(nickname: name)
      released_mon.destroy
      system "clear"
      @trainer.show_pokemon_with_moves
      puts "*******************************************************"
      puts "#{name} has been released in to the wild T_T"
      roster_menu
    end

  end

  def menu_input(valid_inputs)
  end

  def battle_prep
    @poke = @trainer.pick_from_roster
    @trainer.list_opponents
    @opponent = @trainer.pick_opponent
    @opponent_poke = @opponent.pick_random_pokemon
    system "clear"
    puts "Your opponent is #{@opponent.name}!. #{@opponent.name} sent out #{@opponent_poke.nickname} the #{@opponent_poke.pokemon.name}!\n*******************************************************\n"
    battle
  end
  
  def battle
    order = turn_order
    first, second = order[0], order[1]
    while (@poke.hp > 0 && @opponent_poke.hp > 0)
      # system "clear"
      puts "  #{@poke.nickname} currently has #{@poke.hp} hp.\n  #{@opponent_poke.nickname} currently has #{@opponent_poke.hp} hp.\n*******************************************************\n"
      if first.trainer == @trainer
        move = first.pick_move
        move2 = second.pick_random_move
      else
        move = first.pick_random_move
        move2 = second.pick_move
      end
      health = second.calculate_health(move)
      if second.hp <= 0
        winner = first
        break
      end
      first.calculate_health(move2)
      if first.hp <= 0
        winner = second
        break
      end
    end
    post_battle(winner)
  end

  def turn_order
    [@poke, @opponent_poke].shuffle
  end

  def post_battle(winner)
    puts "#{winner.trainer.name} won the battle!\n Would you like to play again? y/n"
    yn = get_valid_input(['y','n'])
    if yn == 'y'
      battle_prep
    else
      abort("Thanks for playing!")
    end
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
    system "clear"
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
