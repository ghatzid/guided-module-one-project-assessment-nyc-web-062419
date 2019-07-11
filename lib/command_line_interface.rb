require_relative '../config/environment'

class CommandLineInterface

  def greet
    # GREETS THE USER
    system("clear")
    puts "     8888888b.   Y88b   d88P  888b     d888         d8888   .d8888b.".light_red
    puts "     888   Y88b   Y88b d88P   8888b   d8888        d88888  d88P  Y88b".light_red
    puts "     888    888    Y88o88P    88888b.d88888       d88P888  888    888" .light_red
    puts "     888    888     Y888P     888Y88888P888      d88P 888  888        ".light_red
    puts "     888    888      888      888 Y888P 888     d88P  888  888        ".light_red
    puts "     888    888      888      888  Y8P  888    d88P   888  888    888 ".light_red
    puts "     888  .d88P      888      888       888   d8888888888  Y88b  d88P ".light_red
    puts "     8888888P'       888      888       888  d88P     888   'Y8888P'  ".light_red
    puts "\n"
  end
  
  def initial_question
    puts "Hi there, welcome to DYMAC, curious to see which celebrities you match with?"
    puts "(y)es or (n)o?"
    initial_answer = gets.chomp.downcase
    if initial_answer[0] == "y" && initial_answer.length <= 3
      returning_user
    elsif initial_answer[0] == "n" && initial_answer.length <= 2
      puts "Goodbye"
      sleep 1
      exit
    else
      
      invalid_response("y or n")
      initial_question
    end
  end
  
  def returning_user
    puts "Do you already have an account? \n(y)es or (n)"
    inp = gets.chomp
    if inp[0] == "n" && inp.length <= 2
      name_prompt
    elsif inp[0] == "y" && inp.length <= 3
      User.find_user
    else
      invalid_response("y or n")
      returning_user
    end
    main_menu
  end
  
  def main_menu
    puts "Please choose from the following options:"
    puts "1. View your profile"
    puts "2. Add interests to your profile" #calls interest_prompt
    puts "3. View your matches" ### calls matchmaker
    puts "4. Delete your profile"
    puts "5. Exit"
    inp = gets.chomp
    case inp
    when "1" 
      @user.view_user_profile
    when "2"
      interest_prompt #Bring over user prompt to user class
    when "3"
      matchmaker #Get matchmaker running here
    when "4"
      delete_user
    when "5"
      exit
    else
      invalid_response("a valid number from the list")
      main_menu
    end
  end
  
  def name_prompt
    puts "Please enter your name:"
    user_name_input = gets.chomp
    @user = User.create_new_user(user_name_input)
    @user.age_prompt
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
        self.interest_ids = array[0].id
        user_options
      when "2"
        self.interest_ids = array[1].id
        user_options
      when "3"
        self.interest_ids = array[2].id
        user_options
      when "4"
        self.interest_ids = array[3].id
        user_options
      when "5"
        self.interest_ids = array[4].id
        user_options
      else
        puts "#{inp} is not a valid answer"
        invalid_response(a valid number from the list)
        interest_prompt
    end
  end 


  def invalid_response(string_with_valid_response)
    puts "\nThat's not a valid answer!"
    puts "Please respond with #{string_with_valid_response}."
    puts "\n"
    sleep 2
    # system("clear")
  end
  
end