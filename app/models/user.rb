class User < ApplicationRecord
  belongs_to :role
  # students
  belongs_to :cohort, optional: true
  has_many :submissions, dependent: :destroy
  # instructors
  has_many :cohorts
  # to calculate progress
  has_many :submitted_assignments, through: :submissions, source: :assignment
  # only instructors
  has_many :comments

  def admin?
    role.category == "Admin"
  end

  def instructor?
    role.category == "Instructor"
  end

  def student?
    role.category == "Student"
  end

  def unpaid?
    role.category == "Unpaid"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
