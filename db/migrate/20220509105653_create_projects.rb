# frozen_string_literal: true

# its project table class
class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :creator
      t.timestamps
    end
  end
end
