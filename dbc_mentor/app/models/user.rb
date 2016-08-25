class User < ActiveRecord::Base 

	has_secure_password
	validates :name, :password_digest, :email, :type, presence: true

	def mentor_code
		return ""
	end

end
