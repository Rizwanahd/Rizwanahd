# frozen_string_literal: true

# its create bugs table
class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :deadline
      t.references :assigned_to
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
