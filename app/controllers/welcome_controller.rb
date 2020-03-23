class WelcomeController < ApplicationController
  def index
    @name_get = params[:name]
  end
end
