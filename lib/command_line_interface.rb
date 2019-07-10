require_relative '../config/environment'

class CommandLineInterface

  def greet
    # GREETS THE USER
    system("clear")
    puts "Hi there, welcome to DYMAC, curious to see which celebrities you match with?"
    initial_question
  end

  def initial_question
    # WELCOMING MESSAGE
    puts "(y)es or (n)o?"
    initial_answer = gets.chomp
    if initial_answer == "y"
      # CALLS ON METHOD TO GET AND SAVE USERS NAME
      name_prompt
    elsif initial_answer == "n"
      puts "Goodbye"
      sleep 1
      exit
    else
      puts "#{initial_answer} is not a valid answer"
      invalid_response("y or n", "first")
    end
  end

  def invalid_response(string_with_valid_response, source)
    # IF USER SELECTS n WE WILL EXIT THE SESSION
    puts "Please respond with #{string_with_valid_response}."
    sleep 2
    if source == "first"
      greet
      elsif source == "second"
        hobby_prompt
      end
  end

  def name_prompt
    # TO GET AND SAVE USERS NAME
    puts "Please enter your name:"
    user_name_input = gets.chomp
    # user_name_input.downcase = user_name
    ### !!! SHOULD MAYBE CALL A METHOD TO REFER BACK TO THIS USER INSTANCE !!!
    user_name = User.new(name: "#{user_name_input}")
    hobby_prompt
  end

  def hobby_prompt
    puts "Please chose a Hobby"
    puts "1." # LIST HOBBIES AT RANDOM !!!!!!!!!!!!!!!!!!!!!!!!!!!
    puts "2." # number could be the hobby_id
    puts "3." # that way we can call that number
    puts "4." # and save that to the user
    puts "5."

    inp = gets.chomp
    case inp
    when "1" 
      self.user_hobby.hobby = hobby
    when "2"
      self.user_hobby.hobby = hobby
    when "3"
      self.user_hobby.hobby = hobby
    when "4"
      self.user_hobby.hobby = hobby
    when "5"
      self.user_hobby.hobby = hobby
    else
      puts "#{inp} is not a valid answer"
      invalid_response("a number from the list", "second")
    end
  end
  
end