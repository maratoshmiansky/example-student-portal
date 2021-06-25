class Cohort < ApplicationRecord
  # students
  has_many :users
  # instructor
  belongs_to :instructor, foreign_key: "user_id", class_name: "User"
  belongs_to :assignment_version
end
