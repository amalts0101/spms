class User < ApplicationRecord
  include User::ActivityManager

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :activities

  def total_activity_hours
	self.activities.sum(:hours).to_f
  end
end
