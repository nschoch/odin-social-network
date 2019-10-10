class RelationshipRequestsController < ApplicationController

    def create
      requestee = User.find(params[:requestee_id])
      @friend_request = current_user.friend_requests.build(requestee: requestee)

      if @friend_request.save
        flash[:notice] = "Friend request has been sent to #{requestee.first_name}"
      else
        flash[:alert] = @friend_request.errors.full_messages.first_name
      end
      
      redirect_back fallback_location: current_user
    end

    def destroy
      @friend_request = RelationshipRequest.find(params[:id])
      @friend_request.destroy
      flash[:notice] = "Friend request cancelled."

      redirect_back fallback_location: current_user
    end
end
