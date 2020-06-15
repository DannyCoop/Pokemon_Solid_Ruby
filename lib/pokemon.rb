class Pokemon < ActiveRecord::Base
  
  has_many :trainer_pokemons

  def self.list_all
  end

end
