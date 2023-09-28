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
    player_guess.push(gets.chomp)
  end
  puts `clear`
  puts "Your guess"
  return player_guess_history[player_guess] = []
end


code = create_code_computer
p code
add_guess_player(player_guess_history)
p player_guess_history







