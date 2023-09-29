class PlayerCodeBreaker
  def guess_player
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
end