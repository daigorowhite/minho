class TopController < ApplicationController
  def index
    @dialects = Dialect.all
  end
end
