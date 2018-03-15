module GamesHelper
  def num_to_time(time)
    Time.at(time).utc.strftime("%H:%M:%S")
  end
end
