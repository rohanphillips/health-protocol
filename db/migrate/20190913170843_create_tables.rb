class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      
      t.timestamps null: false
    end

    create_table :protocols do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.timestamps null: false
    end

    create_table :protocol_records do |t|
      t.belongs_to :user
      t.belongs_to :protocol
      t.belongs_to :record
      t.timestamps null: false
    end

    create_table :records do |t|
      t.integer :resting_heartrate
      t.integer :bp_over
      t.integer :bp_under
      t.integer :mood_score
      t.integer :exercise_minutes
      t.string :water_unit
      t.integer :water_consumed
      t.timestamps null: false
    end

  end

end
