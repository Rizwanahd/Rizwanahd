# frozen_string_literal: true

# its add user.rb
class User < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :qa_issues, class_name: 'Issue', foreign_key: 'qa_id'
  has_many :developer_issues, class_name: 'Issue', foreign_key: 'developer_id'

  has_many :user_issues, dependent: :destroy
  has_many :issues, through: :user_issues
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: %i[project_manager qa developer]
  after_initialize :set_default_role, :new_record?

  def set_default_role
    self.role ||= :developer
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
