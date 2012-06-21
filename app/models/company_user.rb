class CompanyUser < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  
  attr_accessible :role, :user
end
