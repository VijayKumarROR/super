class User < ApplicationRecord
	attr_accessor :password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true, length: { in: 4..15 }

	before_save :encrypt_password

	def self.authenticate(email,password)
		user = find_by_email(email)
		return user if user and user.password_authenticate(password)
	end

	def password_authenticate(password)
		self.hashed_password == encrypt(password)
	end

   protected
	def encrypt_password
		return if password.blank?
		self.hashed_password = encrypt(password)
	end

	def encrypt(string)
		Digest::SHA1.hexdigest(string)
	end
end
