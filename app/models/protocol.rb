class Protocol < ActiveRecord::Base
  has_many :protocol_records  
  has_many :users, through: :protocol_records
end
