--// Roblox --> Discord Webhook logs //--
--// Developed by yh_2231 //--
--// Free Script //--
local https = game:GetService("HttpService")


--// Join Logs Module //--
local logjoins = true
local logleaves = true
game.Players.PlayerAdded:Connect(function(player)
    if logjoins == true then
local playerName = player.Name
local message = {
		["username"] = "Join Logs",
		["embeds"] = {{
			["title"] = "Player Joined",
			["description"] = playerName .. " has joined the " ..game.Name.. " [Profile](https://www.roblox.com/users/"..player.UserId..")/[Game](https://www.roblox.com/games/"..game.PlaceId..")",
			["color"] = tonumber("0x00ff00")
		}}
	}
local encodedMessage = https:JSONEncode(message)
local response = https:PostAsync("https://webhook.newstargeted.com/api/webhooks/{WEBHOOK_ID}/{WEBHOOK_TOKEN}", encodedMessage)
end
end)
game.Players.PlayerRemoving:Connect(function(player)
if logleaves == true then
	local playerName = player.Name
	local message = {
		["username"] = "Leave Logs",
		["avatar_url"] = nil, -- Replace with your own avatar URL
		["embeds"] = {{

			["title"] = "Player Left",
			["description"] =  playerName .. " has left the " ..game.Name.. " [Profile](https://www.roblox.com/users/"..player.UserId..")/[Game](https://www.roblox.com/games/"..game.PlaceId..")",
			["color"] = tonumber("0xff0000")
		}}
	}
	local encodedMessage = https:JSONEncode(message)

	local response = https:PostAsync(""https://webhook.newstargeted.com/api/webhooks/{WEBHOOK_ID}/{WEBHOOK_TOKEN}"", encodedMessage)
end
end)