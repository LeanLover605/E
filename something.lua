local url = "https://webhook.lewisakura.moe/api/webhooks/1187396957325492344/vqt8WyKcUYBgdZlTSvfeGYkIS4w1nb-wRidvW1Owedv88QqW3JNBFyUFcHWOzyN0NW2z" --change to your own
local http = game:GetService("HttpService")

game.Players.PlayerAdded:Connect(function(player)
	local data = {
		["embeds"] = {{

			["author"] = {
				["name"] = player.Name,
				["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..player.Name,
				["color"] = tonumber(0x57DF2D),
			},
			["fields"] = {
				{
					["name"] = "Game ID:",
					["value"] = game.ID,
					["inline"] = true,
					["color"] = 1043474
				},
				{
					["name"] = "User ID:",
					["value"] = player.UserId,
					["inline"] = true,
					["color"] = 1043474
				},
				{
					["name"] = "Link to Account:",
					["value"] = "[Click Here](https://www.roblox.com/users/".. player.UserId .. "/profile)",
					["inline"] = true,
					["color"] = 1043474
				}
			}
		}},

	}
	local finaldata = http:JSONEncode(data)
	http:PostAsync(url, finaldata)
end)


game.Players.PlayerRemoving:Connect(function(player)
	local data = {
		['embeds'] = {{
			['title'] = "**Player left**",
			['description'] = player.Name .. " has left the game.",
			['color'] = 0,
			['url'] = "https://www.roblox.com/users/".. player.UserId .. "/profile"
		}}
	}

	local finaldata = http:JSONEncode(data)
	http:PostAsync(url, finaldata)
end)
