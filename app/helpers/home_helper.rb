module HomeHelper
  TRUNCATE_SIZE = 100

  def truncate_youtube_id(youtube_url)
    youtube_url.split('=').last
  end

  def make_youtube_embed_url(youtube_url)
    "https://www.youtube.com/embed/#{truncate_youtube_id(youtube_url)}?rel=0&autoplay=0"
  end

  def truncate_description(description)
    description.truncate(TRUNCATE_SIZE)
  end
end
