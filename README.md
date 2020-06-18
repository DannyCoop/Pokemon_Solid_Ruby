INTRO
  Me (Daniel) and Ian made a pokemon battle game for our mod one project. 


INSTALL INSTRUCTIONS
  -First you will clone the repo.
  -cd in to that dir
  -Once here run rake db:migrate 
  -Then rake db:seed
  -To test if you have doen everything right run "ruby bin/run.rb" if you see "Do you have a save file y/N".
  -Then you are set

  
FEATURES
  Here is a list of features that we included in our game.
    -Create a trainer with a name.
    -Choose a pokemon 
      -You can nick name the pokemon
      -pick the pokemons moves
    -Saves any past trainer and their pokemon
      -keeps track of the trainer and their pokemon in a data base.
      -keeps track of the pokemons moves & nickname.
      -also keeps track of the changes made to the trainers roster
        -pokemon
        -moves
        -nick name
    -Battle
      -The user can pick the pokemon they want to battle with from their roster.
      -The user can pick any of the past trainers to battle or any of the base seeded trainers.
      -Once in battle the use can select any of ther moves 
      -The enemy trainer will also attack back.
      -Once one of the pokemon's hp has reached 0 the game will declare a winner.
    -View roster
      -Add or chage their pokemon's moves
      -Change their pokemon's nick name
      -Release a pokemon from your roster
    -Add a new pokemon to your roster


