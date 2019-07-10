class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests
  
  def self.create_new_user(name)
    User.create(name: name)
  end

end
