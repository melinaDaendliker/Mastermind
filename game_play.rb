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
    if player_guess_history[player_guess].all?{|entry| entry =="black"}
      if player_guess_history[player_guess].length == 4
        puts "You win!!!"
        return true
      end
    end
  end

  def print_instruction(mode)
    puts "Possible colors are blue, red, yellow, green, orange, purple"
    if mode == "code"
      puts "Enter your code"
    else
      puts "Enter your guess! "
    end
  end

  def print_user_input(mode, player_input)
    if mode == "code"
      puts "Your secrete code"
    else 
      puts "Your guess"
    end
    p player_input
  end
end
