COLORS = ["blue", "red", "yellow", "green", "orange", "purple"]
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
  end
  user_input
end

def right_position(evaluation, found_color,evaluation_code, evaluation_player_guess)
  for i in 0..3
    if evaluation_code[i] == evaluation_player_guess[i]
      evaluation.push("black")
      found_color.push(evaluation_player_guess[i])
    end
  end
end

def right_color(evaluation, evaluation_code, evaluation_player_guess)
  evaluation_player_guess.each {|entry|
    p entry
    p "not correct color"
    if evaluation_code.include?(entry)
      p 'test'
      evaluation.push("white")
      evaluation_code.delete_at(evaluation_code.index(entry))
      p evaluation_code
      p "shortened"
    end
    }
end

def computer_evaluation(code, player_guess)
  evaluation_code = code.dup
  evaluation_player_guess = player_guess.dup
  evaluation = []
  found_color = []
  right_position(evaluation, found_color,evaluation_code, evaluation_player_guess )
  p found_color 
  p "correct colors"
  len = found_color.length
  for i in 0...len
    p "next round"
    p found_color[i]
    evaluation_code.delete_at(evaluation_code.index(found_color[i]))
    evaluation_player_guess.delete_at(evaluation_player_guess.index(found_color[i]))
    p evaluation_code 
    p "remaining color code"
    p evaluation_player_guess 
    p "remaining color guess"
  end
  right_color(evaluation, evaluation_code, evaluation_player_guess)
  evaluation
end 

def print_player_history(player_guess_history)
  player_guess_history.each do |key, value|
    puts "#{key} : #{value}"
  end
end

def winning_evaluation(player_guess_history, player_guess)
  if player_guess_history[player_guess].all?{|entry| p entry
    entry =="black"}
    if player_guess_history[player_guess].length == 4
      puts "You win!!!"
      return true
    end
  end
end


round = 0
win = false
#code = create_code_computer
code = ["orange", "red", "green", "red"]


test = [1,2,3,4,5,2]
test.delete(2)
p test 

until round > 8 || win
  round += 1
  player_guess = add_guess_player
  evaluation = computer_evaluation(code, player_guess)
  player_guess_history[player_guess] = evaluation
  print_player_history(player_guess_history)
  win = winning_evaluation(player_guess_history, player_guess)
  p code
  
end












