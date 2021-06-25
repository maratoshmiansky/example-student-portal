class AssignmentVersion < ApplicationRecord
  has_many :cohorts
  has_many :assignments
end
