# frozen_string_literal: true

# its project model class
class Project < ApplicationRecord
  def archived?
    name == 'archived'
  end
end
