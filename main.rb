COLORS = ["blue", "red", "yellow", "green", "organe", "purple"]
player_guess_history = {}


def computer_create_code
  code = []
  4.times do
    number = rand(0..5)
    code.push(COLORS[number])
  end
  puts "The computer has created a code try to break it"
  code
end

code = computer_create_code
p code




puts "Possible colors are blue, red, yellow, green, orange, purple"



puts "Enter your guess! "
player_guess = []
4.times do 
   player_guess.push(gets.chomp)
end
puts `clear`
puts "Your guess"
player_guess_history.push(player_guess)
p player_guess_history