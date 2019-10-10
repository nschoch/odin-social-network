class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.build
    @feed_items = @user.feed.paginate(page: params[:page])
  end

end
