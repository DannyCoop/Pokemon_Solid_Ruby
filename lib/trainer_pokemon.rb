class TrainerPokemon < ActiveRecord::Base
  
  belongs_to :pokemon
  belongs_to :trainer
  has_many :pokemon_moves

end
