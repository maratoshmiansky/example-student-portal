class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.integer :assignment_version_id
      t.string :title
      t.integer :week
      t.text :question
      t.string :video_url
      t.string :image_url
      t.text :solution
      t.integer :video_length

      t.timestamps
    end
  end
end
