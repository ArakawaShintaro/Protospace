class Prototypes::NewestsController < ApplicationController

def index
  @prototypes = Prototype.eager_load(:tags).page(params[:page]).per(8).order(id: :desc)
end

end
