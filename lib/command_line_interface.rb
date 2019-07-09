require_relative '../config/environment'

class CommandLineInterface

  def greet
    system("clear")
    puts "Hi there, welcome to DYMAC, curious to see which celebrities you match with?"
    initial_question
  end

  def initial_question
    puts "(y)es or (n)o?"
    initial_answer = gets.chomp
    if initial_answer == "y"
      name_prompt
    elsif initial_answer == "n"
      puts "Goodbye"
      sleep 1
      exit
    else
      puts "#{initial_answer} is not a valid answer"
      invalid_response
    end
  end

  def invalid_response
    puts "Please respond with y or n."
    sleep 1.5
    greet
  end

  def name_prompt
    puts "Please enter your name:"
    user_input_name = gets.chomp
    User.new(name: "Yosef")
  end
  
end