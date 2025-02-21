local gui = Instance.new("ScreenGui")
gui.Name = "MyGUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local screenWidth, screenHeight = workspace.CurrentCamera.ViewportSize

local window = Instance.new("Frame")
window.BackgroundColor3 = Color3.new(0, 0, 0)
window.Size = UDim2.new(0, 300, 0, 220) 
window.Position = UDim2.new(0.5, -150, 0.5, -110)
window.Parent = gui

local topText = Instance.new("TextLabel")
topText.Text = "Better Admin - options"
topText.TextColor3 = Color3.new(1, 1, 1)
topText.TextSize = 18
topText.Size = UDim2.new(1, 0, 0, 30)
topText.BackgroundColor3 = Color3.new(0, 0, 0) 
topText.Parent = window

local closeButton = Instance.new("TextButton")
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextSize = 18
closeButton.Size = UDim2.new(0, 100, 0, 30)
closeButton.Position = UDim2.new(1, -110, 1, -40)
closeButton.Text = "Close"
closeButton.Parent = window

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy() 
end)

-- buttons

local button1 = Instance.new("TextButton")
button1.BackgroundColor3 = Color3.new(0, 0, 0)
button1.TextColor3 = Color3.new(1, 1, 1)
button1.TextSize = 14
button1.Size = UDim2.new(0, 100, 0, 30)
button1.Position = UDim2.new(0, 10, 0, 40)
button1.Text = "Culprits Admin Panel"
button1.Parent = window

button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/conflictedtarget/Culprits-Admin-Panel/main/Admin.lua",true))()
end)

local button2 = Instance.new("TextButton")
button2.BackgroundColor3 = Color3.new(0, 0, 0)
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14
button2.Size = UDim2.new(0, 100, 0, 30)
button2.Position = UDim2.new(0, 130, 0, 40)
button2.Text = "infinite yield"
button2.Parent = window

button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local button3 = Instance.new("TextButton")
button3.BackgroundColor3 = Color3.new(0, 0, 0)
button3.TextColor3 = Color3.new(1, 1, 1)
button3.TextSize = 14
button3.Size = UDim2.new(0, 100, 0, 30)
button3.Position = UDim2.new(0, 10, 0, 80)
button3.Text = "fly"
button3.Parent = window

button3.MouseButton1Click:Connect(function()
     loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
end)

local button4 = Instance.new("TextButton")
button4.BackgroundColor3 = Color3.new(0, 0, 0)
button4.TextColor3 = Color3.new(1, 1, 1)
button4.TextSize = 14
button4.Size = UDim2.new(0, 100, 0, 30)
button4.Position = UDim2.new(0, 130, 0, 80)
button4.Text = "vfly"
button4.Parent = window

button4.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
end)
