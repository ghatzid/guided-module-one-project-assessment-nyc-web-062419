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
        interest_prompt
      end
  end

  def name_prompt
    # TO GET AND SAVE USERS NAME
    puts "Please enter your name:"
    user_name_input = gets.chomp
    ### !!! SHOULD MAYBE CALL A METHOD TO REFER BACK TO THIS USER INSTANCE !!!
    @user = User.create_new_user(user_name_input)
    interest_prompt
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
  
  def matchmaker
    results = []
    puts "You are now being matched.  Please Wait..."
    results = Celebrity.all.select {|celeb| celeb.interest_ids[0] == @user.interest_ids[0]}
    puts "Here are your matches!"
    results.each {|x| x.list_info}
  end

end