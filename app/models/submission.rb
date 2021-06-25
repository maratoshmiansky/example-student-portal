class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  has_many :comments, dependent: :destroy
end
