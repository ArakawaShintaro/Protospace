class RankingsController < ApplicationController

  def index
    @ranking_products = Prototype.page(params[:page]).per(8).order(like_count: :desc)
  end

end
