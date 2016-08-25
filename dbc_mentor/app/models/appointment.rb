class Appointment < ActiveRecord::Base
  belongs_to :user

  validates :datetime, :student_id, :mentor_id, presence: true
end