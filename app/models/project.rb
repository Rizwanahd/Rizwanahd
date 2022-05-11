# frozen_string_literal: true

# its project modelclass
class Project < ApplicationRecord
  belongs_to :bugs
  belongs_to :features
  belongs_to :comments
  def archived?
    name == 'archived'
  end
end
