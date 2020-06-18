all_the_pokemon = "Bulbasaur
Ivysaur
Venusaur
Charmander
Charmeleon
Charizard
Squirtle
Wartortle
Blastoise
Caterpie
Metapod
Butterfree
Weedle
Kakuna
Beedrill
Pidgey
Pidgeotto
Pidgeot
Rattata
Raticate
Spearow
Fearow
Ekans
Arbok
Pikachu
Raichu
Sandshrew
Sandslash
Nidoran♀
Nidorina
Nidoqueen
Nidoran♂
Nidorino
Nidoking
Clefairy
Clefable
Vulpix
Ninetales
Jigglypuff
Wigglytuff
Zubat
Golbat
Oddish
Gloom
Vileplume
Paras
Parasect
Venonat
Venomoth
Diglett
Dugtrio
Meowth
Persian
Psyduck
Golduck
Mankey
Primeape
Growlithe
Arcanine
Poliwag
Poliwhirl
Poliwrath
Abra
Kadabra
Alakazam
Machop
Machoke
Machamp
Bellsprout
Weepinbell
Victreebel
Tentacool
Tentacruel
Geodude
Graveler
Golem
Ponyta
Rapidash
Slowpoke
Slowbro
Magnemite
Magneton
Farfetch'd
Doduo
Dodrio
Seel
Dewgong
Grimer
Muk
Shellder
Cloyster
Gastly
Haunter
Gengar
Onix
Drowzee
Hypno
Krabby
Kingler
Voltorb
Electrode
Exeggcute
Exeggutor
Cubone
Marowak
Hitmonlee
Hitmonchan
Lickitung
Koffing
Weezing
Rhyhorn
Rhydon
Chansey
Tangela
Kangaskhan
Horsea
Seadra
Goldeen
Seaking
Staryu
Starmie
Mr. Mime
Scyther
Jynx
Electabuzz
Magmar
Pinsir
Tauros
Magikarp
Gyarados
Lapras
Ditto
Eevee
Vaporeon
Jolteon
Flareon
Porygon
Omanyte
Omastar
Kabuto
Kabutops
Aerodactyl
Snorlax
Articuno
Zapdos
Moltres
Dratini
Dragonair
Dragonite
Mewtwo
Mew".split("\n")

all_the_pokemon.each do |pokemon|
    Pokemon.create(name: pokemon, base_hp: (300..355).to_a.sample)
end


danny_coop = Trainer.create(name: "Danny Coop")
ian_mac = Trainer.create(name: "Ian MacKinnon")
andy = Trainer.create(name: "Andy")
catrina = Trainer.create(name: "Catrina Friday")
chine_anike = Trainer.create(name: "Chine Anikwe")
dave_frame = Trainer.create(name: "Dave Frame")
david_chung = Trainer.create(name: "David Chung")
diego_zegarra = Trainer.create(name: "Diego Zegarra")
esther_kang = Trainer.create(name: "Esther Kang")
issa = Trainer.create(name: "Issa")
jolie_brown = Trainer.create(name: "Jolie Brown")
jordan_schraeder = Trainer.create(name: "Jordan Schraeder")
johnathan = Trainer.create(name: "Johnathan")
kosi = Trainer.create(name: "Kosi")
luis_fernandez = Trainer.create(name: "Luis Fernandez")
maddie = Trainer.create(name: "Maddie")
marcos_velasco = Trainer.create(name: "Marcos Velasco")
michael_jester = Trainer.create(name: "Michael Jester")
mike_causey = Trainer.create(name: "Mike Causey")
paul_nicholsen = Trainer.create(name: "Paul Nicholsen")
shannon = Trainer.create(name: "Shannon")
shawn_alxander = Trainer.create(name: "Shawn Alexander")
solomon = Trainer.create(name: "Solomon")
steve_pesce = Trainer.create(name: "Steve Pesce")
su = Trainer.create(name: "Su")
matine = Trainer.create(name: "Matine")
tien_phan = Trainer.create(name: "Tien Phan")
zara = Trainer.create(name: "Zara")

water_gun = Move.create(name: "Water Gun", damage: 40)
tackle = Move.create(name: "Tackle", damage: 40)
ember = Move.create(name: "Ember", damage: 40)
pound = Move.create(name: "Pound", damage: 40)
karate_chop = Move.create(name: "karate Chop", damage: 50)
double_slap = Move.create(name: "Double Slap", damage: 30)
flamethrower = Move.create(name: "Flamethrower", damage: 90)
thunderbolt = Move.create(name: "Thunderbolt", damage:90)
mega_punch = Move.create(name: "Mega Punch", damage: 80)
pay_day = Move.create(name: "Pay Day", damage: 40)
fire_punch = Move.create(name: "Fire Punch", damage: 75)
scratch = Move.create(name: "Scratch", damage: 40)
cut = Move.create(name: "Cut", damage: 50)
fly = Move.create(name: "Fly", damage: 90)
wing_attack = Move.create(name: "Wing Attack", damage: 25)
ice_beam = Move.create(name: "Ice Beam", damage: 90)
surf = Move.create(name: "Surf", damage: 90)
razor_leaf = Move.create(name: "Razor Leaf", damage: 55)
confusion = Move.create(name: "Confusion", damage: 50)
psychic = Move.create(name: "Psychic", damage: 90)
earthquake = Move.create(name: "Earthquake", damage: 100)
rage = Move.create(name: "Rage", damage: 20)
fire_blast = Move.create(name: "Fire Blast", damage: 110)
waterfall = Move.create(name: "Waterfall", damage: 80)
bubble = Move.create(name: "Bubble", damage: 40)
crabhammer = Move.create(name: "Crabhammer", damage: 100)
rock_slide = Move.create(name: "Rock Slide", damage: 75)
hyper_fang = Move.create(name: "Hyper Fang", damage: 80)
tri_attack = Move.create(name: "Tri Attack", damage: 80)
slash = Move.create(name: "Slash", damage: 70)



words = "ability able about above accept according account across act action activity actually add address administration admit adult affect after again against age agency agent ago agree agreement ahead air all allow almost".split(" ")

Trainer.all.each do |t|
    temp_poke = Pokemon.all.sample
    TrainerPokemon.create(trainer_id: t.id, pokemon_id: temp_poke.id, nickname: words.sample, hp: temp_poke.base_hp)
end

TrainerPokemon.all.each do |tp|
    temp_move = Move.all.sample
    PokemonMove.create(move_id: temp_move.id, trainer_pokemon_id: tp.id)
end

# tp1 = TrainerPokemon.create(trainer_id: ian_mac.id, pokemon_id: squirtle.id, nickname: "nickname", hp: squirtle.base_hp)
# tp2 = TrainerPokemon.create(trainer_id: danny_coop.id, pokemon_id: charmander.id, nickname: "notname", hp: charmander.base_hp)

# pm1 = PokemonMove.create(move_id: water_gun.id, trainer_pokemon_id: tp1.id)
# pm2 = PokemonMove.create(move_id: tackle.id, trainer_pokemon_id: tp2.id)


# squirtle = Pokemon.create(name: "Squirtle", base_hp: 123)
# charmander = Pokemon.create(name: "Charmander", base_hp: 125)
# bulbasaur = Pokemon.create(name: "Bulbasaur", base_hp: 120)



