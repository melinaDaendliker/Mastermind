#restructure
class ComputerCodeBreaker
  require 'timeout'

  def code_algorithm(round, guess_history, computer_guess, opt, not_possible_position)
    same = true
    forbidden = true
    puts 'The computers guess is'
    return same_4_colors(opt) if round == 0

    result = guess_history[computer_guess].length
    if result == 0
      begin
        same_4_colors(opt)
      rescue StandardError
        puts 'You have made an error in your evaluation'
        exit(1)
      end
    elsif result.between?(1, 3)
      begin
        replace_colors(computer_guess, opt, result)
      rescue StandardError
        puts 'You have made an error in your evaluation'
        exit(1)
      end

    elsif result == 4
      num_white = count_num_white(guess_history, computer_guess)
      if num_white == 4
        computer_guess.each_with_index do |entry, index|
          not_possible_position[entry].push(index)
        end

        begin
          Timeout.timeout(10) do
            while same || forbidden
              computer_guess = switch_all_colors(computer_guess, guess_history)
              same = check_for_repetition(guess_history, computer_guess)
              forbidden = check_forbidden_positions(not_possible_position, computer_guess)
            end
            computer_guess
          end
        rescue Timeout::Error
          puts 'You have made an error in your evaluation'
          exit(1)
        end
      elsif num_white == 3
        begin
          Timeout.timeout(10) do
            while same || forbidden
              computer_guess = switch_3_colors(computer_guess)
              same = check_for_repetition(guess_history, computer_guess)
              forbidden = check_forbidden_positions(not_possible_position, computer_guess)
            end
            computer_guess
          end
        rescue Timeout::Error
          puts 'You have made an error in your evaluation'
          exit(1)
        end
      elsif num_white == 2
        begin
          Timeout.timeout(10) do
            while same || forbidden
              computer_guess = switch_2_colors(computer_guess)
              same = check_for_repetition(guess_history, computer_guess)
              forbidden = check_forbidden_positions(not_possible_position, computer_guess)
            end
            computer_guess
          end
        rescue Timeout::Error
          puts 'You have made an error in your evaluation'
          exit(1)
        end
      end
    end
  end

  def same_4_colors(opt)
    len = opt.length
    num = if len == 1
            0
          else
            rand(0...len - 1)
          end
    guess = [opt[num], opt[num], opt[num], opt[num]]
    opt.delete_at(num)
    guess
  end

  def replace_colors(computer_guess, opt, result)
    computer_guess = computer_guess[0, result]
    num = rand(0...opt.length)
    computer_guess.push(opt[num]) until computer_guess.length == 4
    opt.delete_at(num)
    computer_guess
  end

  def count_num_white(guess_history, computer_guess)
    evaluations = guess_history[computer_guess]
    num_white = 0
    evaluations.each do |evaluation|
      num_white += 1 if evaluation == 'white'
    end
    num_white
  end

  def switch_all_colors(computer_guess, _guess_history)
    shuffled_array = computer_guess.dup
    shuffled_array.shuffle!
    shuffled_array.shuffle! while shuffled_array.each_with_index.any? { |e, i| e == computer_guess[i] }
    shuffled_array
  end

  def switch_3_colors(computer_guess)
    num = rand(0...3)
    keeper = computer_guess[num]
    shuffled_array = computer_guess.dup
    test_array = computer_guess.dup
    shuffled_array.delete_at(num)
    test_array.delete_at(num)
    shuffled_array.shuffle!

    shuffled_array.shuffle! while shuffled_array.each_with_index.any? { |e, i| e == test_array[i] }
    shuffled_array.insert(num, keeper)
    shuffled_array
  end

  def switch_2_colors(computer_guess)
    num1 = rand(0...3)
    num2 = rand(0...3)
    num2 = rand(0...3) while num1 == num2
    shuffled_array = computer_guess.dup
    shuffled_array[num1], shuffled_array[num2] = shuffled_array[num2], shuffled_array[num1]
    shuffled_array
  end

  def check_for_repetition(guess_history, computer_guess)
    guess_history.each do |key, _value|
      return true if key == computer_guess
    end
    false
  end

  def check_forbidden_positions(not_possible_position, computer_guess)
    computer_guess.each_with_index do |entry, index|
      value = not_possible_position[entry]
      return true if value.include?(index)
    end
    false
  end
end
