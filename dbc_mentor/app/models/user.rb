class User < ActiveRecord::Base
  has_many :appointments

	has_secure_password
	validates :name, :password_digest, :email, :type, presence: true
  validates :email, uniqueness: true
end
