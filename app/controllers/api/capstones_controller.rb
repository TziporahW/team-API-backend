class Api::CapstonesController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  def index
    @capstones = Capstone.all
    render "index.json.jb"
  end

  def create
    @capstone = Capstone.new(
      student_id: params[:current_student_id],
      name: params[:name],
      description: params[:description],
      url: params[:url],
      screenshot_url: params[:screenshot_url]
    )
    if @capstone.save
    render "show.json.jb"
    else
      render json: { errors: @capstone.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @capstone = Capstone.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @capstone = Capstone.find_by(id: params[:id])
    @capstone.name = params[:name] || @capstone.name
    @capstone.description = params[:description] || @capstone.description
    @capstone.url = params[:url] || @capstone.url
    @capstone.screenshot_url = params[:screenshot_url] || @capstone.screenshot_url
    render "show.json.jb"
  end
  
  def destroy
    capstone = Capstone.find_by(id: params[:id])
    capstone.destroy
    render json: {message: "Photo successfully destroyed."}
  end

end
