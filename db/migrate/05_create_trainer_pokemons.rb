class CreateTrainerPokemons < ActiveRecord::Migration[5.2]
    def change
        create_table :trainer_pokemons do |t|
            t.integer :trainer_id
            t.integer :pokemon_id
        end
    end
end