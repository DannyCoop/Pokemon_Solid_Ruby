# Pokémon Solid Ruby
Pokémon Solid Ruby is a Ruby CLI application that allows players to partake in simulated Pokemon battles, supports both single and multiplayer battles as well as maintains data persistence. Besides battling, the player is able to create a trainer with an editable roster of pokemon whose names and movesets can be changed.

# Getting started
* Fork and clone the the repo.
* Run 'bundle install'
* Run 'rake db:migrate' to create the database 
* Run 'rake db:seed' to populate your new database with some seed data.
Once you have taken all of the following steps you will have a ready-to-go copy of a digital meetup on your local machine.


# Prerequisites
* Ruby version 2.6.1
* Bundler

# Installing
```
# To install Ruby run this line below
rvm install 2.6.1
# To use that version of ruby run this line below
rvm use 2.6.1
# To make sure it worked run this line below if you get =* ruby-2.6.1 you should be good to go
run rvm list 
```
```
# To install bundler run the line below
gem install bundler
```

# Deployment
```
# To run the application run the line below in your terminal 
ruby bin/run.rb
```

# Built With
* Ruby - Served as the base language
* Active Record - MVC pattern 


# Authors
* [Daniel Cooper](https://github.com/DannyCoop)
* [Ian MacKinnon](https://github.com/ianmcknnn)

