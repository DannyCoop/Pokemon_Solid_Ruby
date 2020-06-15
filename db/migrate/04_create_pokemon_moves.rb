class CreatePokemonMoves < ActiveRecord::Migration[5.2]
    def change
        create_table :pokemon_moves do |t|
            t.integer :move_id
            t.integer :trainer_pokemon_id
        end
    end
end 