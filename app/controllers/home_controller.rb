# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @media = Medium.all.reverse
  end
end
