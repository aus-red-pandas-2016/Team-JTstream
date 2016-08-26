class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :mentor_id
      t.integer :student_id
      t.integer :appointment_id
      t.string :written_by
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
