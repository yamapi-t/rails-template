# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::OmniauthCallbacks', type: :request do
  describe 'google_oauth2' do
    context 'ユーザーが未登録の場合' do
      it 'ユーザーが増えること' do
        expect do
          post user_google_oauth2_omniauth_callback_path
        end.to change(User, :count).by(1)
      end

      it 'new_user_session_pathにリダイレクトされること' do
        post user_google_oauth2_omniauth_callback_path

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'ユーザーが登録済みの場合' do
      before { create(:user, :confirmed, email: 'test@example.com') }

      it 'ユーザーが増えないこと' do
        expect do
          post user_google_oauth2_omniauth_callback_path
        end.not_to change(User, :count)
      end

      it 'root_pathにリダイレクトされること' do
        post user_google_oauth2_omniauth_callback_path

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
