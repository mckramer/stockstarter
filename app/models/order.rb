class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :funding_round
  
  attr_accessible :shares, :funding_round
end
