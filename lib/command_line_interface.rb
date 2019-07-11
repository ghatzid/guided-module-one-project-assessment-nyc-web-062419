require_relative '../config/environment'

class CommandLineInterface

  def self.logo
    system("clear")
    puts "8888888b.   Y88b   d88P  888b     d888         d8888   .d8888b.".light_red
    puts "888   Y88b   Y88b d88P   8888b   d8888        d88888  d88P  Y88b".light_red
    puts "888    888    Y88o88P    88888b.d88888       d88P888  888    888" .light_red
    puts "888    888     Y888P     888Y88888P888      d88P 888  888        ".light_red
    puts "888    888      888      888 Y888P 888     d88P  888  888        ".light_red
    puts "888    888      888      888  Y8P  888    d88P   888  888    888 ".light_red
    puts "888  .d88P      888      888       888   d8888888888  Y88b  d88P ".light_red
    puts "8888888P'       888      888       888  d88P     888   'Y8888P'  ".light_red
    puts "\n"
  end
  
  def initial_question
    puts "Hi there, welcome to DYMAC, curious to see which celebrities you match with?"
    puts "(y)es or (n)o?"
    inp = gets.chomp.downcase
    if inp[0] == "y" && inp.length <= 3
      user_login
    elsif inp[0] == "n" && inp.length <= 2
      puts "Goodbye"
      sleep 1
      exit
    else
      puts "#{inp} is not a valid answer"
      invalid_response("y or n")
    end
  end

  def user_login
    puts "Do you already have an account? \n(y)es or (n)"
    inp = gets.chomp
    if inp[0] == "n" && inp.length <= 2
      name_prompt
    elsif inp[0] == "y" && inp.length <= 3
      find_user
    else
      invalid_response("y or n")
    end
  end

  def name_prompt
    CommandLineInterface.logo
    puts "Please enter your name:"
    user_name_input = gets.chomp
    @user = User.create_new_user(user_name_input)
    age_prompt
  end
  
  def age_prompt
    puts "Please enter your Age:" #DOB (mm/dd/yyyy)
    user_age = gets.to_i
    if user_age == 0 || user_age > 120
      puts "that's not a valid number!"
      age_prompt
    else
      @user.age = user_age
      @user.save
      @user.main_menu
    end
  end
  
  def find_user
    CommandLineInterface.logo
    puts "What is your name?"
    inp = gets.chomp
    if User.all.find {|x| x.name == inp}
      @user = User.all.find {|x| x.name == inp}
      @user.main_menu
    else
      puts "Sorry #{inp} not found"
      user_not_found
    end
  end
  
  def user_not_found
    puts "Please choose an option"
    puts "1. Search again"
    puts "2. Create new user"
    var = gets.chomp
    if var == "1"
      find_user
    elsif var == "2"
      name_prompt
    else
      invalid_response("a number")
      user_not_found
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