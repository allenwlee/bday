class User < ActiveRecord::Base
  # has_secure_password
  has_many :birthdays
  
  
  MAX_RESULTS = 5000
  REDIRECT_URI = 'http://localhost/auth/google_oauth2/callback'

  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end

  def contacts_url 
    "https://www.google.com/m8/feeds/contacts/default/full?client_id=#{CLIENT_ID}&access_token=#{self.oauth_token}&max-results=#{MAX_RESULTS}"
  end
end
