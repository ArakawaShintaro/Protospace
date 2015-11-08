class Prototypes::NewestsController < ApplicationController
    def index
    @prototypes = Prototype.order('id DESC').limit(8)
    end
end
