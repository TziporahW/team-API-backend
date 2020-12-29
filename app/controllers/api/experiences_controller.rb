class Api::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.where(student_id: params[:student_id])
    render "index.json.jb"
  end

  def show
    @experience = Experience.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @experience = Experience.new(
      student_id: params[:student_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details],
    )
    if @experience.save
      render json: { message: "Experience created successfully" }, status: :created
    else
      render json: { errors: @experience.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @experience = Experience.find_by(id: params[:id])
    if @experience.student_id == current_student.id
      @experience.start_date = params[:start_date] || @experience.start_date
      @experience.end_date = params[:end_date] || @experience.end_date
      @experience.job_title = params[:job_title] || @experience.job_title
      @experience.company_name = params[:company_name] || @experience.company_name
      @experience.details = params[:details] || @experience.details

      if @experience.save
        render "show.json.jb"
      else
        render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Not your experience to update!" }, status: :unauthorized
    end
  end

  def destroy
    experience = Experience.find_by(id: params[:id])
    if experience.student_id == current_student.id
      experience.destroy
      render json: { message: "Successfully Destroyed Experience" }
    else
      render json: { error: "Not your experience to destroy!" }, status: :unauthorized
    end
  end
end
