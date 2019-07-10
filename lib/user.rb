class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests
  
  def self.create_new_user(name)
    User.create(name: name)
  end

  def user_options
    puts "Please choose from the following options:"
    puts "1. View your profile"
    puts "2. Add interests to your profile" #calls interest_prompt
    puts "3. View your matches" ### calls matchmaker
    puts "4. Delete your profile"
    puts "5. Exit"
    inp = gets.chomp
    case inp
      when "1" 
        list_info
      when "2"
        interest_prompt #Bring over user prompt to user class
      when "3"
        matchmaker #Get matchmaker running here
      when "4"
        delete_user
      when "5"
        exit
      else
        puts "#{inp} is not a valid answer"
        invalid_response("a number from the list", "second")
    end
  end

  def list_info
    puts "
    Name: #{self.name}
    Age: #{self.age}
    Interests: #{self.interests.map {|x| x.interest_names}}"
    sleep 3
    user_options
  end

  def matchmaker
    results = []
    puts "You are now being matched.  Please Wait..."
    # ADD FEATURE FOR MANY INTERESTS IN THE ARRAY
    results = Celebrity.all.select {|celeb| celeb.interest_ids[0] == @user.interest_ids[0]}
    puts "Here are your matches!"
    results.each {|x| x.list_info}
  end

  def delete_user
    self.destroy
    puts "Your profile has been deleted"
    sleep 2
    exit
  end

end
