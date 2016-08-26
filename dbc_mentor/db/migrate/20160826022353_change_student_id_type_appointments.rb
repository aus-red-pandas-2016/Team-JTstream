class ChangeStudentIdTypeAppointments < ActiveRecord::Migration[5.0]
  def change
    change_column :appointments, :student_id, 'integer USING CAST(student_id AS integer)'
  end
end
