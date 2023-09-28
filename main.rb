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

def add_guess_player(player_guess_history)
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
  return player_guess_history[player_guess] = []
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

code = create_code_computer
p code
add_guess_player(player_guess_history)
p player_guess_history







