# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @media = Medium.all
  end
end
