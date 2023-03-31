class PlatformsController < ApplicationController

  # GET /platforms or /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1 or /platforms/1.json
  def show
  end

end
