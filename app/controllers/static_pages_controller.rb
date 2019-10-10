class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to current_user
    else
      redirect_to new_user_session_url
    end
  end
end
