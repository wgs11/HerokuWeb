class User < ApplicationRecord

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :display_name, presence: true
  validates :display_name, uniqueness: true
  validate :display_name_must_exist

  def display_name_must_exist
    if twitch_profile_name.present?
      name = twitch_profile_name
      begin
        response = RestClient::Request.execute(
            method: :get,
            url: "https://api.twitch.tv/kraken/users/#{name}/",
            headers: {'Client-ID': 'o7ss5wsbwgenfcdehft2hwou5ij9r5'}
        )
      rescue => e
        errors.add(:twitch_profile_name, "problem captain")
      end
    end
  end
end