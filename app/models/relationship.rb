class Relationship < ApplicationRecord

	belongs_to :project, class_name: "Project", :foreign_key => 'p_id'
	belongs_to :user, class_name: "User", :foreign_key => 'u_id'

	validates :p_id, presence: true
	validates :u_id, presence: true
end
