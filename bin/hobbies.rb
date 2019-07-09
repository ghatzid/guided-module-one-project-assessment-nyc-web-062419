class Hobbies < ActiveRecord::Base
  has_many :users
  has_many :celebrities
end