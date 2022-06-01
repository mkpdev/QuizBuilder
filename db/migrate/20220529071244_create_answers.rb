# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :response
      t.integer :question_id
      t.integer :user_id
      t.integer :quiz_id

      t.timestamps
    end
  end
end
