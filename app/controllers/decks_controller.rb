class DecksController < ApplicationController
  before_action :set_deck, only: %i[ show edit update destroy ]

  # GET /decks or /decks.json
  def index
    @all_decks = Deck.all
    @cards = Card.all
  end

  # GET /decks/1 or /decks/1.json
  def show
    @deck = Deck.all
  end

  # GET /decks/new
  def new
    @deck = Deck.new
    @decks = Deck.all
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks or /decks.json
  def create
    @deck = current_user.decks.build(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to deck_url(@deck), notice: "Deck was successfully created." }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1 or /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to deck_url(@deck), notice: "Deck was successfully updated." }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1 or /decks/1.json
  def destroy
    @deck.destroy!

    # respond_to do |format|
      # format.html { redirect_to decks_url, notice: "Deck was successfully destroyed." }
      # format.json { head :no_content }
    # end
    redirect_to your_decks_path, success: "デッキを削除しました", status: :see_other
  end

  def your_decks
    @your_decks = Deck.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def deck_cards
    @deck = Deck.find(params[:id])
  end

  def destroy_your_deck
    @deck = Deck.find(params[:id])
    @deck.deck_cards.destroy_all
    @deck.destroy!
    redirect_to your_decks_path, success: "デッキを削除しました", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:name, card_ids:[])
    end
end
