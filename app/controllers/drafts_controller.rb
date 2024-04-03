class DraftsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @draft = Draft.new()
  end

  def index
    @drafts = Draft.includes(:user)
    # pborads = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def create
    @draft = current_user.drafts.build(drafts_params)
    if @draft.save
      redirect_to drafts_path, success: "保存成功"
    else
      flash.now[:danger] = "保存失敗"
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
  def drafts_params
    params.require(:draft).permit(:title, :body)
  end

end
