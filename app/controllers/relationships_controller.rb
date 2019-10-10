class RelationshipsController < ApplicationController

  def create
    friender = User.find(params[:friender_id])
    @relationship = friender.friendships.build(friendee: current_user)

    if @relationship.save
      flash[:notice] = "Accepted friend request."
      @relationship_request = RelationshipRequest.find_by(requestee_id: current_user.id, requester_id: params[:friender_id])
      @relationship_request.delete
    else
      flash[:alert] = @relationship.errors.full_messages.first
    end

    redirect_back fallback_location: current_user
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    @unfriended_user = @relationship.return_inverse_role(current_user)
    flash[:notice] = "#{@unfriended_user.first_name} unfriended."

    redirect_back fallback_location: current_user
  end
end
