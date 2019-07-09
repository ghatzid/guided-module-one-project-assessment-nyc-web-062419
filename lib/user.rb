class User < ActiveRecord::Base
  has_many :user_hobbys
  has_many :hobbys, through: :user_hobbys
end