class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @prototypes = Prototype.eager_load(:user).tagged_with(params[:tag_name])
  end
end
