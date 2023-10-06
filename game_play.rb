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
  
  def winning_evaluation(player_guess_history, player_guess)
    if player_guess_history[player_guess].length == 4
      if player_guess_history[player_guess].all?{|entry| entry =="black"}
        puts "You win!!!"
        return true
      end
    else 
      return false
    end
  end

  def print_instruction(mode)
    puts "Possible colors are blue, red, yellow, green, orange, purple"
    if mode == "1"
      puts "Enter your code"
    else
      puts "Enter your guess! "
    end
  end
end
