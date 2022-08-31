# == Schema Information
#
# Table name: media
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_media_on_url_and_user_id  (url,user_id) UNIQUE
#  index_media_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe '#valid?' do
    it 'is valid when user id and url is unique' do
      user = create(:user)
      user2 = create(:user)

      url = 'https://youtube.com/xv=123456'
      url2 = 'https://youtube.com/xv=456789'

      Medium.create(user:, url:)
      medium2 = Medium.create(user:, url: url2)
      medium3 = Medium.create(user: user2, url: url2)

      expect(medium2).to be_valid
      expect(medium3).to be_valid
    end

    it 'is invalid when user id and url is unique' do
      user = create(:user)
      url = 'https://youtube.com/xv=123456'
      Medium.create!(user:, url:)
      medium2 = Medium.new(user:, url:)

      expect(medium2.valid?).to be_falsy
    end
  end
end
