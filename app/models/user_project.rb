# frozen_string_literal: true

# its userproject modelclass
class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :user, uniqueness: { scope: :project }
end
