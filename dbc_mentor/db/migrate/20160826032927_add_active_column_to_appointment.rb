class AddActiveColumnToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :active, :boolean
  end
end
