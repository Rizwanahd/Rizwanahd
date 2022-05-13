# frozen_string_literal: true

# its comments application record
class Comment < ApplicationRecord
  belongs_to :projects
  belongs_to :users
end
