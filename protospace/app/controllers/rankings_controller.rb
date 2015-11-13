class RankingsController < ApplicationController

  def index
    @ranking_products = Prototype.includes(:tags).page(params[:page]).per(8).order(like_count: :desc)
  end

end
