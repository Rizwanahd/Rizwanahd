# frozen_string_literal: true

# its add user.rb
class User < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
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
