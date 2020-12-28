class Api::CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
    render "index.json.jb"
  end

  def show
    
    # render ".json.jb"
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
