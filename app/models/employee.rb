class Employee < ApplicationRecord
  has_many :projects
  has_many :activities
end
