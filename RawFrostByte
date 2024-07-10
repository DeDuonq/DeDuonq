local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/obeseinsect/roblox/main/Ui%20Libraries/Elerium.lua'))()

-- Lock
local V3 = Vector3.new
local V2 = Vector2.new
local inf = math.huge
getgenv().Settings = {
    ["FearLas"] = {
        ["Enabled"] = false,
        ["DOT"] = true,
        ["AIRSHOT"] = true,
        ["Prediction"] = {
            ["Horizontal"] = 0.185,
            ["Vertical"] = 0.1,
        },
        ["CamPrediction"] = {
            ["Prediction"] = {
                ["Horizontal"] = 0.185,
                ["Vertical"] = 0.1,
            },
        },
        ["NOTIF"] = true,
        ["AUTOPRED"] = false,
        ["AdvancedAutoPred"] = false,
        ["FOV"] = inf,
        ["RESOLVER"] = true,
        ["LOCKTYPE"] = "Namecall",
        ["TargetStats"] = false,
        ["Resolver"] = {
              ["Enabled"] = false,
              ["Type"] = "None",
        },
       ["Camera"] = {
        ["Enabled"] = false,
        ["HoodCustomsBypass"] = false,
     },
        ["OnHit"] = {
             ["Enabled"] = true,
             ["Hitchams"] = {
                  ["Enabled"] = false,
                  ["Color"] = Color3.fromRGB(0,0,139),
                  ["Transparency"] = 0,
                  ["Material"] = "ForceField",
             },
            ["Hitsound"] = {
                  ["Enabled"] = true,
                  ["Sound"] = "hitsounds/sparkle.wav",
                  ["Volume"] = 10,
            },
        }
    },
	["Silent"] = {
		["Enabled"] = false,
		["AimPart"] = "HumanoidRootPart",
		["WallCheck"] = false,
		["Visualize"] = false,
		["Prediction"] = {
		   ["Horizontal"] = 0.15,
		   ["Vertical"] = 0.05,
		},
	    ["AutoPrediction"] = {
	        ["Enabled"] = true,
	        ["Type"] = "Normal", --//Normal, Custom
           ["ping20_30"] = 0.12588,
           ["ping30_40"] = 0.11911,
           ["ping40_50"] = 0.12471,
           ["ping50_60"] = 0.13766,
           ["ping60_70"] = 0.13731,
           ["ping70_80"] = 0.13951,
           ["ping80_90"] = 0.14181,
           ["ping90_100"] = 0.148,
           ["ping100_110"] = 0.156,
           ["ping110_120"] = 0.1567,
           ["ping120_130"] = 0.1601,
           ["ping130_140"] = 0.1637,
           ["ping140_150"] = 0.173,
           ["ping150_160"] = 0.1714,
           ["ping160_170"] = 0.1863,
           ["ping170_180"] = 0.1872,
           ["ping180_190"] = 0.1848,
           ["ping190_200"] = 0.1865,
	    },
		["Mode"] = "Namecall", --index,namecal
	},
	["FOV"] = {
		["Enabled"] = false,
		["Size"] = 23,
		["Filled"] = false,
		["Thickness"] = 0.66,
		["Transparency"] = 0.9,
		["Color"] = Color3.fromRGB(255,255,255),
	},
	["Misc"] = {
	    ["NoDelay"] = false,
	    ["AutoReload"] = true,
	    ["AutoAir"] = {
	        ["Enabled"] = true,
	        ["Interval"] = 0.5,
	    },
	    ["CMDS"] = { 
	        ["Enabled"] = false,
	        ["FOVPrefix"] = "B",
	        ["Prediction"] = "A",
	   },
	},
	["Checks"] = { --entirely not
	    ["UnlovkOnKO"] = false,
	    ["TrashTalkOnKO"] = false,
	},
	["Resolution"] = {
	    ["Value"] = 1,
	   },
	["Resolvers"] = {  --entirely not
	    ["Enabled"] = true,
	    ["AutoDetect"] = false,
	    ["Type"] = "Recalculator",
	},
    ["Visuals"] = {
        ["Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
        },
        ["OutDoor Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255)
        },
        ["Fog Modifications"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
            ["Start"] = 15,
            ["End"] = 100 
        },
        ["ColorCorrection"] = {
            ["Enabled"] = false,
            ["Brightness"] = 0,
            ["Saturation"] = 5,
            ["Contrast"] = 2,
        },
    },
}
getgenv().DistancesMid = 50
getgenv().DistancesClose = 10
getgenv().AimSpeed = 1
getgenv().CAMPREDICTION = 0.185
getgenv().CAMJUMPPREDICTION = 0.1
getgenv().HorizontalSmoothness = 1
getgenv().VerticallSmoothness = 0.5
getgenv().ShakeX = 0
getgenv().ShakeY = 0
getgenv().ShakeZ = 0
getgenv().PREDICTION = 0.185
getgenv().JUMPPREDICTION = 0.1
getgenv().SelectedPart = "HumanoidRootPart" --// LowerTorso, UpperTorso, Head
getgenv().Prediction = "Normal"
getgenv().AutoPredType = "Normal"
getgenv().Resolver = false
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()


