class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
  end

  # POST /suggestions
  # POST /suggestions.json
  # def create
  #   @suggestion = Suggestion.new(suggestion_params)

  #   respond_to do |format|
  #     if @suggestion.save
  #       format.html { redirect_to @movie, notice: 'Suggestion was successfully created.' }
  #       format.json { render :show, status: :created, location: @suggestion }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @suggestion.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    # binding.pry
    @suggestion = current_user.suggestions.build(suggestion_params)
    @suggestion.user_id = current_user.id
 
    if @suggestion.save # c
      redirect_to root_path
    else
      render 'new'
    end
  end







  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  # def destroy
  #   @suggestion.destroy
  #   respond_to do |format|
  #     format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


  def destroy
    # @suggestion = Suggestion.find(params[:id])
    @suggestion = current_user.suggestions.find(params[:id])
    @suggestion.destroy
    flash[:notice] = "Movie Suggestion '#{@suggestion.title}' deleted."
    redirect_to root_path
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suggestion_params
      params.require(:suggestion).permit(:title, :description, :movie_img, :comment, :user_id, :cover_picture)
    end
end