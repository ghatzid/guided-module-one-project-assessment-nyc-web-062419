class UserHobby < ActiveRecord::Base
  belongs_to :hobbies
  belongs_to :users
end