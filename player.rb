require_relative 'game_play.rb'

class Player
  attr_accessor :mode

  def initialize(mode)
    @mode = mode
  end

  def player_input
    game = GamePlay.new(@mode)
    player_input = []
    game.print_instruction(mode)
    4.times do
      user_input = gets.chomp
      user_input = correct_user_input(user_input)
      player_input.push(user_input)
    end
    puts `clear`
    game.print_user_input(mode, player_input)
    player_input
  end

  def correct_user_input(user_input)
    until COLORS.include? user_input
      puts "This color is not an option"
      puts "Enter your guess! "
      user_input = gets.chomp
    end
    user_input
  end

end