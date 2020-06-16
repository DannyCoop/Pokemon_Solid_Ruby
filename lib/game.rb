#require_all '../lib'
class Game

  attr_accessor :state
  attr_reader :state_hash

  def initialize
    @state = 'start'
    @state_hash = {'start' => ['y', 'n', 'list trainers'],
                   'make trainer' => ['list pokemon', 'list moves'],
                   'choose opponent' => ['list opponents', 'list pokemon'],
                   'battle' => ['list moves', 'show hp', 'show opponent hp'],
                   'post battle' => ['stats', 'play again']}
  end

end
