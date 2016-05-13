class HomeController < ApplicationController
skip_before_action :authenticate_user!, only: [:land]

  def land
  end
end
