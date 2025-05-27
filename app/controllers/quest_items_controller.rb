class QuestItemsController < ApplicationController
  before_action :set_quest_item, only: [ :update, :destroy ]

  def index
    @quest_items = QuestItem.all
  end

  def new
    @quest_item = QuestItem.new

    render :new
  end

  def create
    @quest_item = QuestItem.new(quest_item_params)

    if @quest_item.save
      redirect_to quest_items_path, notice: "Quest item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quest_item.update(quest_item_params)
      redirect_to quest_items_path, notice: "Quest item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quest_item.destroy!
    redirect_to quest_items_path, notice: "Quest item was successfully deleted."
  end

  private

  def quest_item_params
    params.require(:quest_item).permit(:name, :completed, :id)
  end

  def set_quest_item
    @quest_item = QuestItem.find(params[:id])
  end
end
