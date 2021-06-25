class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :submission_text, :viewed_by_student

  belongs_to :submission
  belongs_to :user
end
