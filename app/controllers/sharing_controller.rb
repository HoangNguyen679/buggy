# frozen_string_literal: true

# This controller manage the sharing of user about youtube url
class SharingController < ApplicationController
  before_action :authenticate_user!

  def new
    @medium = Medium.new
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def create
    @medium = Medium.new(medium_params)

    url = @medium.url
    yt_info_url = "https://www.youtube.com/oembed?url=#{url}&format=json"
    begin
      response = Faraday.get(yt_info_url)
      yt_info = JSON.parse(response.body)
    rescue StandardError => e
      render :new, status: :unprocessable_entity
    end

    @medium.title = yt_info['title']
    @medium.user = current_user

    if @medium.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  def medium_params
    params.require(:medium).permit(:url, :description)
  end
end
