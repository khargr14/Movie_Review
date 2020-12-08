class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new 
    end

    def create
        @movie = Movie.new(movie_params)

        if @movie.save #meaning create
            redirect_to root_path
        else
            render 'new'       
        end
    end


    private
        def movie_params
            params.require(:movie).permit(:title, :description, :director, :movie_length)
        end

end
