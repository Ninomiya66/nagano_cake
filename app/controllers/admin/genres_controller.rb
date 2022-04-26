class Admin::GenresController < ApplicationController
  
  def index
    
    @genre = Genre.new
    
    @genres = Genre
    
  end

  def edit
    
  end
  
end
