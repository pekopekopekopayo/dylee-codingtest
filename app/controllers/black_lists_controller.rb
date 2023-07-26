# frozen_string_literal: true

class BlackListsController < ApplicationController
  after_action :update_rails_cache, only: %i[create destroy]

  def index
    black_lists = BlackList.all

    render json: black_lists
  end

  def create
    black_list = BlackList.create!(create_params)
    RailsCacheService::BlackListService::Update.call

    render json: black_list, status: :created
  end

  def destroy
    black_list = BlackList.find(params[:id]).
    black_list.destroy
    RailsCacheService::BlackListService::Update.call

    head :ok
  end

  private

  def create_params
    params.require(:black_list).permit(:name, :ip_address)
  end
end
