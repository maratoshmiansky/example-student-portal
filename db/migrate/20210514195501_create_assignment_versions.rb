class CreateAssignmentVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :assignment_versions do |t|
      t.text :description

      t.timestamps
    end
  end
end
