module DonationsHelper
  def calc_ratio(donation)
    ((donation.progress / donation.total) * 100).round
  end
end
