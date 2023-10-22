--// Roblox --> Discord Webhook logs //--
--// Developed by yh_2231 //--
--// Free Script //--
local https = game:GetService("HttpService")

--// Chat logs Module //--
local logschat = true
function Chatlogsrun(message, name)
message = string.gsub(message, "@here", "@.here")
message = string.gsub(message, "@everyone", "@.everyone")
local info = {
        content = "**" .. name .. "**: " .. message .. "",
        username = "Chat Logs"
    }
    local encoded = https:JSONEncode(info)
    https:PostAsync("https://webhook.newstargeted.com/api/webhooks/{WEBHOOK_ID}/{WEBHOOK_TOKEN}", encoded)
end
game.Players.PlayerAdded:Connect(function(player)
    local name = player.DisplayName .. " (@" .. player.Name .. ")"
    player.Chatted:Connect(function(message)
        if logschat == true then
        Chatlogsrun(message, name)
        end
    end)
end)
