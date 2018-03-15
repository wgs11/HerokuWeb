module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.twitch_profile_name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.display_name, class: "gravatar")
  end

  def test_function(user)
    name = user.twitch_profile_name
    begin
      response = RestClient::Request.execute(
          method: :get,
          url: "https://api.twitch.tv/kraken/users/#{name}/follows/channels/Sheppy",
          headers: {'Client-ID': 'o7ss5wsbwgenfcdehft2hwou5ij9r5'}
      )
      json = JSON.parse(response)
      time = json["created_at"]
      time = DateTime.strptime(time, '%Y-%m-%dT%H:%M:%SZ')
      now = DateTime.now.utc
      interval = now - time
      interval = interval.round
      mm, ss = interval.divmod(60)
      hh, mm = mm.divmod(60)
      dd, hh = hh.divmod(24)
      return "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
    rescue => e
      return JSON.parse(e.response)["message"]
    end
  end
end