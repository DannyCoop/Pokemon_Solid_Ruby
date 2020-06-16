class Pokemon < ActiveRecord::Base
  
  has_many :trainer_pokemons

  def self.list_all
    self.all.each do |pokemon|
      puts pokemon.name
    end
  end

end
