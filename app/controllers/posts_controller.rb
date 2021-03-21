class PostsController < ApplicationController
  def new
    @post = Post.new()
  end

  def create
    if user_signed_in?
      @post = Post.new(new_post_params)
      if @post.save!
        flash[:notice] = "New post created!"
        redirect_to root_url
      else
        flash[:danger] = "Failed to create new post."
        redirect_to new_post_path
      end

    end
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy
    redirect_to root_url, notice: "Post deleted."
  end

  private

  def new_post_params
    params.require(:post).permit(:user_id, :cafename, :wifi, :rate, :comment, :img)
  end

end
