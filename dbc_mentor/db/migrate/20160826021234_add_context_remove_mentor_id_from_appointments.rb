class AddContextRemoveMentorIdFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :mentor_id
    add_column :appointments, :context, :string
  end
end
