class GamePlay
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
end
