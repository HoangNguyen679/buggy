# frozen_string_literal: true

# This controller manage the sharing of user about youtube url
class SharingController < ApplicationController
  before_action :authenticate_user!

  def new
    @medium = Medium.new
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @medium = Medium.new(medium_params)
    @medium.user = current_user

    url = @medium.url
    yt_info_url = "https://www.youtube.com/oembed?url=#{url}&format=json"

    title = get_youtube_video_info(yt_info_url)

    if title.nil?
      @medium.errors.add(:base, 'Can not retrieve data from Youtube.Please try another way')
    else
      @medium.title = title
      redirect_to root_path and return if @medium.save
    end

    render :new, status: :unprocessable_entity
  end
  # rubocop:enable Metrics/MethodLength

  private

  def medium_params
    params.require(:medium).permit(:url, :description)
  end

  def get_youtube_video_info(url)
    begin
      response = Faraday.get(url)
      youtube_info = JSON.parse(response.body)
    rescue StandardError
      return nil
    end

    return nil if youtube_info.nil?

    youtube_info['title']
  end
end
