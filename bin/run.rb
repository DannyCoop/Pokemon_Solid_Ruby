require_relative '../config/environment'
require 'pry'

def welcome
  puts "Welcome to Pokemon Battle Simulator. Please enter your name"
  puts "Do you have a save file? y/N"
  yn = gets.chomp.downcase

  if yn == 'y'
    puts "Please enter your trainer name"
    name = gets.chomp    
    if trainer = Trainer.find_by(name: name)
      binding.pry
      pokemon_list = TrainerPokemon.where(trainer_id: trainer.id)
      puts "These are the Pokemon you have captured so far:"
      print pokemon_list.join(', ')
      return trainer
    end
  else
    puts "Please enter a name for your trainer"
    name = gets.chomp
    Trainer.create(name: name)
  end
end



trainer = welcome()
trainer.pick_pokemon

