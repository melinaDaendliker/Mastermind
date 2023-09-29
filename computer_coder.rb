class ComputerCoder

  def create_code_computer 
    code = []
    4.times do
      number = rand(0..5)
      code.push(COLORS[number])
    end
    puts "The computer has created a code try to break it"
    code
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
      #p entry
      #p "not correct color"
      if evaluation_code.include?(entry)
        #p 'test'
        evaluation.push("white")
        evaluation_code.delete_at(evaluation_code.index(entry))
        #p evaluation_code
        #p "shortened"
      end
      }
  end
  
  def evaluation(code, player_guess)
    evaluation_code = code.dup
    evaluation_player_guess = player_guess.dup
    evaluation = []
    found_color = []
    right_position(evaluation, found_color,evaluation_code, evaluation_player_guess )
    #p found_color 
    #p "correct colors"
    len = found_color.length
    for i in 0...len
      #p "next round"
      #p found_color[i]
      evaluation_code.delete_at(evaluation_code.index(found_color[i]))
      evaluation_player_guess.delete_at(evaluation_player_guess.index(found_color[i]))
      #p evaluation_code 
      #p "remaining color code"
      #p evaluation_player_guess 
      #p "remaining color guess"
    end
    right_color(evaluation, evaluation_code, evaluation_player_guess)
    evaluation
  end 
end