class Appointment < ActiveRecord::Base
  belongs_to :user

  validates :datetime, :user_id, presence: true
  validates_inclusion_of :active, in: [true, false]
end