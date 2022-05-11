# frozen_string_literal: true

# its create bugs table
class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
