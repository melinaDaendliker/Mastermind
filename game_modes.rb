class GameModes

  def chose_mode
    puts "In what mode do you want to play?"
      puts "To create a code presse 1:"
      puts "To break a code presse 2:"
      mode = gets.chomp
      
      if mode == "2" 
        break_code_gameplay(mode)
      elsif mode == "1"
        create_code_gameplay(mode)
      else
        chose_mode
      end
  end

  def break_code_gameplay(mode)
    game = GamePlay.new(mode)
    player = Player.new(mode)
    computer = ComputerCoder.new
    round = 0
    win = false
    player_guess_history = {}
  
    code = computer.create_code_computer
    until round >= 8 || win
      round += 1
      player_guess = player.player_input
      evaluation = computer.evaluation(code, player_guess)
      player_guess_history[player_guess] = evaluation
      game.print_player_history(player_guess_history)
      win = game.winning_evaluation(player_guess_history, player_guess)
      p code
      if round == 8
        puts "Sorry the Computer wins"
      end
    end
  end

  def create_code_gameplay(mode)
    puts 'test'

  end

end