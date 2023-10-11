class ComputerCodeBreaker

  def code_algorithm(round, guess_history, computer_guess, opt)
    same = true
    puts "The computers guess is"
    if round == 0
      return same_4_colors(opt)
    end
    #p guess_history
    if computer_guess.length > 0
      result = guess_history[computer_guess].length
      if result == 0
        return same_4_colors(opt)
      elsif result.between?(1, 3)
        return replace_colors(computer_guess, opt, result)
      elsif result == 4
        num_white = count_num_white(guess_history, computer_guess)
        if num_white == 4
          while same
            p guess_history
            p "before manipulatin #{computer_guess}"
            computer_guess = switch_all_colors(computer_guess, guess_history)
            p guess_history
            p "after manipulatin #{computer_guess}"
            same = check_for_repetition(guess_history, computer_guess,)
          end
          computer_guess
        elsif num_white == 3
          while same
            p guess_history
            p "before manipulatin #{computer_guess}"
            computer_guess = switch_3_colors(computer_guess)
            p guess_history
            p "after manipulatin #{computer_guess}"
            same = check_for_repetition(guess_history, computer_guess,)
          end
          computer_guess
        elsif num_white == 2
          while same
            p guess_history
            p "before manipulatin #{computer_guess}"
            computer_guess = switch_2_colors(computer_guess)
            p guess_history
            p "after manipulatin #{computer_guess}"
            same = check_for_repetition(guess_history, computer_guess,)
          end
          computer_guess
        end
      end
    end
  end

  def same_4_colors(opt)
    len = opt.length
    if len == 1
      num = 0
    else
      num = rand(0...len-1)
    end
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

  def switch_all_colors(computer_guess, guess_history)
    p guess_history
    p computer_guess
    shuffled_array = computer_guess.dup
    shuffled_array.shuffle!
    while shuffled_array.each_with_index.any? { |e, i| e == computer_guess[i] }
      shuffled_array.shuffle!
    end
    computer_guess = shuffled_array
    p guess_history
    p computer_guess
    computer_guess
  end

  def switch_3_colors(computer_guess)
    num = rand(0...3)
    p computer_guess
    keeper = computer_guess[num]
    p keeper
    shuffled_array = computer_guess.dup
    test_array = computer_guess.dup
    shuffled_array.delete_at(num)
    test_array.delete_at(num)
    shuffled_array.shuffle!
    
    while shuffled_array.each_with_index.any? { |e, i| e == test_array[i] }
      shuffled_array.shuffle!
    end
    shuffled_array.insert(num, keeper)
    p "shuffel #{shuffled_array}"
    computer_guess = shuffled_array
    p "final guess #{computer_guess}"
    computer_guess
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
    shuffled_array = computer_guess.dup
    shuffled_array[num1], shuffled_array[num2] = shuffled_array[num2], shuffled_array[num1]
    computer_guess = shuffled_array
    computer_guess
  end

  def check_for_repetition(guess_history, computer_guess)
    p "Within repetition check #{computer_guess}"
    guess_history.each do |key, value|
      #p "hisorty #{key}"
      if key == computer_guess
        p "same"
        return true
      end
    end
    false
  end
 

end

require_relative "player.rb"
require_relative "computer_coder.rb"
require_relative "game_play.rb"
require_relative "game_modes.rb"

COLORS = ["blue", "red", "yellow", "green", "orange", "purple"]
play_again = true


def restart_game
  puts "Do you want to play again? y/n"
  again = gets.chomp
  if again == "y"
    true
  else
    false
  end
end



new_game = GameModes.new()

while play_again
  new_game.chose_mode
  play_again = restart_game
end




# two problems


# make a game play function for code setting 
# combin all and ask to play again 

# add new feature for code breaking 

# clean up the code 
# use rubocop to clean up some more 




















