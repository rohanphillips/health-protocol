class Record < ActiveRecord::Base
  has_many :protocol_records
  has_many :protocols, through: :protocol_records
end
