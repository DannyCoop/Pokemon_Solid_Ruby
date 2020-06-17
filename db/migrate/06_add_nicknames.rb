class AddNicknames < ActiveRecord::Migration[5.2]

    def change
        add_column :trainer_pokemons, :nickname, :string
    end
end