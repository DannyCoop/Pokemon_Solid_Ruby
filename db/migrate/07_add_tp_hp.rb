class AddTpHp < ActiveRecord::Migration[5.2]
  def change
    add_column :trainer_pokemons, :hp, :integer
    rename_column :pokemons, :hp, :base_hp
  end
end
