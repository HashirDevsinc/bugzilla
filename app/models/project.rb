class Project < ApplicationRecord
  belongs_to :user

  has_many :u_relationships, class_name: "Relationship", foreign_key: "p_id", dependent: :destroy
 
  has_many :users, through: :u_relationships, source: :user

  has_many :issues, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
