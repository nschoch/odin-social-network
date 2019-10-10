class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @post = @user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

end
