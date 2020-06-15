class Move < ActiveRecord::Base
  
  has_many :pokemon_moves
  has_many :pokemon, through: :pokemon_moves

end
