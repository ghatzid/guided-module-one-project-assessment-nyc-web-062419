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
    puts "4." #### come up with some bullshit
    puts "5. Delete your profile" #deletes profile and exits
    inp = gets.chomp
    case inp
      when "1" 
        list_info
      when "2"
        
      when "3"
        
      when "4"
        
      when "5"
        
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
  end

end
