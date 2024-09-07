# frozen_string_literal: true

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                     provider: 'google_oauth2',
                                                                     uid: '000000',
                                                                     info: { email: 'test@exmaple.com' },
                                                                     credentials: { token: 'google_oauth2_test' }
                                                                   })
