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
    # WELCOMING MESSAGE
    puts "(y)es or (n)o?" #### change this to yes or no? and all invalide answers
    initial_answer = gets.chomp.downcase
    if initial_answer[0] == "y" && initial_answer.length <= 3
      # CALLS ON METHOD TO GET AND SAVE USERS NAME
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
    if inp == "n"
      name_prompt
    elsif inp == "y"
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
    # TO GET AND SAVE USERS NAME
    puts "Please enter your name:"
    user_name_input = gets.chomp
    @user = User.create_new_user(user_name_input)
    puts "Please enter your Age:" #DOB (mm/dd/yyyy)
    user_age = gets.chomp
    @user.age = user_age
    @user.user_options
  end

  def interest_prompt
    array = []
    5.times do
      array.push(Interest.all.sample)
    end  
    puts "Type a number to chose an Interest"    
    puts "1. #{array[0].interest_names}"
    puts "2. #{array[1].interest_names}"
    puts "3. #{array[2].interest_names}"
    puts "4. #{array[3].interest_names}"
    puts "5. #{array[4].interest_names}"
    puts 'hit "m" for more choices'
    inp = gets.chomp
    case inp
    when "1" 
      @user.interest_ids = array[0].id
    when "2"
      @user.interest_ids = array[1].id
    when "3"
      @user.interest_ids = array[2].id
    when "4"
      @user.interest_ids = array[3].id
    when "5"
      @user.interest_ids = array[4].id
    else
      puts "#{inp} is not a valid answer"
      invalid_response("a number from the list", "second")
    end
    matchmaker
  end 

  def find_user
    puts "What is your name?"
    inp = gets.chomp
    @current_user = User.all.find {|x| x.name == inp}
    user_options
  end

  def matchmaker
    results = []
    puts "You are now being matched.  Please Wait..."
    results = Celebrity.all.select {|celeb| celeb.interest_ids[0] == @user.interest_ids[0]}
    puts "Here are your matches!"
    results.each {|x| x.list_info}
  end

end