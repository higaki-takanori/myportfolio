class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :set_play

  def create
    if @play.user_id != current_user.id
      @like = Like.create(user_id: current_user.id, play_id: @play.id)
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_url) }
        format.js
      end
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, play_id: @play.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end

  private
    def set_play
      @play = Play.find(params[:play_id])
    end
end
