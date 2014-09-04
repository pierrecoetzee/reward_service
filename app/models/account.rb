class Account < ActiveRecord::Base
  
  attr_accessible :first_name, :last_name

  has_one :portfolio

end
