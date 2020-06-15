class Pokemon < ActiveRecord::Base
  
  has_many :trainer_pokemons

end
