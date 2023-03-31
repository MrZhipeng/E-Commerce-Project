class PlatformsController < ApplicationController
  before_action :set_platform, only: %i[ show edit update destroy ]

  # GET /platforms or /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1 or /platforms/1.json
  def show
  end

end
