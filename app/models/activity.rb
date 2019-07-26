class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :hours, presence: true

  scope :recent, -> { order(id: :desc).last(10) }

  def project_name
  	self.project.name
  end
end

