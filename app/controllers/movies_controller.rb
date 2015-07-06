class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :mail, :spam]
  before_filter :authenticate



  def mail
    UserMailer.newsletter(@movie, current_user).deliver
    redirect_to @movie, notice: 'Email was succesfully sent.'
  end

  def spam
    users = User.all
    users.each do |user|
      UserMailer.newsletter(@movie, user).deliver
    end
    redirect_to movies_path, notice: 'Email was succesfully sent.'
  end

  def index
   @page = params['page']
   
   @movies = Movie.page(params['page']).order(:updated_at =>  :desc)
  end

 
  def show
    @comment = Comment.new
  end

 
  def new
    @movie = Movie.new
  end


  def edit
  end


  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def authenticate
      authenticate_user! && current_user.try(:admin?)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:name, :director, :description, :year, :length, :format, :image, :thumbnail)
    end
end
