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
#  index_media_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
