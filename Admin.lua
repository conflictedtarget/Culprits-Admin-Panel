-- version
Version = '2.0.1'

-- by
owner = "Culprit"

-- load
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/porrinha09/lib_orion/main/soure.lua')))()
local Window = OrionLib:MakeWindow({Name = "Culprits Admin Panel - v" .. Version, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

wait(1)
-- api load
loadstring(game:HttpGet("https://raw.githubusercontent.com/conflictedtarget/Culprits-Admin-Panel/main/api%20load.lua"))()

local player = game.Players.LocalPlayer
local name = player.DisplayName

local map = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

-- tabs
local Tab = Window:MakeTab({
	Name = "home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("welcome: " .. name)
Tab:AddLabel("game: " .. map)
local Section = Tab:AddSection({
	Name = "by:" .. owner
})

local Tab = Window:MakeTab({
	Name = "Commands",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "commands"
})
Tab:AddButton({
	Name = ";ball",
	Callback = function()
      	                local UserInputService = game:GetService("UserInputService")
                local RunService = game:GetService("RunService")
                local Camera = workspace.CurrentCamera
                
                local SPEED_MULTIPLIER = 30
                local JUMP_POWER = 60
                local JUMP_GAP = 0.3
                
                local character = game.Players.LocalPlayer.Character
                
                for i,v in ipairs(character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                   end
                end
                
                local ball = character.HumanoidRootPart
                ball.Shape = Enum.PartType.Ball
                ball.Size = Vector3.new(5,5,5)
                local humanoid = character:WaitForChild("Humanoid")
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Blacklist
                params.FilterDescendantsInstances = {character}
                
                local tc = RunService.RenderStepped:Connect(function(delta)
                   ball.CanCollide = true
                   humanoid.PlatformStand = true
                if UserInputService:GetFocusedTextBox() then return end
                if UserInputService:IsKeyDown("W") then
                ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("A") then
                ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("S") then
                ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("D") then
                ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
                end
                end)
                
                UserInputService.JumpRequest:Connect(function()
                local result = workspace:Raycast(
                ball.Position,
                Vector3.new(
                0,
                -((ball.Size.Y/2)+JUMP_GAP),
                0
                ),
                params
                )
                if result then
                ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
                end
                end)
                
                Camera.CameraSubject = ball
                humanoid.Died:Connect(function() tc:Disconnect() end)
  	end    
})
Tab:AddButton({
	Name = "Sit",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onJump()
    humanoid.Sit = false
end

humanoid.Sit = true
humanoid.Jumping:Connect(onJump)
  	end    
})
Tab:AddButton({
	Name = "Infinite Jump",
	Callback = function()
      		local infinjump = true
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infinjump then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
  	end    
})
Tab:AddButton({
	Name = "Disable Infinite Jump",
	Callback = function()
      		local infinjump = false
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infinjump then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
  	end    
})

local Tab = Window:MakeTab({
	Name = "player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Player"
})
Tab:AddTextbox({
	Name = "Speed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = (Value)
	end	  
})
Tab:AddTextbox({
	Name = "Jump",
	Default = "50",
	TextDisappear = false,
	Callback = function(Value)
		local player = game.Players.LocalPlayer
local character = player.Character

local jumpHeight = (Value)

local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = jumpHeight
	end	  
})
Tab:AddTextbox({
	Name = "Fov",
	Default = "70",
	TextDisappear = false,
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = (Value)
	end	  
})
local Section = Tab:AddSection({
	Name = "Reset Speed/Jump/Fov"
})
Tab:AddButton({
	Name = "Speed",
	Callback = function()
      		local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
  	end    
})
Tab:AddButton({
	Name = "Jump",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character

local jumpHeight = 50

local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = jumpHeight
  	end    
})
Tab:AddButton({
	Name = "Fov",
	Callback = function()
      		game.Workspace.CurrentCamera.FieldOfView = 70
  	end    
})
local Section = Tab:AddSection({
	Name = "Basics"
})
Tab:AddButton({
	Name = "Reset",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.Health = 0
  	end    
})
Tab:AddButton({
	Name = "Rejoin",
	Callback = function()
      		wait(1)	
game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
  	end    
})
Tab:AddTextbox({
	Name = "Chat",
	Default = "Hello",
	TextDisappear = false,
	Callback = function(Value)
		local args = {
    [1] = (Value) ,
    [2] = "All"
}

game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
	end	  
})
local Section = Tab:AddSection({
	Name = "Movement"
})
Tab:AddButton({
	Name = "Disable Movement",
	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("Humanoid")

local function disableMovement()
    character:WaitForChild("Humanoid").WalkSpeed = 0
end

disableMovement()
  	end    
})
Tab:AddButton({
	Name = "Enable Movement",
	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("Humanoid")

local function enableMovement()
    character:WaitForChild("Humanoid").WalkSpeed = 16 -- You can adjust to the desired speed
end

enableMovement()
  	end    
})
Tab:AddButton({
	Name = "Lock Facing Position",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onJump()
    humanoid.AutoRotate = true
    humanoid.MoveDirection = Vector3.new(0, 0, 0)
    humanoid:MoveTo(humanoid.RootPart.Position)
end

humanoid.AutoRotate = false
humanoid.Jumping:Connect(onJump)
  	end    
})
Tab:AddLabel("To disable, just jump")


local Tab = Window:MakeTab({
	Name = "script hub",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("script hub:")
local Section = Tab:AddSection({
	Name = "admin"
})
Tab:AddButton({
	Name = "infinite yield",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})
Tab:AddButton({
	Name = "Reviz admin",
	Callback = function()
      		loadstring(game:HttpGetAsync("https://pastebin.com/raw/Caniwq2N"))()
  	end    
})
local Section = Tab:AddSection({
	Name = "Fly"
})
Tab:AddButton({
	Name = "Fly",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxnnyyyh148888/Fly-gui/refs/heads/main/Hhhhh"))()
  	end    
})
local Section = Tab:AddSection({
	Name = "Good Scripts"
})
Tab:AddButton({
	Name = "Remove Shadows",
	Callback = function()
      		game.Lighting.GlobalShadows = false
  	end    
})
Tab:AddButton({
	Name = "f3x",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
  	end    
})
local Section = Tab:AddSection({
	Name = "Powers"
})
Tab:AddButton({
	Name = "Wall Walking",
	Callback = function()
      		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Walk-on-Walls-Or-ceilings-1469"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Teleport"
})
Tab:AddButton({
	Name = "TP To Closest Player",
	Callback = function()
      		local p = game.Players.LocalPlayer

local function teleportToClosestPlayer()
    local c = nil
    local d = math.huge
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= p then
            local dist = (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) and
                             (p.Character and p.Character:FindFirstChild("HumanoidRootPart")) and
                             (plr.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude or math.huge
            
            if dist < d then
                d = dist
                c = plr
            end
        end
    end
    
    if c then
        p.Character:MoveTo(c.Character.HumanoidRootPart.Position)
    end
end

teleportToClosestPlayer()
  	end    
})
Tab:AddButton({
	Name = "TP To Farthest Player",
	Callback = function()
      		local players = game.Players:GetPlayers()
local farthestPlayer = nil
local farthestDistance = 0

for i, player in ipairs(players) do
    local distance = (player.Character.HumanoidRootPart.Position - Vector3.new(x, y, z)).Magnitude
    if distance > farthestDistance then
        farthestPlayer = player
        farthestDistance = distance
    end
end

if farthestPlayer then
    farthestPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end
  	end    
})
Tab:AddButton({
	Name = "TP Tool",
	Callback = function()
      	 mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Equip to Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
  	end    
})

local Tab = Window:MakeTab({
	Name = "Loops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Loops on you:"
})
Tab:AddLabel("No way to disable, so use with caution")
Tab:AddButton({
	Name = "Loop Jump",
	Callback = function()
      		while true do
   -- Makes the character jump
local character = game.Players.LocalPlayer.Character
character:WaitForChild("Humanoid").Jump = true
    wait(1) 
end
  	end    
})
Tab:AddButton({
	Name = "Loop Die",
	Callback = function()
      		while true do 
game.Players.LocalPlayer.Character.Humanoid.Health = 0
    wait(1) 
end
  	end    
})

local Tab = Window:MakeTab({
	Name = "Chat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Roblox system"
})
Tab:AddButton({
	Name = "Hide Chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
  	end    
})
Tab:AddButton({
	Name = "Unhide Chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
  	end    
})


Tab:AddLabel("Settings")
Tab:AddButton({
	Name = "Hide UI",
	Callback = function()
      		OrionLib:Destroy()
  	end    
})
Tab:AddButton({
	Name = "Hide Infinite Yeild",
	Callback = function()
      		function maximizeHolder()
					if StayOpen == false then
						pcall(function()
						Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -220), "InOut", "Quart", 0.2, true, nil)
						end)
					end
				end

				minimizeNum = -20
				function minimizeHolder()
					if StayOpen == false then
						pcall(function()
							Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, minimizeNum), "InOut", "Quart", 0.5, true, nil)
						end)
					end
				end

				function execCmd(cmdStr,speaker,store)
					return
				end			

                		Holder.Parent:Destroy()
				getgenv().IY_LOADED = false
  	end   
})

OrionLib:Init()
