class ApplicationController < ActionController::Base
  def index
    @platforms = Platform.all
  end
end
