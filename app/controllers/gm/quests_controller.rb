module Gm
  class QuestsController < ApplicationController
    before_action :set_quest, only: %i[show edit update destroy]

    def index
      @quests = Quest.order(created_at: :desc)
    end

    def show; end

    def new
      @quest = Quest.new
    end

    def create
      @quest = Quest.new(quest_params)
      if @quest.save
        redirect_to gm_quest_path(@quest), notice: 'Quête créée.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @quest.update(quest_params)
        redirect_to gm_quest_path(@quest), notice: 'Quête mise à jour.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @quest.destroy
      redirect_to gm_quests_path, notice: 'Quête supprimée.'
    end

    private

    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:title, :description, :reward_xp, :published)
    end
  end
end
