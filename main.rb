

require_relative "player.rb"
require_relative "computer_coder.rb"
require_relative "game_play.rb"
require_relative "game_modes.rb"
require_relative "code_breaking"
require 'timeout' 

COLORS = ["blue", "red", "yellow", "green", "orange", "purple"]
play_again = true

new_game = GameModes.new()


while play_again
  new_game.chose_mode
  play_again = new_game.restart_game
end



# clean up the code 
# use rubocop to clean up some more 




















