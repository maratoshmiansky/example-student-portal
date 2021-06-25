class CohortsController < ApplicationController
  def index
    cohorts = Cohort.all
    render json: cohorts, include: "users.submissions.comments"
  end
end