function SendNotification(text)
    Notification:Notify(
        {Title = "FrostByte", Description = "Big balls energy - "..text},
        {OutlineColor = Color3.fromRGB(0,0,139),Time = 3, Type = "image"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(0,0,139)}
    )
end
function calculateVelocity(initialPos, finalPos, timeInterval)
    local displacement = finalPos - initialPos
    local velocity = displacement / timeInterval
    return velocity
    end
    game:GetService('RunService').RenderStepped:connect(function(deltaTime)
    if getgenv().Resolver == true and enabled then 
        local character = Plr.Character[getgenv().SelectedPart]
        local lastPosition = character.Position
            task.wait()
        local currentPosition = character.Position
        local velocity = calculateVelocity(lastPosition, currentPosition, deltaTime)
        character.AssemblyLinearVelocity = velocity
        character.Velocity = velocity
            lastPosition = currentPosition
        end
    end)

--// Change Prediction,  AutoPrediction Must Be Off
    local lplr = game.Players.LocalPlayer
    local AnchorCount = 0
    local MaxAnchor = 50
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = getgenv().Settings.FearLas.DOT
        local a = Instance.new("Frame", e)
        if getgenv().Settings.FearLas.DOT == true then
        a.Size = UDim2.new(1, 1, 1, 1)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if getgenv().Settings.FearLas.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if getgenv().Settings.FearLas.DOT == false then
        g.CornerRadius = UDim.new(1, 1)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if getgenv().Settings.FearLas.DOT == true then
        placemarker.Size = V3(0, 0, 0)
        else
        placemarker.Size = V3(0, 0, 0)
        end
        placemarker.Transparency = 0.75
        if getgenv().Settings.FearLas.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(0,0,139), 1, 0)
        end
    end)
 local Tool = Instance.new("Tool")
Tool.RequiresHandle = false
Tool.Name = "Lock Tool"
Tool.Parent = game.Players.LocalPlayer.Backpack
local player = game.Players.LocalPlayer
local function connectCharacterAdded()
    player.CharacterAdded:Connect(onCharacterAdded)
end
connectCharacterAdded()
player.CharacterRemoving:Connect(function()
Tool.Parent = game.Players.LocalPlayer.Backpack
end)
function hitsound()
    local Hit = Instance.new("Sound")
    Hit.Parent = game.SoundService
    Hit.SoundId = getcustomasset(getgenv().Settings.FearLas.OnHit.Hitsound.Sound)
    Hit.Volume = getgenv().Settings.FearLas.OnHit.Hitsound.Volume
    Hit.Looped = false
    Hit:Play()
    Hit.Ended:Connect(function()                                         Hit:Destroy()
        end)
end

Tool.Activated:Connect(function()
if getgenv().Settings.FearLas.Enabled or getgenv().Settings.FearLas.Camera.Enabled then
            if enabled == true then
                enabled = false
                    Plr = LockToPlayer()
                if getgenv().Settings.FearLas.NOTIF == true then 
 SendNotification("Unlocked")
            end
            else
                Plr = LockToPlayer()
                TargetPlayer = tostring(Plr)
                enabled = true
local oldHealt = game.Players[TargetPlayer].Character.Humanoid.Health
                        if getgenv().Settings.FearLas.OnHit.Hitsound.Enabled and Plr ~= nil then

                             game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)                            
