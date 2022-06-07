# frozen_string_literal: true

# its project modelclass
class Project < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :comments, dependent: :destroy
  has_many :user_projects,  dependent: :destroy
  has_many :users, through: :user_projects
  has_many :issues, dependent: :destroy
  def archived?
    name == 'archived'
  end
end
