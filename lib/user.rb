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
  
  def self.find_user
    puts "What is your name?"
    inp = gets.chomp
    @user = User.all.find {|x| x.name == inp}
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
