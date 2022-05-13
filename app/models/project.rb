# frozen_string_literal: true

# its project modelclass
class Project < ApplicationRecord
  has_many :user_projects,  dependent: :destroy
  has_many :users, through: :user_projects

  def archived?
    name == 'archived'
  end
end
