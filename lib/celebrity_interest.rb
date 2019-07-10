class CelebrityInterest < ActiveRecord::Base
  belongs_to :interest
  belongs_to :celebrity
end