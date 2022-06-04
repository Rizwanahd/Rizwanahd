# frozen_string_literal: true

# its issue application record
class Issue < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :project
  belongs_to :qa, class_name: 'User', optional: true
  belongs_to :developer, class_name: 'User', optional: true

  enum issue_type: %i[feature bug]
  enum status: %i[created in_progress in_review fixed]
end
