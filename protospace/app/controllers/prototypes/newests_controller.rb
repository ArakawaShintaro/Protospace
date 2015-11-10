class Prototypes::NewestsController < ApplicationController

def index
  @prototypes = Prototype.page(params[:page]).per(8).order(id: :desc)
end

end
