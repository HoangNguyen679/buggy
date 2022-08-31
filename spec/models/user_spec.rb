# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'is valid when email is unique' do
      user1 = create(:user)
      user2 = create(:user)

      expect(user2.email).not_to be user1.email
      expect(user2).to be_valid
    end

    it 'is invalid when email is taken' do
      create(:user, email: 'adam@example.org')

      user = User.new
      user.email = 'adam@example.org'
      expect(user).not_to be_valid
    end

    it 'is invalid if the username is take' do
      user1 = create(:user)
      user2 = create(:user)

      expect(user2).to be_valid
      user2.username = user1.username
      expect(user2).not_to be_valid
    end

    it 'is invalid if the email looks bogus' do
      user = create(:user)
      expect(user).to be_valid

      user.email = ''
      expect(user).to be_invalid

      user.email = 'foo.bar'
      expect(user).to be_invalid

      user.email = 'foo.bar#example.com'
      expect(user).to be_invalid

      user.email = 'f.o.o.b.a.r@example.com'
      expect(user).to be_valid

      user.email = 'foo+bar@example.com'
      expect(user).to be_valid

      user.email = 'foo.bar@sub.example.co.id'
      expect(user).to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
