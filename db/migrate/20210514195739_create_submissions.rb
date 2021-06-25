class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.text :answer
      t.boolean :viewed_by_admin
      t.string :grade
      t.boolean :redone

      t.timestamps
    end
  end
end
