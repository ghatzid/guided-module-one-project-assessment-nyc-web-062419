class Celebrity < ActiveRecord::Base
  has_many :celebrity_interests
  has_many :interests, through: :celebrity_interests
end