# frozen_string_literal: true

# Home page
class HomeController < ApplicationController
  def index
    @media = Kaminari.paginate_array(Medium.all.reverse).page(params[:page]).per(5)
  end
end
