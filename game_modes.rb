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
    until round >= 10 || win
      round += 1
      player_guess = player.player_input
      evaluation = computer.evaluation(code, player_guess)
      player_guess_history[player_guess] = evaluation
      game.print_player_history(player_guess_history)
      win = game.winning_evaluation(player_guess_history, player_guess)
      p code
    end
    if round == 10 && win == false
      puts "Sorry the Computer wins"
    end
  end

  def create_code_gameplay(mode)
    game = GamePlay.new(mode)
    
    player = Player.new(mode)
    computer = ComputerCodeBreaker.new
    round = 0
    win = false
    opt = ["red","blue", "green", "orange", "yellow", "purple"]
    
    guess_history = {}
    player_code = player.player_input
    
    
    until round >= 50 || win
      if defined? computer_guess == nil
        computer_guess = []
      end
      computer_guess = computer.code_algorithm(round, guess_history, computer_guess, opt)
      round += 1
      p computer_guess
      puts "Your code is"
      p player_code
      evaluation = player.evaluate
      guess_history[computer_guess] = evaluation
      p guess_history
      #puts `clear`

    end

  end
end