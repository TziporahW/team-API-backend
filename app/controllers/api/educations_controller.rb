class Api::EducationsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    @educations = Education.where(student_id: params[:student_id])
    render "index.json.jb"
  end

  def show
    @education = Education.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @education = Education.new(
      student_id: current_student.id,
      start_date: params[:start_date],
      end_date: params[:end_date],
      degree: params[:degree],
      university_name: params[:university_name],
      details: params[:details],
    )
    if @education.save
      render json: { message: "Education created successfully" }, status: :created
    else
      render json: { errors: @education.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @education = Education.find_by(id: params[:id])
    if @education.student_id == current_student.id
      @education.start_date = params[:start_date] || @education.start_date
      @education.end_date = params[:end_date] || @education.end_date
      @education.degree = params[:degree] || @education.degree
      @education.university_name = params[:university_name] || @education.university_name
      @education.details = params[:details] || @education.details

      if @education.save
        render "show.json.jb"
      else
        render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Not your education to update!" }, status: :unauthorized
    end
  end

  def destroy
    education = Education.find_by(id: params[:id])
    if education.student_id == current_student.id
      education.destroy
      render json: { message: "Successfully Destroyed Education" }
    else
      render json: { error: "Not your education to delete!" }, status: :unauthorized
    end
  end
end
