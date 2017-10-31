class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
    @resume = Resume.find(params[:id])
  end
  
end
