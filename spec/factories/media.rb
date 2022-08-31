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
FactoryBot.define do
  factory :medium do
    user { create(:user) }
    title { SecureRandom.hex(3) }
    url do
      [
        'https://youtube.com/v=abcxyz',
        'https://youtube.com/v=defgik',
      ].sample
    end
    description { SecureRandom.hex(20) }
  end
end
