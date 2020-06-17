squirtle = Pokemon.create(name: "Squirtle", base_hp: 101)
charmander = Pokemon.create(name: "Charmander", base_hp: 99)

danny_coop = Trainer.create(name: "Danny Cooper")
ian_mac = Trainer.create(name: "Ian MacKinnon")

water_gun = Move.create(name: "Water Gun", damage: 30)
tackle = Move.create(name: "Tackle", damage: 25)
ember = Move.create(name: "Ember", damage: 35)

tp1 = TrainerPokemon.create(trainer_id: ian_mac.id, pokemon_id: squirtle.id, nickname: "nickname", hp: squirtle.base_hp)
tp2 = TrainerPokemon.create(trainer_id: danny_coop.id, pokemon_id: charmander.id, nickname: "notname", hp: charmander.base_hp)

pm1 = PokemonMove.create(move_id: water_gun.id, trainer_pokemon_id: tp1.id)
pm2 = PokemonMove.create(move_id: tackle.id, trainer_pokemon_id: tp2.id)
