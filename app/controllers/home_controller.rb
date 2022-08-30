class HomeController < ApplicationController
  def index
    @media = Medium.all
  end
end
