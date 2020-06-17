class Cli

  attr_accessor :trainer, :poke, :opponent, :opponent_poke

  def start
    welcome
    set_trainer
    start_menu
  end

  def start_menu
    puts "start battle\nview roster"
    valid_inputs = ['start battle', 'view roster']
    input = get_valid_input(valid_inputs)
    case input 
    when valid_inputs[0]
      battle_prep
    when valid_inputs[1]
      @trainer.show_pokemon_with_moves
      roster_menu
    end
  end

  def roster_menu
    puts "change nickname\nchange move\nback"
    valid_inputs = ['change nickname', 'change move', 'back']
    input = get_valid_input(valid_inputs)
    case input
    when 'change nickname'
      @trainer.show_my_pokemon_nicknames
      puts "Whose name would you like to change?"
      name = get_valid_input(@trainer.list_my_pokemon_nicknames)
      puts "What should the new nickname be?"
      my_pokemon = TrainerPokemon.find_by(nickname: name)
      my_pokemon.update(nickname: gets.chomp)
      puts "Here is your updated roster"
      @trainer.show_my_pokemon_nicknames
      roster_menu
    when 'change move'
      @trainer.show_pokemon_with_moves
      puts "Whose moves would you like to change?"
      name = get_valid_input(@trainer.list_my_pokemon_nicknames)
      puts "Which move would you like change?"
      tp = TrainerPokemon.find_by(nickname: name)
      move = get_valid_input(tp.list_pokemon_moves)
      puts "What would you like to change it to?"
      puts Move.list_all
      new_move = get_valid_input(Move.list_all)
      PokemonMove.find_by(trainer_pokemon: tp, move: Move.find_by(name: move)).destroy
      PokemonMove.create(trainer_pokemon: tp, move: Move.find_by(name: new_move))
      roster_menu
    when 'back'
      start_menu
    end

  end

  def menu_input(valid_inputs)
  end

  def battle_prep
    @poke = @trainer.pick_from_roster
    @trainer.list_opponents
    @opponent = @trainer.pick_opponent
    @opponent_poke = @opponent.pick_random_pokemon
    puts "Your opponent is #{@opponent.name}!. #{@opponent.name} sent out #{@opponent_poke.nickname}!"
    battle
  end

  def battle
    order = turn_order
    first, second = order[0], order[1]
    while (@poke.hp > 0 && @opponent_poke.hp > 0)
      puts "#{@poke.nickname} currently has #{@poke.hp} hp.\n#{@opponent_poke.nickname} currently has #{@opponent_poke.hp} hp."
      move = first.pick_move
      second.calculate_health(move)
      if second.hp <= 0
        winner = first
        break
      end
      move2 = second.pick_random_move
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
