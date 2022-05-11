# frozen_string_literal: true

# its add user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:"project manager", :QA, :Developer, :"Super Admin"]
  after_initialize :set_default_role, :new_record?

  def set_default_role
    self.role ||= :Developer
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
