class ContactController < ApplicationController
  def index
    @contact = Contact.all
  end
end
