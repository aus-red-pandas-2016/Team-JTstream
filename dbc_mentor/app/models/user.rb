class User < ActiveRecord::Base
	has_secure_password
	validates :username, :password_digest, :email, :type, presence: true
end
