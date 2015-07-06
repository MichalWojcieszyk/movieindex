class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params) 

    respond_to do |format|
      if @comment.save
        format.html {redirect_to movie_path(@movie) , notice: "Comment was successfully created"}
        format.json {render action: 'show', status: :created, location: @comment}
      else
        format.html {redirect_to movie_path(@movie) , notice: "Comment was NOT successfully created"}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end 
  end



  def destroy
    @comment.destroy
   respond_to do |format|
    format.html {redirect_to movie_path(@comment.movie_id)}
    format.json {head :no_content}
  end

  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :author, :content, :rating, :movie_id)
    end
end
