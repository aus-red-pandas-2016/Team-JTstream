class RemoveNullFromAppointmentsStudentId < ActiveRecord::Migration[5.0]
  def change
    change_column :appointments, :student_id, :string, null: true
  end
end
