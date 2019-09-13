class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|

      t.timestamps null: false
    end
  end
end
