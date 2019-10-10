class PostsController < ApplicationController


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
    else
      flash[:notice] = "Post can't be empty."
    end

    redirect_back fallback_location: current_user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_back fallback_location: current_user
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
