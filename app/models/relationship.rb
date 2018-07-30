class Relationship < ApplicationRecord

	belongs_to :project, class_name: "Project", :foreign_key => 'project_id'
	belongs_to :user, class_name: "User", :foreign_key => 'user_id'

	validates :project_id, presence: true, uniqueness: { scope: :user_id }
	validates :user_id, presence: true
end
