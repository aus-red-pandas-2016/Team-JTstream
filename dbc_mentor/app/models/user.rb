class User < ActiveRecord::Base

	has_secure_password
	validates :name, :password_digest, :email, :user_type, presence: true

end
