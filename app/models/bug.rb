# frozen_string_literal: true

# its bug application record
class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :status, [:New, :"In progress", :"In review", :Fixed]
end
