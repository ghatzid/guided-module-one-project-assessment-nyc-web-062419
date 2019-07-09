class Hobbys < ActiveRecord::Base
  has_many :user_hobbys
  has_many :users, through: :user_hobbys
end