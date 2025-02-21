-- api load:
-- by: culprit

-- notification
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local message = "Welcome"

game.StarterGui:SetCore("SendNotification", {
    Title = "Culprits Admin Panel Api:",
    Text = message,
    Duration = 5 -- Duration in seconds
})
