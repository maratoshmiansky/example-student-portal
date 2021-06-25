class UsersController < ApplicationController
  def index
    if params[:role_id] && params[:cohort_id]
      # users = User.where("role_id = :role_id and cohort_id = :cohort_id", { role_id: "#{params[:role_id]}", cohort_id: "#{params[:cohort_id]}"})
      users = User.where("role_id = :role_id and cohort_id = :cohort_id", { role_id: params[:role_id], cohort_id: params[:cohort_id] })
    elsif params[:role_id]
      users = User.where(role_id: params[:role_id])
    elsif params[:cohort_id]
      users = User.where(cohort_id: params[:cohort_id])
    else
      users = User.all
    end
    render json: users
  end
end
