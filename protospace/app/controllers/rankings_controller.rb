class RankingsController < ApplicationController

  def index
    @ranking_products = Prototype.order(like_count: :desc)
  end

end
