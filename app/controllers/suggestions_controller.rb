class SuggestionsController < ApplicationController
  # before_action :find_movie 
    before_action :find_suggestion, only: [:edit, :update, :destory,:show]
    before_action :authenticate_user!, only: [:new, :edit]
  # GET /suggestions
  # GET /suggestions.json
#   def index
#     # @suggestions = Suggestion.all
#    # @suggestion = current_user.suggestions.build
#   end

#   # GET /suggestions/1
#   # GET /suggestions/1.json
#   def show
#   end

#   # GET /suggestions/new
#   def new
#     @suggestion = Suggestion.new
#   end

#   # GET /suggestions/1/edit
#   def edit
#   end

#   # POST /suggestions
#   # POST /suggestions.json
#   def create
#     @suggestion = Suggestion.new(suggestion_params)

#     respond_to do |format|
#       if @suggestion.save
#         format.html { redirect_to @suggestion, notice: 'Suggestion was successfully created.' }
#         format.json { render :show, status: :created, location: @suggestion }
#       else
#         format.html { render :new }
#         format.json { render json: @suggestion.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /suggestions/1
#   # PATCH/PUT /suggestions/1.json
#   def update
#     respond_to do |format|
#       if @suggestion.update(suggestion_params)
#         format.html { redirect_to @suggestion, notice: 'Suggestion was successfully updated.' }
#         format.json { render :show, status: :ok, location: @suggestion }
#       else
#         format.html { render :edit }
#         format.json { render json: @suggestion.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /suggestions/1
#   # DELETE /suggestions/1.json
#   def destroy
#     @suggestion.destroy
#     respond_to do |format|
#       format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_suggestion
#       @suggestion = Suggestion.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def suggestion_params
#       params.require(:suggestion).permit(:title, :description, :movie_img, :comment)
#     end
# end



def new 
  #flash.now[:notice] = "Invalid Rating or Comment"
  @suggestion = Suggestion.new
end

def create
  @suggestion = Suggestion.new(suggestion_params)
 # @review = current_user.movies.build_review
  # @suggestion.movie_id = @movie.id 
  @suggestion.user_id = current_user.id
  @suggestion.save
  if @suggestion.valid?
      redirect_to  movie_path(@movie), notice: 'Review was successfully created'
  else
     # render 'new'
      flash[:error] = @suggestion.errors.full_messages
      render 'new' 
  end

end 

def edit
  
end

def update

  
  if @suggestion.update( suggestion_params)
      redirect_to  movie_path(@movie), notice: 'Review was successfully created'
  else
      render 'edit', notice: 'Please fill in areas'
  end
end

def destroy
  @suggestion = current_user.suggestions.find(params[:id])
  @suggestion.destroy
  redirect_to movie_path(@movie)
end

def show
  @suggestions = Suggestion.where(movie_id: @movie.id).order("created_at DESC")
end


private

def suggestion_params
  params.require(:suggestion).permit(:rating, :comment, :user_id, :moive_id, :cover_picture)
end

# def find_movie
#   @movie = Movie.find(params[:movie_id])
# end

def find_suggestion     
  @suggestion = Suggestion.find(params[:id])

end

end