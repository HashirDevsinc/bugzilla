class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :projects

	# before_action :authenticate_user!


	# before_save { email.downcase! }
	# validates :name, presence: true, length: {maximum: 20}
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, presence: true, length: {maximum: 40}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}



	# has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }

	# # Returns the hash digest of the given string.
	# def User.digest(string)
	# 	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	# 	BCrypt::Password.create(string, cost: cost)
	# end

	# def manager?
	# 	user_type == 'Manager'
	# end
	# def developer?
	# 	user_type == 'Developer'
	# end
	# def qa?
	# 	user_type == 'QA'
	# end
end