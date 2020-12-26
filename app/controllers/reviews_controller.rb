class ReviewsController < ApplicationController
    before_action :find_movie 
    before_action :find_review, only: [:edit, :update, :destory,:show]
    before_action :authenticate_user!, only: [:new, :edit]
    


    def new 
        #flash.now[:notice] = "Invalid Rating or Comment"
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
       # @review = current_user.movies.build_review
        @review.movie_id = @movie.id 
        @review.user_id = current_user.id
        #if @review.save
        if @review.valid?
            redirect_to  movie_path(@movie), notice: 'Review was successfully created'
        else
           # render 'new'
            flash[:error] = @review.errors.full_messages
            render 'new' 
        end

    end 

    def edit
        
    end

    def update

        
        if @review.update( review_params)
            redirect_to  movie_path(@movie), notice: 'Review was successfully created'
        else
            render 'edit', notice: 'Please fill in areas'
        end
    end
    
    def destroy
        @review = current_user.reviews.find(params[:id])
        @review.destroy
        redirect_to movie_path(@movie)
    end

    def show
        @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
    end


    private
    
    def review_params
        params.require(:review).permit(:rating, :comment, :user_id, :moive_id, :cover_picture)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end

    def find_review     
        @review = Review.find(params[:id])
 
    end

end