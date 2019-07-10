class Celebrity < ActiveRecord::Base
  has_many :celebrity_interests
  has_many :interests, through: :celebrity_interests

  def self.seed_interests
    Celebrity.all.map {|celeb| celeb.interest_ids = rand(1..499)}
  end
end
