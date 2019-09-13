class Protocol < ActiveRecord::Base
  belongs_to :user
  has_many :protocol_records    
end
