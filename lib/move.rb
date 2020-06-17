class Move < ActiveRecord::Base
  
  has_many :pokemon_moves
  has_many :pokemon, through: :pokemon_moves

  def self.list_all
    self.all.map do |moves|
      moves.name
    end
  end


end
