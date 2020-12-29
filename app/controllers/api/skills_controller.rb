class Api::SkillsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  def index
    @skills = Skill.where(student_id: params[:student_id])
    render "index.json.jb"
  end

  def create
    @skill = Skill.new(
      student_id: current_student.id,
      skill_name: params[:skill_name],
    )
    if @skill.save
      render "show.json.jb"
    else
      render json: { errors: @skill.errors.full_messages }, status: :bad_request
    end

  end

  def show
    @skill = skill.find_by(id: params[:id])
    render "show.json.jb"
  end
  
  def update
    @skill = skill.find_by(id: params[:id])
    if @skill.student_id == current_student.id
      @skill.skill_name = params[:skill_name] || @skill.skill_name
      if @skill.save
        render "show.json.jb"
      else
        render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Not your skill to update!" }, status: :unauthorized
    end

  end
  
  def destroy
    skill = Skill.find_by(id: params[:id])
    if skill.student_id == current_student.id
      skill.destroy
      render json: { message: "Successfully Destroyed Skill" }
    else
      render json: { error: "Not your Skill to delete!" }, status: :unauthorized
    end
  end

end
