class ProtocolRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :protocol
  belongs_to :record
end
