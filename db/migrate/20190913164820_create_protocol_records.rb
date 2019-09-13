class CreateProtocolRecords < ActiveRecord::Migration
  def change
    create_table :protocol_records do |t|

      t.timestamps null: false
    end
  end
end
