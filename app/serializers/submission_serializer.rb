class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :answer, :viewed_by_admin, :grade, :redone

  belongs_to :user
  belongs_to :assignment
  has_many :comments
end
