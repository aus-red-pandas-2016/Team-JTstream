class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :datetime, null: false
      t.integer :student_id, null: false
      t.integer :mentor_id, null: false

      t.timestamps(null: false)
    end
  end
end
