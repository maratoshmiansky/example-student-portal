class CohortSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :gmail_calendar

  has_many :users
end
