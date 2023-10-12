require_relative 'player'
require_relative 'computer_coder'
require_relative 'game_play'
require_relative 'game_modes'
require_relative 'code_breaking'
require 'timeout'

COLORS = %w[blue red yellow green orange purple]
play_again = true

new_game = GameModes.new

while play_again
  new_game.chose_mode
  play_again = new_game.restart_game
end
