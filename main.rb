class ComputerCodeBreaker
end

class Game
end

require_relative "player.rb"
require_relative "computer_coder.rb"
require_relative "game_play.rb"

COLORS = ["blue", "red", "yellow", "green", "orange", "purple"]
player_guess_history = {}
round = 0
win = false

puts "In what mode do you want to play?"
puts "To create a code presse 1:"
puts "To break a code presse 2:"



game = GamePlay.new(mode)
player = Player.new(mode)
computer = ComputerCoder.new


test = player.player_input
p test 





#code = computer.create_code_computer
#code = ["orange", "red", "green", "red"]
# game play for computer choses code
#until round >= 8 || win
#  round += 1
#  player_guess = player.guess_player
#  evaluation = computer.evaluation(code, player_guess)
#  player_guess_history[player_guess] = evaluation
#  game.print_player_history(player_guess_history)
#  win = game.winning_evaluation(player_guess_history, player_guess)
#  p code
#  if round == 8
#    puts "Sorry the Computer wins"
#  end
#end












