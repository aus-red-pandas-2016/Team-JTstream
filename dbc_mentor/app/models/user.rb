class User < ActiveRecord::Base 

	has_secure_password
	validates :username, :password_digest, :email, :type, :type_id, presence: true
end
