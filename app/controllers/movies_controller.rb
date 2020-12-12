class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update, :destory]

    def index
        @movies = Movie.all.order("created_at DESC")
    end


    def show
    end


    def new
        @movie = current_user.movies.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end

    def create
        @movie = current_user.movies.build(movie_params)
        @movie.categories_id = params [:category_id]

        if @movie.save #c
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
            params.require(:movie).permit(:title, :description, :director, :movie_length, :category_id)
        end

        def find_movie
            @movie = Movie.find(params[:id])
        end
end
