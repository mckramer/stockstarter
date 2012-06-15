class FundingRound < ActiveRecord::Base
  belongs_to :company
  
  attr_accessible :company, :number_of_shares, :cost_per_share
  
  validates_presence_of :company
  validates_presence_of :number_of_shares
  validates_presence_of :cost_per_share
end
