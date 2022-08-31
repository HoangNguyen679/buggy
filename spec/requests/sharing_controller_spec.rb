# frozen_string_literal: true

require 'rails_helper'

describe SharingController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST /share' do
    context 'when sharing a youtube url' do
      it 'can share the youtube url if all data is valid' do
        expect_any_instance_of(SharingController).to receive(:get_youtube_video_info).and_return('title')
        expect do
          post '/share', params: {
            medium: {
              url: 'Status',
              description: 'Howdy!',
            },
          }
        end.to change {
                 user.media.reload.count
               }.from(0).to(1)

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
