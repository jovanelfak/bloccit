class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :resolved, null: false, default: false

      t.timestamps null: false
    end
  end
end
