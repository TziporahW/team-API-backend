class Api::StudentsController < ApplicationController
  before_action :authenticate_user, except: [:create, :index, :show]

  def index
    @students = Student.all 
    render json: 'index.json.jb'
  end
  
  def create
    @student = Student.new(
      first_name: params[:first_name]
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number],
      short_bio: params[:short_bio],
      linkedin_url: params[:linkedin_url],
      twitter_handle: params[:twitter_handle],
      personal_website_url: params
      [:personal_website_url],
      online_resume_url: params
      [:online_resume_url],
      github_url: params
      [:github_url],
      photo_url: params
      [:photo_url]
    )
    if @student.save
      render json: 'show.json.jb'
    else
      render json: { errors: @student.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @student = Student.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @student = Student.find(params[:id])

    @student.first_name = params[:first_name] || @student.first_name
    @student.last_name = params[:last_name] || @student.last_name
    @student.email = params[:email] || @student.email
    @student.phone_number = params[:phone_number] || @student.phone_number
    @student.short_bio = params[:short_bio] || @student.short_bio
    @student.linkedin_url = params[:linkedin_url] || @student.linkedin_url
    @student.twitter_handle = params[:twitter_handle] || @student.twitter_handle
    @student.personal_website_url = params[:personal_website_url] || @student.personal_website_url
    @student.online_resume_url = params[:online_resume_url] || @student.online_resume_url
    @student.github_url = params[:github_url] || @student.github_url
    @student.photo_url = params[:photo_url] || @student.photo_url

    if @student.save
      render 'show.json.jb'
    else 
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy
    render json: {message: "Student successfully deleted!"}
  end
end
