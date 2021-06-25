class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.text :submission_text
      t.integer :submission_id
      t.integer :user_id
      t.boolean :viewed_by_student

      t.timestamps
    end
  end
end
