require_relative 'game_play'

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
    player_input
  end

  def correct_user_input(user_input)
    until COLORS.include? user_input
      puts 'This color is not an option'
      puts 'Enter your guess! '
      user_input = gets.chomp
    end
    user_input
  end

  def evaluate
    possibilities = ['black', 'white', '']
    puts ''
    puts 'Please evaluate the computers guess'
    puts 'write black for correct color and correct place'
    puts 'write white for correct color'
    puts 'press enter 2 times when done'

    evaluation = []
    until evaluation[-1] == ''
      user_input = gets.chomp
      until possibilities.include? user_input
        puts 'This is not a valid option'
        puts 'Please use black or white'
        user_input = gets.chomp
      end
      evaluation.push(user_input)
    end
    evaluation.delete_at(-1)
    evaluation
  end
end
