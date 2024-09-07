# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#find_or_create_for_oauth!' do
    context 'ユーザーが未登録の場合' do
      it 'ユーザーが増えること' do
        expect do
          described_class.find_or_create_for_oauth!(OmniAuth.config.mock_auth[:google_oauth2])
        end.to change(described_class, :count).by(1)
      end
    end

    context 'ユーザーが登録済みの場合' do
      before { create(:user, :confirmed, email: 'test@example.com') }

      it 'ユーザーが増えないこと' do
        expect do
          described_class.find_or_create_for_oauth!(OmniAuth.config.mock_auth[:google_oauth2])
        end.not_to change(described_class, :count)
      end
    end
  end
end
