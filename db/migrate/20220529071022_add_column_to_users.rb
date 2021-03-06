# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :name, :string
  end
end
