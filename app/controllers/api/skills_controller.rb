class Api::SkillsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  def index
    @skills = Skill.all
    render "index.json.jb"
  end

  def create
    @skill = Skill.new(
      current_student_id: params[:current_student_id],
      name: params[:name],
    )
    if @skill.save
      render "show.json.jb"
      else
        render json: { errors: @skill.errors.full_messages }, status: :bad_request
      end
    render "show.json.jb"
  end

  def show
    @skill = skill.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @skill = skill.find_by(id: params[:id])
    @skill.current_student_id = params[:current_student_id] || @skill.current_student_id
    @skill.name = params[:name] || @skill.name
    render "show.json.jb"
  end
  
  def destroy
    skill = Skill.find_by(id: params[:id])
    skill.destroy
    render json: {message: "Photo successfully destroyed."}
  end

end
