# frozen_string_literal: true

# its project table class
class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.integer :issue_type
      t.integer :status, default: 0
      t.references :creator
      t.references :project
      t.references :qa
      t.references :developer

      t.timestamps
    end
  end
end
