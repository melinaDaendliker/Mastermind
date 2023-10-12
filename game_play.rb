class GamePlay
  attr_accessor :mode

  def initialize(mode)
    @mode = mode
  end

  def print_player_history(player_guess_history)
    player_guess_history.each do |key, value|
      puts "#{key} : #{value}"
    end
  end

  def winning_evaluation(player_guess_history, player_guess, mode)
    if player_guess_history[player_guess].length == 4
      if player_guess_history[player_guess].all? { |entry| entry == 'black' }
        if mode == '1'
          puts 'Sorry the comupter wins'
        else
          puts 'You win!!!'
        end
        true
      else
        false
      end
    else
      false
    end
  end

  def print_instruction(mode)
    puts 'Possible colors are blue, red, yellow, green, orange, purple'
    if mode == '1'
      puts 'Enter your code'
    else
      puts 'Enter your guess! '
    end
  end
end
