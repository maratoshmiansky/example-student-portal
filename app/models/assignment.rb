class Assignment < ApplicationRecord
  belongs_to :assignment_version
  has_many :submissions
  has_many :comments, through: :submissions
end
