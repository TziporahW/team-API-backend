class Api::SkillsController < ApplicationController
  def index
    @skills = Skill.all
    render "index.json.jb"
  end

  def show
    
    # render "show.json.jb"
  end

  def create
    
    # render ".json.jb"
  end

  def update
    
    # render ".json.jb"
  end
  
  def destroy
    
    # render ".json.jb"
  end

end
