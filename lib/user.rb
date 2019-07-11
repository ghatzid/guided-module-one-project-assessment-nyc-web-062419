class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests
  
  def self.create_new_user(name)
    User.create(name: name)
  end

  def main_menu
    CommandLineInterface.logo
    puts "Please choose from the following options:"
    puts "1. View your profile"
    puts "2. Add interests to your profile" #calls interest_prompt
    puts "3. View your matches" ### calls matchmaker
    puts "4. Delete your profile"
    puts "5. Exit"
    inp = gets.chomp
    case inp
      when "1" 
        list_user_info
      when "2"
        interest_prompt #Bring over user prompt to user class
      when "3"
        matchmaker #Get matchmaker running here
      when "4"
        delete_user
      when "5"
        exit
      else
        puts "#{inp} is not a valid answer\n"
        main_menu
    end
  end

  def list_user_info
    puts "
    Name: #{self.name}
    Age: #{self.age}
    Interests: #{self.interests.map {|x| x.interest_names}}"
    puts "Enter any key to return to main menu"
    gets.chomp
    main_menu
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
    puts 'hit "r" to return to main menu'

    inp = gets.chomp
    case inp
      when "1" 
        self.interest_ids = array[0].id ## add push
      when "2"
        self.interest_ids = array[1].id
      when "3"
        self.interest_ids = array[2].id
      when "4"
        self.interest_ids = array[3].id
      when "5"
        self.interest_ids = array[4].id
      when "m"
        interest_prompt
      when "r"
        main_menu
      else
        puts "#{inp} is not a valid answer\n"
        interest_prompt ### should be able to save options
    end
    main_menu
  end 

  def matchmaker
    results = []
    puts "You are now being matched.  Please Wait..."
    # ADD FEATURE FOR MANY INTERESTS IN THE ARRAY
    # binding.pry
    results = Celebrity.all.select{|celeb| celeb.interest_ids[0] == self.interest_ids[0]}
    if results == []
      puts "Sorry, nobody famous shares your strange interests.."
    else
      puts "Here are your matches!"      
    results.each {|x| x.list_celebrity_info}
    end
    puts "Enter any key to return to main menu"
    gets.chomp
    main_menu
  end

  def delete_user
    puts "WARNING! This will delete your account permanently"
    puts "Are you sure you wish to do this?"
    puts "(y)es or (n)o?\n"
    inp = gets.chomp
    if inp[0] == "n" && inp.length <= 2
      main_menu
    elsif inp[0] == "y" && inp.length <= 3
      self.destroy
      puts "Your profile has been deleted. Goodbye!\n"
      sleep 2
      exit
    else
      puts "#{inp} is not a valid answer\n"
      delete_user
    end
    
  end

end
