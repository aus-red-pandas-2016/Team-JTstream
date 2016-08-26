class Appointment < ActiveRecord::Base
  belongs_to :user

  validates :datetime, :user_id, :active, presence: true
end