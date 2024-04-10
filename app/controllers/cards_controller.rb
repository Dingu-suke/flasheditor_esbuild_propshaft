class CardsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @card = Card.new()
  end

  def index
    @drafts = Card.includes(:user)
    # pborads = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def create
    @card = current_user.cards.build(cards_params)
    if @card.save
      redirect_to cards_path, success: "保存成功"
    else
      flash.now[:danger] = "保存失敗"
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  def your_cards 
    @your_cards = Card.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  private
  def cards_params
    params.require(:card).permit(:title, :body)
  end

end
