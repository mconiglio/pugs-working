def set_omniauth_facebook(opts = {})
  default = {:provider => :facebook,
             :uuid     => "1234",
             :info => {
                            :email => "foobar@example.com",
                            :gender => "Male",
                            :first_name => "foo",
                            :last_name => "bar"
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

   OmniAuth.config.mock_auth[:facebook] = {
        provider: 'facebook',
        uid: user.facebook_account.uid,
        credentials: {
            token: 'facebook token'
        }
    }
end

def set_omniauth_twitter(opts = {})
  default = {:provider => :twitter,
             :uuid     => "1234",
             :info => {
                            :email => "foobar@example.com",
                            :gender => "Male",
                            :first_name => "foo",
                            :last_name => "bar"
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

   OmniAuth.config.mock_auth[:twitter] = {
        provider: 'twitter',
        uid: user.twitter_account.uid,
        credentials: {
            token: 'twitter token'
        }
    }
end

def set_invalid_omniauth_facebook(opts = {})

  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end

def set_invalid_omniauth_twitter(opts = {})

  credentials = { :provider => :twitter,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end

