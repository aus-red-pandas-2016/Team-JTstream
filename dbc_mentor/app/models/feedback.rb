class Feedback < ApplicationRecord
  validates :written_by, :content, :rating, presence: true
end
