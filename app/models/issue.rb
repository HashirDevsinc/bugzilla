class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user

  mount_uploader :img, ImageUploader

  validates :title, presence: true, uniqueness: true
  
end
