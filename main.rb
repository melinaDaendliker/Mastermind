COLORS = ["blue", "red", "yellow", "green", "organe", "purple"]
player_guess_history = {}

def create_code_computer 
  code = []
  4.times do
    number = rand(0..5)
    code.push(COLORS[number])
  end
  puts "The computer has created a code try to break it"
  code
end

def add_guess_player
  puts "Possible colors are blue, red, yellow, green, orange, purple"
  puts "Enter your guess! "
  player_guess = []
  4.times do
    user_input = gets.chomp
    user_input = correct_user_input(user_input)
    player_guess.push(user_input)
  end
  puts `clear`
  puts "Your guess"
  player_guess
end

def correct_user_input(user_input)
  until COLORS.include? user_input
    puts "This color is not an option"
    puts "Enter your guess! "
    user_input = gets.chomp
    return user_input
  end
  user_input
end

def right_position(evaluation, position_count,evaluation_code, evaluation_player_guess)
  for i in 0..3
    if evaluation_code[i] == evaluation_player_guess[i]
      evaluation.push("black")
      position_count.push(i)
    end
  end
end

def right_color(evaluation, evaluation_code, evaluation_player_guess)
  evaluation_player_guess.each {|entry|
    if evaluation_code.include?(entry)
      evaluation.push("white")
    end
    }
end

def computer_evaluation(code, player_guess)
  evaluation_code = code.dup
  evaluation_player_guess = player_guess.dup
  evaluation = []
  position_count = []
  right_position(evaluation, position_count,evaluation_code, evaluation_player_guess )
  p position_count
  len = position_count.length
  for i in 0...len
    evaluation_code.delete_at(position_count[i])
    evaluation_player_guess.delete_at(position_count[i])
  end
  right_color(evaluation, evaluation_code, evaluation_player_guess)
  evaluation
end 


code = create_code_computer
player_guess = add_guess_player
evaluation = computer_evaluation(code, player_guess)
player_guess_history[player_guess] = evaluation
p player_guess_history
p code
p evaluation