if neHealth < oldHealt then
hitsound()
elseif neHealth > oldHealt then
print("nil")
elseif game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
print("nil")
end
oldHealt = neHealth
end)
end                                      
              
if getgenv().Settings.FearLas.OnHit.Hitchams.Enabled then
   
        if Plr ~= nil then  game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)
        local Clone = game.Players[TargetPlayer].Character:Clone()
        if neHealth > oldHealt then
            Clone:Destroy()
        end
        if game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
            Clone:Destroy()
        end
        if neHealth < oldHealt then
            -- Main Hit-Chams --
            game.Players[TargetPlayer].Character.Archivable = true
            for _, Obj in next, Clone:GetDescendants() do
                if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                    Obj:Destroy()
                elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                    if Obj.Transparency == 1 then
                        Obj:Destroy()
                    else
                        Obj.CanCollide = false
                        Obj.Anchored = true
                        Obj.Material = getgenv().Settings.FearLas.OnHit.Hitchams.Material
                        Obj.Color = getgenv().Settings.FearLas.OnHit.Hitchams.Color
                        Obj.Transparency = getgenv().Settings.FearLas.OnHit.Hitchams.Transparency
                        Obj.Size = Obj.Size + V3(0.05, 0.05, 0.05)
                    end
                end
           
            end
            Clone.Parent = game.Workspace
            local start = tick()
            local connection
            connection = game:GetService("RunService").Heartbeat:Connect(function()
                if tick() - start >= 3 then
                    connection:Disconnect()
                    Clone:Destroy()
                end
            end)
        end

            oldHealt = neHealth

    end)
    end
end
                if getgenv().Settings.FearLas.NOTIF == true then
SendNotification("Target: "..Plr.Character.Humanoid.DisplayName)
                end
            end
   else
  SendNotification("Cam/Target not enabled!")
        end
    end)
 
local TargetStats = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Picture = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UIGradient_2 = Instance.new("UIGradient")
local HealthBarBackground = Instance.new("Frame")
local UIGradient_3 = Instance.new("UIGradient")
local HealthBar = Instance.new("Frame")
local UIGradient_4 = Instance.new("UIGradient")
local NameOfTarget = Instance.new("TextLabel")

spawn(function()
TargetStats.Name = "TargetStats"
TargetStats.Parent = game.CoreGui
TargetStats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = TargetStats
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.388957828, 0, 0.700122297, 0)
Background.Size = UDim2.new(0, 358, 0, 71)
Background.Visible = false

Picture.Name = "Picture"
Picture.Parent = Background
Picture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Picture.BorderSizePixel = 0
Picture.Position = UDim2.new(0.0279329624, 0, 0.0704225376, 0)
Picture.Size = UDim2.new(0, 59, 0, 59)
Picture.Transparency = 1
Picture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Top.Name = "Top"
Top.Parent = Background
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0, 0, -0.101449274, 0)
Top.Size = UDim2.new(0, 358, 0, 7)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115,0,0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(155,40,0))}
UIGradient.Rotation = 90
UIGradient.Parent = Top

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(52, 52, 52)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_2.Rotation = 90
UIGradient_2.Parent = Background

HealthBarBackground.Name = "HealthBarBackground"
HealthBarBackground.Parent = Background
HealthBarBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBarBackground.BorderSizePixel = 0
HealthBarBackground.Position = UDim2.new(0.215083793, 0, 0.348234326, 0)
HealthBarBackground.Size = UDim2.new(0, 270, 0, 19)
HealthBarBackground.Transparency = 1

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
UIGradient_3.Rotation = 90
UIGradient_3.Parent = HealthBarBackground

HealthBar.Name = "HealthBar"
HealthBar.Parent = HealthBarBackground
HealthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBar.BorderSizePixel = 0
HealthBar.Position = UDim2.new(-0.00336122862, 0, 0.164894029, 0)
HealthBar.Size = UDim2.new(0, 130, 0, 19)

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(184, 159, 227)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 88, 156))}
UIGradient_4.Rotation = 90
UIGradient_4.Parent = HealthBar

