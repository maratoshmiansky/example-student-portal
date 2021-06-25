class CreateCohorts < ActiveRecord::Migration[6.1]
  def change
    create_table :cohorts do |t|
      t.string :title
      t.integer :user_id
      t.date :start_date
      t.integer :assignment_version_id
      t.string :gmail_calendar

      t.timestamps
    end
  end
end
