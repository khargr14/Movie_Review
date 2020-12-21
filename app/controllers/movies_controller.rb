class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destory]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @movies = Movie.movies_desc_order
    
  end


  def show
    puts "###{@movie.ratings}##"
    @rating = @movie.ratings.inject(0){|sum,x| sum + x }/@movie.ratings.size rescue 0
    @movies = Movie.movies_desc_order
    if @movie.reviews.blank?
        @average = 0
    else
        @average = @movie.reviews.average(:rating).round (2)
    end 
    
  end


  def new
    @movie = current_user.movies.build
    # @categories= Category.all.map { |c| [c.name, c.id] }
  end

  def create
    # binding.pry
    @movie = current_user.movies.build(movie_params)
    @movie.user_id = current_user.id
    # @movie.category_id = params[:category_id]
    if @movie.save # c
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    #  @categories= Category.all.map { |c| [c.name, c.id] }

  end

  def update
    # @movie.category_id = params[:category_id]
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
                                  :movie_img, :user_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
