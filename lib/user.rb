class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests
  cli = CommandLineInterface.new
  
####METHODS FOR CREATING NEW USER AND SETTING NAME/AGE#####
  def self.create_new_user(name)
    User.create(name: name)
  end
  
  def User.name_prompt
    puts "Please enter your name:"
    user_name_input = gets.chomp
    @user = User.create_new_user(user_name_input)
    @user.age_prompt
  end
  
  def age_prompt
  puts "Please enter your Age:" #DOB (mm/dd/yyyy)
  user_age = gets.to_i
    if user_age == 0 || user_age > 120
      puts "that's not a valid number!"
      age_prompt
    else
      binding.pry
      self.age = user_age
      self.save
    end
  end

  def view_user_profile
    puts "
    Name: #{self.name}
    Age: #{self.age}
    Interests: #{self.interests.map {|x| x.interest_names}}"
    sleep 3
    main_menu
  end
  
  def User.main_menu
    puts "Please choose from the following options:"
    puts "1. View your profile"
    puts "2. Add interests to your profile" #calls interest_prompt
    puts "3. View your matches" ### calls matchmaker
    puts "4. Delete your profile"
    puts "5. Exit"
    inp = gets.chomp
    # binding.pry
    case inp
    when "1" 
      view_user_profile
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


  def self.find_user
    puts "What is your name?"
    inp = gets.chomp
      if User.all.find {|x| x.name == inp}
        @user = User.all.find {|x| x.name == inp}
      else
        puts "Sorry our system...."
        sleep 1
        name_prompt
      end
    #what if no user is found?
  end
  
  def delete_user
    self.destroy
    puts "Your profile has been deleted"
    sleep 2
    exit
  end

  def matchmaker
    results = []
    puts "You are now being matched.  Please Wait..."
    # ADD FEATURE FOR MANY INTERESTS IN THE ARRAY
    results = Celebrity.all.select {|celeb| celeb.interest_ids[0] == @user.interest_ids[0]}
    puts "Here are your matches!"
    results.each {|x| x.list_info}
  end

  



end
