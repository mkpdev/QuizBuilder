# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :quiz_id
      t.integer :question_type

      t.timestamps
    end
  end
end
