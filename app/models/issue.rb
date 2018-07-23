class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user

  mount_uploader :img, ImageUploader

  validates :title, presence: true, uniqueness: true
  # validates_presence_of :issue_type
  # validates_presence_of :status
  # validates :img,
  #                format:{
  #                   with: %r{\.(gif|png|)$}i, message: "Wrong file format"
  #                       }
end
