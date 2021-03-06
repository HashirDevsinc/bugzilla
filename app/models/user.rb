class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :projects, dependent: :destroy

	has_many :issues


	has_many :p_relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy

	has_many :user_projects, through: :p_relationships, source: :project
  


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

	['Manager', 'QA', 'Dev'].each do |role|
    define_method("#{role}?") do
      self.user_type == role
    end
  end
	
end