class UserHobby < ActiveRecord::Base
  belongs_to :hobbys
  belongs_to :user
end