NameOfTarget.Name = "NameOfTarget"
NameOfTarget.Parent = Background
NameOfTarget.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.BackgroundTransparency = 1.000
NameOfTarget.Position = UDim2.new(0.220670387, 0, 0.0704225376, 0)
NameOfTarget.Size = UDim2.new(0, 268, 0, 19)
NameOfTarget.Font = Enum.Font.Code
NameOfTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.TextScaled = true
NameOfTarget.TextSize = 14.000
NameOfTarget.TextStrokeTransparency = 0.000
NameOfTarget.TextWrapped = true
end)

local IsAlive = function(GetPlayer)
    return GetPlayer and GetPlayer.Character and GetPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and GetPlayer.Character:FindFirstChild("Humanoid") ~= nil and GetPlayer.Character:FindFirstChild("Head") ~= nil and true or false
end

spawn(function()
    while wait() do
        if getgenv().Settings.FearLas.TargetStats and getgenv().Settings.FearLas.Enabled and enabled then
            if Plr and IsAlive(Plr) then
                Background.Visible = true
                NameOfTarget.Text = tostring(Plr.Character.Humanoid.DisplayName).." ["..tostring(Plr.Name).."]"
                Picture.Image  = "rbxthumb://type=AvatarHeadShot&id=" ..Plr.UserId.. "&w=420&h=420"
                HealthBar:TweenSize(UDim2.new(Plr.Character.Humanoid.Health / Plr.Character.Humanoid.MaxHealth, 0, 1, 0), "In", "Linear", 0.25)
                spawn(function()
                    if getgenv().Settings.FearLas.TargetStats == false then
                        Background.Visible = false
                    end
                end)
            end
        else
            Background.Visible = false
        end
    end
end)
    function LockToPlayer()
        local closestPlayer
        local shortestDistance = getgenv().Settings.FearLas.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (V2(pos.X, pos.Y) - V2(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
local Stats = game:GetService("Stats")

local Piiing = Stats:WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping")
local function Predict(Velocity)
    return V3(Velocity.X,math.clamp(Velocity.Y*0.5,-5,10),Velocity.Z)
end

local function GetLockPrediction(Part)
    return Part.CFrame + (Predict(Part.Velocity) * getgenv().PREDICTION)
end
local function GetCamPrediction(Part)
    return Part.CFrame + Predict(Part.Velocity) * (getgenv().CAMPREDICTION)
end

    local pingvalue = nil;
    local split = nil;
    local ping = nil;
local LocalHL = Instance.new("Highlight") 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and getgenv(). Settings.FearLas.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") or enabled and getgenv(). Settings.FearLas.Camera.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
if getgenv().Prediction == "Normal" then
            placemarker.CFrame = CFrame.new(GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position)         
elseif getgenv().Prediction == "Yun" then
            placemarker.CFrame = CFrame.new(Plr.Character[getgenv().SelectedPart].Position+V3(Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.X*getgenv().PREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y*getgenv().JUMPPREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z*getgenv().PREDICTION/10))
end

LocalHL.Parent = Plr.Character
LocalHL.FillTransparency = 0.2
LocalHL.FillColor = Color3.fromRGB(115,0,0)
LocalHL.OutlineColor = Color3.fromRGB(255,255,255)

        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
    
          LocalHL.Parent = nil
        
        end
pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
split = string.split(pingvalue,'(')
ping = tonumber(split[1])

if getgenv().Settings.FearLas.AdvancedAutoPred == true and enabled then
    getgenv().CAMJUMPPREDICTION = 0.05
    if ping > 300 then
        getgenv().CAMPREDICTION = 0.434
    elseif ping > 290 then
        getgenv().CAMPREDICTION = 0.422
    elseif ping > 280 then
        getgenv().CAMPREDICTION = 0.44
    elseif ping > 270 then
        getgenv().CAMPREDICTION = 0.4385
    elseif ping > 260 then
        getgenv().CAMPREDICTION = 0.4158
    elseif ping > 250 then
        
