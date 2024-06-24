class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def store_current_location
    session[:previous_url] = request.fullpath if request.get? && !request.xhr?
  end

  def render_404
    # flash.now[:danger] = "データが見つかりません。"
    # render :index, status: :not_found
    respond_to do |format|
      format.html { redirect_to root_path, alert: "データが見つかりませんでした。"}
      format.any { head :not_found }
    end
  end
end
