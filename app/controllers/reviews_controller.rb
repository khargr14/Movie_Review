class ReviewsController < ApplicationController
    before_action :find_movie 
    before_action :find_review, only: [:edit, :update, :destory]

    def new 
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.movie_id = @movie.id 
        @review.user_id = current_user.id

        if @review.save
            redirect_to  movie_path(@movie)
        else
            render 'new'
         end
    end

    def edit
        
    end

    def update


        if @review.update( review_params)
            redirect_to  movie_path(@movie)
        else
            render 'edit'
        end
    end
    
    def destroy
        @review = current_user.reviews.find(params[:id])
        @review.destroy
        redirect_to movie_path(@movie)
    end




    private
    
    def review_params
        params.require(:review).permit(:rating, :comment, :user_id, :moive_id)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end

    def find_review     
        
        @review = Review.find(params[:id])
    end

end