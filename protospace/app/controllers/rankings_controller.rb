class RankingsController < ApplicationController

  def index
    @ranking_products = Prototype.eager_load(:tags).page(params[:page]).per(8).order(like_count: :desc)
  end

end
