class User < ActiveRecord::Base
  has_many :hobbies, through: :user_hobby
  has_many :user_hobby
end