Donation.delete_all
Game.delete_all
Category.delete_all

Games = [
    ["Super Mario 64", "sm64logo.png"],
    ["Super Mario Sunshine", "smslogo.png"],
    ["Super Meat Boy", "smb.png"],
    ["Paper Mario 64", "papermario.png"]
]

Categories = [
    ["Super Mario 64", "16 Star", 1050, "6-agF6rcktM"],
    ["Super Mario 64", "70 Star", 3390, "O-d1ponqdOk"],
    ["Paper Mario 64", "Glitchless", 15273, "ZKDw0Yu-6-U"]
]

Incentives = [
    [0, 301, "Super Mario 602", "smslogo.png"],
    [97.85, 250, "Paper Mario TTYD 100%", "ttyd.jpg"],
    [0, 200, "SM64 700 Star Run", "sm64logo.png"],
    [21, 150, "Wind Waker Any%", "ww.png"],
    [0.1, 150, "Paper Mario 64 100%", "papermario.png"],
    [120, 120, "24 Hour Stream", "smslogo.png"],
    [1, 100, "SMS 420", "smslogo.png"],
    [0, 100, "SMS All Categories", "smslogo.png"],
    [0, 100, "LoZ: Ocarina of Time Any% Glitchless", "oot.png"],
    [0, 100, "LoZ: Majora's Mask Any% Glitchless", "mm.png"],
    [0, 100, "LoZ: Majora's Mask All Masks", "mm.png"],
    [100, 100, "Super Mario Galaxy 2 242", "smglogo.png"],
    [75, 75, "Drinking Stream", "smslogo.png"],
    [75, 75, "Super Mario 64 Chaos 70 Star", "sm64logo.png"],
    [0, 65, "Paper Mario TTYD Any%", "ttyd.jpg"],
    [65, 65, "Shovel Knight Any%", "smslogo.png"],
    [0, 45, "Paper Mario 64 Glitchless", "papermario.png"],
    [16, 30, "Pikmin All Parts", "Pikmin_logo.png"],
    [0, 30, "Pikmin 2 Pay off Debt", "Pikmin_logo.png"],
    [30, 30, "Pikmin 2 All Treasures", "Pikmin_logo.png"],
    [0.21, 25, "Pokemon Red/Blue Glitchless", "red.png"],
    [25, 25, "Perler Giveaway", "smslogo.png"],
    [3, 35, "Spyro Year of the Dragon 117%", "spyro.png"],
    [30, 30, "Super Meat Boy Any%", "smb.png"],
    [30, 30, "Chubby Bunny", "smslogo.png"],
    [0, 100, "Paper Mario TTYD 'I Love Yous'", "ttyd.jpg"]
]
Games.each do |name, image_url|
  Game.create(name: name, image_url: image_url)
end

Categories.each do |game_id, cat_name, time, video_url|
  Category.create(game_id: game_id, cat_name: cat_name, time: time, video_url: video_url)
end

Incentives.each do |progress, total, incentive, image_url|
  Donation.create(progress: progress, total: total, incentive: incentive, image_url: image_url)
end
