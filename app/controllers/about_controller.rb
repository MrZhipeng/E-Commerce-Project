class AboutController < ApplicationController
  def index
    @about = About.all
  end
end
