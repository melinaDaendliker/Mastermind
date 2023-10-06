class ComputerCodeBreaker

  def code_algorithm(round, guess_history, computer_guess, opt)
    puts "The computers guess is"
    if round == 0
      return same_4_colors(opt)
    end
    p guess_history
    if computer_guess.length > 0
      result = guess_history[computer_guess].length
      if result == 0
        return same_4_colors(opt)
      elsif result.between?(1, 3)
        return replace_colors(computer_guess, opt, result)
      elsif result == 4
        num_white = count_num_white(guess_history, computer_guess)
        if num_white == 4
          switch_all_colors(computer_guess)
        elsif num_white == 3
          switch_3_colors(computer_guess)
        elsif num_white == 2
          switch_2_colors(computer_guess)
        else
          puts "The computer won !!!"
        end
      end
    end
  end

  def same_4_colors(opt)
    num = rand(0...5)
      guess = [opt[num], opt[num], opt[num], opt[num]]
      opt.delete_at(num)
      guess
  end

  def replace_colors(computer_guess, opt, result)
    computer_guess = computer_guess[0,result]
        num = rand(0...opt.length)
        until computer_guess.length == 4
          computer_guess.push(opt[num])
        end
        opt.delete_at(num)
        computer_guess
  end

  def count_num_white(guess_history, computer_guess)
    evaluations = guess_history[computer_guess]
    num_white = 0
    evaluations.each do |evaluation|
      if evaluation == "white"
        num_white += 1
      end
    end
    puts num_white
    num_white
  end

  def switch_all_colors(computer_guess)
    p computer_guess
    shuffled_array = computer_guess.dup
    shuffled_array.shuffle!
    while shuffled_array.each_with_index.any? { |e, i| e == computer_guess[i] }
      shuffled_array.shuffle!
    end
    p shuffled_array
    shuffled_array
  end

  def switch_3_colors(computer_guess)
    num = rand(0...3)
    p computer_guess
    keeper = computer_guess[num]
    p keeper
    computer_guess.delete_at(num)
    shuffled_array = computer_guess.dup
    shuffled_array.shuffle!
    while shuffled_array.each_with_index.any? { |e, i| e == computer_guess[i] }
      shuffled_array.shuffle!
    end
    shuffled_array.insert(num, keeper)
    p shuffled_array
    shuffled_array
  end

  def switch_2_colors(computer_guess)
    num1 = rand(0...3)
    num2 = rand(0...3)
    while num1 == num2 
      num2 = rand(0...3)
    end
    p computer_guess
    p num1
    p num2
    computer_guess[num1], computer_guess[num2] = computer_guess[num2], computer_guess[num1]
    p computer_guess
    computer_guess
  end

  def check_for_repetiontion(guess_history, computer_guess)
    
  end

end


# Check if any element is in its original position





require_relative "player.rb"
require_relative "computer_coder.rb"
require_relative "game_play.rb"
require_relative "game_modes.rb"

COLORS = ["blue", "red", "yellow", "green", "orange", "purple"]



new_game = GameModes.new()
new_game.chose_mode


# creat a computer strategy to solve the game
# make a game play function for code setting 
# combin all and ask to play again 
# clean up the code 
# use rubocop to clean up some more 




















