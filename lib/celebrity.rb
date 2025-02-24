class Celebrity < ActiveRecord::Base
  has_many :celebrity_interests
  has_many :interests, through: :celebrity_interests

  def self.seed_interests
    Celebrity.all.map {|celeb| celeb.interest_ids = rand(1..499)}
  end

  def list_celebrity_info
    puts "
    Name: #{self.name}
    Age: #{Date.parse(DateTime.now.to_s).year - Date.parse(self.age.to_s).year}
    Known For: #{self.known_for}
    Interests: #{self.interests[0].interest_names}    <-- OMG SAME AS YOURS!!<3<3<3"
  end
end
