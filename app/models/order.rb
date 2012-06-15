class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :funding_round
end
