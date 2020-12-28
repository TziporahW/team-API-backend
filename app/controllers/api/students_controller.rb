class Api::StudentsController < ApplicationController
  def create
    student = Student.new(
      # name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if student.save
      render json: { message: "student created successfully" }, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :bad_request
    end
  end
end
