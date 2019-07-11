require_relative '../config/environment'

class CommandLineInterface

  def greet
    # GREETS THE USER
    system("clear")
    puts "     8888888b.   Y88b   d88P  888b     d888         d8888   .d8888b."
    puts "     888   Y88b   Y88b d88P   8888b   d8888        d88888  d88P  Y88b"
    puts "     888    888    Y88o88P    88888b.d88888       d88P888  888    888" 
    puts "     888    888     Y888P     888Y88888P888      d88P 888  888        "
    puts "     888    888      888      888 Y888P 888     d88P  888  888        "
    puts "     888    888      888      888  Y8P  888    d88P   888  888    888 "
    puts "     888  .d88P      888      888       888   d8888888888  Y88b  d88P "
    puts "     8888888P'       888      888       888  d88P     888   'Y8888P'  "
    puts "\n"
    puts "Hi there, welcome to DYMAC, curious to see which celebrities you match with?"
    initial_question
  end

  def initial_question
    puts "(y)es or (n)o?"
    initial_answer = gets.chomp.downcase
    if initial_answer[0] == "y" && initial_answer.length <= 3
      returning_user
    elsif initial_answer[0] == "n" && initial_answer.length <= 2
      puts "Goodbye"
      sleep 1
      exit
    else
      puts "#{initial_answer} is not a valid answer"
      invalid_response("y or n", "first")
    end
  end

  def returning_user
    puts "Do you already have an account? /n (y)es or (n)"
    inp = gets.chomp
    if inp[0] == "n" && inp.length <= 2
      name_prompt
    elsif inp[0] == "y" && inp.length <= 3
      find_user
    else
      invalid_response("y or n", "third")
    end
  end

  def invalid_response(string_with_valid_response, source)
    puts "Please respond with #{string_with_valid_response}."
    sleep 2
    if source == "first"
      greet
    elsif source == "second"
      interest_prompt
    elsif source == "third"
      returning_user
    end
  end

  def name_prompt
    puts "Please enter your name:"
    user_name_input = gets.chomp
    @user = User.create_new_user(user_name_input)
    puts "Please enter your Age:" #DOB (mm/dd/yyyy)
    user_age = gets.chomp
    @user.age = user_age
    @user.user_options
  end



  def find_user
    puts "What is your name?"
    inp = gets.chomp
    @user = User.all.find {|x| x.name == inp}
    @user.user_options
  end

  

end