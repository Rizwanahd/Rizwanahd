# frozen_string_literal: true

# its userbugs table class
class CreateUserBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_bugs do |t|
      t.references :user
      t.references :bug

      t.timestamps
    end
  end
end
