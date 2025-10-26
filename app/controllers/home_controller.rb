class HomeController < ApplicationController
  # Exige login antes de acessar qualquer página deste controller
  before_action :authenticate_user!

  def index
  end
end
