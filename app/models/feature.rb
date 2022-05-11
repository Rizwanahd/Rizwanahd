# frozen_string_literal: true

# its features application record
class Feature < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :status, [:New, :"In progress", :"In review", :Completed]
end
