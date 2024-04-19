class ApplicationController < ActionController::Base

  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
