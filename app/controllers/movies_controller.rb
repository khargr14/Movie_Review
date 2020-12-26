class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destory]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :movie_order, only: [:index, :show, :edit, :destory]

  def index
 #  @movies = Movie.all.order created_at: :desc # have to refactor
  end


  def show
    puts "###{@movie.ratings}##"
    @rating = @movie.ratings.inject(0){|sum,x| sum + x }/@movie.ratings.size rescue 0
   #@movies = Movie.all.order created_at: :desc # have to refactor
    if @movie.reviews.blank?
        @average = 0
    else
        @average = @movie.reviews.average(:rating).round (2)
    end 
  
  end


  def new
    @movie = current_user.movies.build
    
  end

  def create
    # binding.pry
    @movie = current_user.movies.build(movie_params)
    @movie.user_id = current_user.id
 
    if @movie.save # c
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    

  end

  def update
    
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end

  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to root_path
    end



    private
  def movie_params
    params.require(:movie).permit(:title, :description, :director, :movie_length,
                                  :movie_img, :user_id, :cover_picture)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_order
    @movies = Movie.all.order created_at: :desc
  end
end
