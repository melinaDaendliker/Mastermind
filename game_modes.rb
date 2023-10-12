require_relative 'code_breaking'
class GameModes
  def chose_mode
    puts 'In what mode do you want to play?'
    puts 'To create a code presse 1:'
    puts 'To break a code presse 2:'
    mode = gets.chomp

    if mode == '2'
      break_code_gameplay(mode)
    elsif mode == '1'
      create_code_gameplay(mode)
    else
      chose_mode
    end
  end

  def restart_game
    puts 'Do you want to play again? y/n'
    again = gets.chomp
    again == 'y'
  end

  def break_code_gameplay(mode)
    game = GamePlay.new(mode)
    player = Player.new(mode)
    computer = ComputerCoder.new
    round = 0
    win = false
    player_guess_history = {}

    code = computer.create_code_computer
    until round >= 12 || win
      round += 1
      player_guess = player.player_input
      evaluation = computer.evaluation(code, player_guess)
      player_guess_history[player_guess] = evaluation
      game.print_player_history(player_guess_history)
      win = game.winning_evaluation(player_guess_history, player_guess, mode)
    end
    return unless round == 12 && win == false

    puts 'Sorry the Computer wins'
  end

  def create_code_gameplay(mode)
    game = GamePlay.new(mode)
    player = Player.new(mode)
    computer = ComputerCodeBreaker.new
    round = 0
    win = false
    opt = %w[red blue green orange yellow purple]

    guess_history = {}
    not_possible_position = Hash.new { |hash, key| hash[key] = [] }
    player_code = player.player_input

    until round >= 12 || win
      if defined? computer_guess.nil?
        computer_guess = []
      end
      computer_guess = computer.code_algorithm(round, guess_history, computer_guess, opt, not_possible_position)
      round += 1
      p computer_guess
      puts 'Your code is'
      p player_code
      evaluation = player.evaluate
      guess_history[computer_guess] = evaluation
      win = game.winning_evaluation(guess_history, computer_guess, mode)
    end

    return unless round == 12 && win == false

    puts 'You win!!'
  end
end
