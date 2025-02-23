-- version
Version = '2.0.8'

-- by
owner = "Culprit"

-- load
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/porrinha09/lib_orion/main/soure.lua')))()
local Window = OrionLib:MakeWindow({Name = "Culprits Admin Panel - v" .. Version, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

wait(1)
-- api load
loadstring(game:HttpGet("https://raw.githubusercontent.com/conflictedtarget/Culprits-Admin-Panel/main/api%20load.lua"))()
game:GetService("GuiService"):OpenBrowserWindow("https://dsc.gg/culpritssociety") 
local player = game.Players.LocalPlayer
local name = player.DisplayName

local map = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

-- tabs
local Tab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("Welcome, " .. name)
Tab:AddLabel("Current Game: " .. map)
local Section = Tab:AddSection({
	Name = "Created By " .. owner
})
Tab:AddButton({
    Name = "Discord Server",
    Callback = function()
        local discordLink = "https://dsc.gg/culpritssociety"
        setclipboard(discordLink)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Discord Link",
            Text = "Discord link copied to your clipboard! Paste it in your browser.",
            Duration = 7
        })
    end
})
Tab:AddButton({
    Name = "Roblox Group",
    Callback = function()
        local discordLink = "https://www.roblox.com/communities/32715078/Culprits-Society#!/about"
        setclipboard(discordLink)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Roblox Group",
            Text = "Roblox Group link copied to your clipboard! Paste it in your browser.",
            Duration = 7
        })
    end
})
Tab:AddButton({
    Name = "Youtube Channel",
    Callback = function()
        local discordLink = "https://www.youtube.com/@conflictedtarget"
        setclipboard(discordLink)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Youtube Channel",
            Text = "Youtube Channel link copied to your clipboard! Paste it in your browser.",
            Duration = 7
        })
    end
})



local Tab = Window:MakeTab({
	Name = "Player",
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
local Section = Tab:AddSection({
	Name = "Basic"
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

local Section = Tab:AddSection({
	Name = "Fun"
})
Tab:AddButton({
	Name = "Ball",
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

local Section = Tab:AddSection({
	Name = "Movement"
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
Tab:AddButton({
    Name = "Zero Gravity",
    Callback = function()
        game:GetService("Workspace").Gravity = 0
    end    
})

Tab:AddButton({
    Name = "Fix Gravity",
    Callback = function()
        game:GetService("Workspace").Gravity = 196.2
    end    
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

local Tab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "UI System"
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

Tab:AddButton({
	Name = "Kill UI",
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


local Tab = Window:MakeTab({
	Name = "Script Hub",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Admin Scripts"
})

Tab:AddButton({
	Name = "Culprits Admin (BETA)",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/conflictedtarget/Culprits-Admin-Client/refs/heads/main/Culprits-Admin.lua'))()
  	end    
})
Tab:AddButton({
	Name = "Nameless Admin",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
  	end    
})
Tab:AddButton({
	Name = "Infinite Yeild",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})
local Section = Tab:AddSection({
	Name = "FE Scripts"
})
Tab:AddButton({
	Name = "FE Seraphic Blade (R6)",
	Callback = function()
      		loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
  	end    
})
Tab:AddButton({
	Name = "FE Zombie Animation (R6)",
	Callback = function()
      		loadstring(game:HttpGet("https://pastefy.app/JOWniO6o/raw"))()
  	end    
})
Tab:AddButton({
	Name = "FE Troll Animation (18+)",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
  	end    
})
Tab:AddButton({
	Name = "FE FakeVerified V2",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/xYtmSfL5", true))()
  	end    
})
local Section = Tab:AddSection({
	Name = "Universal Cheats"
})
Tab:AddButton({
	Name = "Aimbot",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/Universal%20Aimbot.lua",true))()
  	end    
})
Tab:AddButton({
	Name = "Hit Box Expander",
	Callback = function()
      		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Update-script-hitbox-9326"))()
  	end    
})

local Section = Tab:AddSection({
	Name = "Fly Scripts"
})
Tab:AddButton({
	Name = "HD Admin Fly",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxnnyyyh148888/Fly-gui/refs/heads/main/Hhhhh"))()
  	end    
})
Tab:AddButton({
	Name = "Superman Fly Tool (Click To Fly)",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/b4-st/Superman-Fly/refs/heads/main/Script.lua'))()
  	end    
})
local Section = Tab:AddSection({
	Name = "Lighting Scripts"
})
Tab:AddButton({
	Name = "Remove Shadows",
	Callback = function()
      		game.Lighting.GlobalShadows = false
  	end    
})
Tab:AddButton({
	Name = "Fix Shadows",
	Callback = function()
      		game.Lighting.GlobalShadows = true
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
    Name = "━━━━━━━━",
    Icon = "",
    PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Wyd Bro You Clicked On The Divider XD"
})



Tab.Enabled = false

local Tab = Window:MakeTab({
	Name = "Rivals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Rivals Clients"
})


local Tab = Window:MakeTab({
	Name = "Fisch",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Fisch Clients"
})


local Tab = Window:MakeTab({
	Name = "Ragdoll Engine",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Ragdoll Clients"
})
local disabledRagdolls = {}

Tab:AddButton({
	Name = "Nil Hub (OP)",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/12xQ/NilHub.Lua/refs/heads/main/Ragdoll%20Engine"))()
  	end    
})

Tab:AddButton({
	Name = "System Broken",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
  	end    
})


OrionLib:Init()