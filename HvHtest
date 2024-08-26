-- // Services \\ --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Gui = game:GetService("GuiService")

-- // Variables \\ --
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local MapLightingJmp = Instance.new("ColorCorrectionEffect")
local Mouse = LocalPlayer:GetMouse()

if not LPH_OBFUSCATED and not LPH_JIT_ULTRA then
   LPH_NO_VIRTUALIZE = function(f) return f end
   LRM_UserNote = ""
   LRM_LinkedDiscordID = 1
   LRM_TotalExecutions = 1
   LRM_SecondsLeft = 9999
end

local Script = {
   ClosestSilentTarget = nil,
   ClosestSilentPart = nil,
}
-- // Table \\ --
local utility = {
   name = "hvh.lua",
   folder = "hvh",
   invite = "XTSa2UDrNR",
   mouse_args = {
      "UpdateMousePos",
      "MousePos",
      "MOUSE",
      "MousePosDEBUG",
      "GetMousePos",
      "GetMouse",
   },
   ver = "0.0.1",
   options = {
      notifications = {
         enabled = true,
         mode = "HVH",
         notification_modes = {
            "HVH",
            "Roblox",
            "STX",
         },
         duration = 3,
      },
   },
   silent = {
      enabled = false,
      aimviewbypass = false,
      arg = "UpdateMousePos",
      mode = "FOV",
      friendcheck = false,
      crewcheck = false,
      jumpoffset = 0,
      distancecheck = false,
      maxdistance = 250,
      kocheck = false,
      visiblecheck = false,  
      targetui = false,
      hitsound = {
         enabled = false,
         sound = "Rust",
         volume = 1,
     },
     hitlog = false,
     highlight = false,
     highlightcolor = Color3.fromRGB(84, 101, 255),
   },
   fov = {
      transparency = 1,
      size = 50,
      visible = false,
      color = Color3.fromRGB(84, 101, 255),
      thickness = 1,
      filled = false,
      sides = 10,
   },
   prediction = {
      auto = false,
      pred = 0.133,
   },
   target = {
      mode = "Orbit",
      target = nil,
      highlight = false,
      highlightcolor = Color3.fromRGB(84, 101, 255),
      fling = false,
      view = false,
      aimview = false,
   },
   anti = {
      custom = {
         enabled = false,
         x = 0,
         y = 0,
         z = 0,
         preset = "None",
      },
      breaker = {
         enabled = false,
      },
      multiply = {
         enable = false,
         multiplier = 1,
      },
      visuals = {
         part = "HumanoidRootPart",
         dot = {
            enabled = false,
            color = Color3.fromRGB(255,255,255),
            size = 3,
            trans = 1,
            filled = false,
         },
         line = {
            enabled = false,
            color = Color3.fromRGB(255,255,255),
            size = 1,
            trans = 1,
         },
      },
   },
   resolver = {
      enabled = false,
      method = "Desync",
   },
   visuals = {
      crosshair = {
         rotating = {
            enabled = false,
            speed = 1,
            direction = "Left",
         },
         custom = {
            enabled = false,
            preview = false,
            transparency = 0,
            size = 28,
            id = "rbxassetid://11934534450",
         },
      },
      map = {
         enabled = false,
         color = Color3.fromRGB(255,255,255),
         brightness = 0,
         contrast = 0,
         saturation = 0,
      },
   },
   misc = {
      autoreload = false,
   },
   players = {},
   friends = {},
   esp_players = {},
   friends_esp = {},
   show_friends = false,
   notify_on_friend_join = false,
   show_stats = false,
   flagged = {},
   beams = {},
   hitparts = {"Head","HumanoidRootPart","UpperTorso","LowerTorso"},
   adonis_games = {
      12927359803, -- Dah Aim Trainer
      12867571492, -- KatanaHood
      11867820563, -- Dae Hood
      12618586930, -- Dat Hood
      13018411607, -- Dat Hood 2
      13018411607, -- // Dat Hood Backup
      9633073067, -- // Del Hood
      11956541652, --// Dav Hood
      10100958808, -- // Da Downhill
      12815368779, -- // Da Hood Aim Trainer
      13126185789, -- // Da Hood Aim Trainer VC
  },
}


LPH_NO_VIRTUALIZE(function()

   for i,v in pairs(game.Workspace:GetDescendants()) do 
       if v:IsA("Seat") then 
           v.Disabled = true
       end
   end

end)()

local Intro = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local BarHolder = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")

Intro.Name = "Intro"
Intro.Parent = game.CoreGui
Intro.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Holder.Name = "Holder"
Holder.Parent = Intro
Holder.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.389843762, 0, 0.424756378, 0)
Holder.Size = UDim2.new(0.220312506, 0, 0.148817807, 0)

BarHolder.Name = "BarHolder"
BarHolder.Parent = Holder
BarHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BarHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
BarHolder.BorderSizePixel = 0
BarHolder.Position = UDim2.new(0.0425531901, 0, 0.794392526, 0)
BarHolder.Size = UDim2.new(0.914893627, 0, 0.0934579447, 0)

Bar.Name = "Bar"
Bar.Parent = BarHolder
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0, 0, 1, 0)

Title.Name = "Title"
Title.Parent = Holder
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0412108526, 0, 0.0654205605, 0)
Title.Size = UDim2.new(0.822695017, 0, 0.17757009, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "hvh.lua v"..utility.ver
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Status.Name = "Status"
Status.Parent = Holder
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0.0780141875, 0, 0.30744037, 0)
Status.Size = UDim2.new(0.84397161, 0, 0.392523378, 0)
Status.Font = Enum.Font.Gotham
Status.Text = "Waiting For Game... (0%)"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 16.000
Status.TextWrapped = true

local StatusText = "Waiting For Game..."

local bypass = {
   dahood = function()
       local _game = getrawmetatable(game)
       setreadonly(_game, false)
       local ___namecall = _game.__namecall
       _game.__namecall = newcclosure(function(...)
           if getnamecallmethod() == 'FireServer' and ({...})[1].Name == 'MainEvent' and table.find({"BreathingHAMON", "OneMoreTime", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE", "CHECKER_1", "TeleportDetect", "GUI_CHECK"}, ({...})[2]) then
               return
           end
           return ___namecall(...)
       end)
       setreadonly(_game, true)
   end,
   hoodmodded = function() 
       for i,v in next, getgc(true) do
           if typeof(v)=="table" and rawget(v,"DoThings") then
               v.DoThings = function() end
           end
       end
   end,
   untitledhood = function() 
       local _1;
       _1 = hookmetamethod(game, "__namecall", function(self, ...)
           if not checkcaller() and getnamecallmethod() == "FireServer" then
               if tostring(self.Name) == ".gg/untitledhood" then
                   local args = {...}
                   if tostring(args[1]) == "ForceDetect" or tostring(args[1]) == "TeleportDetect" or tostring(args[1]) == "GUI_CHECK" then
                       return 
                   end
               end
           end
           return _1(self, ...);
       end)
   end,
   adonis = function()
       for k,v in pairs(getgc(true)) do
           if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and  (rawget(v,"indexInstance"))[1] == "kick" then
               v.tvk = {"kick",function() return game.Workspace:WaitForChild("") end}
           end
       end
   end
}

for i = 1,100 do
	if i == 1 then
		StatusText = "Waiting For Game... "
		repeat task.wait() until game:IsLoaded()
	elseif i == 10 then
		StatusText = "Waiting For Character..."
		repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")
	elseif i == 25 then
		StatusText = "Setting Up Workspace..."
	elseif i == 50 then
		StatusText = "Bypassing Anti-Cheat..."
      if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
         StatusText = "Bypassing Da Hood Anti-Cheat..."
         bypass.dahood()
     elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
         StatusText = "Bypassing Hood Modded Anti-Cheat..."
         bypass.hoodmodded()
     elseif game.PlaceId == 9183932460 or game.PlaceId == 9435785899 then
         StatusText = "Bypassing Untitled Hood Anti-Cheat..."
         bypass.untitledhood()
     elseif table.find(utility.adonis_games,game.PlaceId) then 
         StatusText = "Bypassing Adonis Anti-Cheat..."
         bypass.adonis()
     end
	elseif i == 65 then
		StatusText = "Bypass Successful"
	elseif i == 75 then
		StatusText = "Loading User-Interface"
	elseif i == 90 then
		StatusText = "Welcome, "..game.Players.LocalPlayer.DisplayName
	end
	Status.Text = StatusText.." ("..i.."%)"
	Bar.Size = UDim2.new(i/100,0,1,0)
	task.wait()
end

task.wait()
Intro:Destroy()

local STX = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local Notification = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

Notification.Name = "Notification"
Notification.Parent = game.CoreGui
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Holder.Name = "Holder"
Holder.Parent = Notification
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderColor3 = Color3.fromRGB(27, 42, 53)
Holder.Position = UDim2.new(0.0072954637, 0, 0.0105048735, 0)
Holder.Size = UDim2.new(0, 243, 0, 240)

UIListLayout.Parent = Holder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

function hvh_notify(text, time)
	local Template = Instance.new("Frame")
	local ColorBar = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	Template.Name = text
	Template.Parent = Holder
	Template.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Template.Size = UDim2.new(0, 0, 0, 0)
	Template.Transparency = 1


	ColorBar.Name = "ColorBar"
	ColorBar.Parent = Template
	ColorBar.BackgroundColor3 = Color3.fromRGB(84, 101, 255)
	ColorBar.BorderSizePixel = 0
	ColorBar.Size = UDim2.new(0, 2, 0, 22)
	ColorBar.Transparency = 1

	TextLabel.Parent = Template
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0, 8, 0, 0)
	TextLabel.Size = UDim2.new(0, 0, 0, 22)
	TextLabel.Font = Enum.Font.Code
	TextLabel.Text = text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextStrokeTransparency = 0.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.Transparency = 1

	Template.Size = UDim2.new(0, TextLabel.TextBounds.X + 13, 0, 22)
	local goal2 = {}
	goal2.Transparency = 0
	local tweenInfo2 = TweenInfo.new(0.5)
	local tween12 = TweenService:Create(Template, tweenInfo2, goal2)
	local tween22 = TweenService:Create(ColorBar, tweenInfo2, goal2)
	local tween32 = TweenService:Create(TextLabel, tweenInfo2, goal2)
	tween12:Play()
	tween22:Play()
	tween32:Play()

	delay(time, function()
		local goal = {}
		goal.Transparency = 1
		local tweenInfo = TweenInfo.new(0.5)
		local tween1 = TweenService:Create(Template, tweenInfo, goal)
		local tween2 = TweenService:Create(ColorBar, tweenInfo, goal)
		local tween3 = TweenService:Create(TextLabel, tweenInfo, goal)
		tween1:Play()
		tween2:Play()
		tween3:Play()
		delay(0.51, function()
			Template:Destroy()
		end)
	end)
end

tp = function(v) 
   if v == "Uphill" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(482, 48, -602)
   elseif v == "Military" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(58.71923828125, 25.25499725341797, -869.0357055664062) 
   elseif v == "Park" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268, 22, -754) 
   elseif v == "Admin" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800, -40, -887) 
   elseif v == "Admin Guns" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872, -33, -536) 
   elseif v == "Downhill" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-565, 8, -737) 
   elseif v == "Double Barrel" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042, 22, -261) 
   elseif v == "Casino" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-864, 22, -143) 
   elseif v == "Trailer" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-963, -1, 469) 
   elseif v == "School" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-653, 22, 257) 
   elseif v == "Revolver" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-642, 22, -124) 
   elseif v == "Bank" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-446, 39, -286) 
   elseif v == "Sewer" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, -27, -277) 
   elseif v == "Fire Station" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 54, -94) 
   elseif v == "Hood Fitness" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76, 23, -638) 
   elseif v == "Hood Kicks"  then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-188, 22, -410) 
   elseif v == "Jail" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-299, 22, -91) 
   elseif v == "Church" then 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205, 22, -80) 
   end
end

Alive = function(Plr)
   if Plr and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and Plr.Character:FindFirstChild("Humanoid") ~= nil and Plr.Character:FindFirstChild("Head") ~= nil then
       return true
   end
   return false
end

Round = function(num, numDecimalPlaces)
   return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end


   notify = function(text)
      if utility.options.notifications.enabled then 
         if utility.options.notifications.mode == "Roblox" then 
            game.StarterGui:SetCore("SendNotification", {
               Title = utility.name,
               Text = text,
               Duration = utility.options.notifications.duration,
            })
         elseif utility.options.notifications.mode == "STX" then 
            Notification:Notify(
               {Title = utility.name, Description = text},
               {OutlineColor = Color3.fromRGB(69,79,184),Time = utility.options.notifications.duration, Type = "default"}
            )
         elseif utility.options.notifications.mode == "HVH" then 
            hvh_notify(text, utility.options.notifications.duration)
         end
      end
   end
   get = function(gettype)
      if gettype == "event" then 
         for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" then
                return v
            end
         end
      elseif gettype == "screen" then 
         for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
            if v.Name == "MainScreenGui" then
                return v
            end
         end
      elseif gettype == "prediction" then 
         local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
         local Value = tostring(PingStats)
         local PingValue = Value:split(" ")
         local PingNumber = tonumber(PingValue[1])
         return tonumber(PingNumber / 225 * 0.1 + 0.1)
      end
   end
   draw = function(Type, Properties)
      local NewDrawing = Drawing.new(Type)
  
      for i,v in next, Properties or {} do
          NewDrawing[i] = v
      end
      return NewDrawing
   end
   
   friendmarker = function(Player)
         utility.friends_esp[Player] = {
            Marker = draw("Text", {Color = Color3.fromRGB(84, 101, 255), Outline = false, Visible = false, Transparency = 0.7, Center = true, Size = 25, Font = 0}),
         }
   end
   createbeam = function(Character)
      local Beam = Instance.new("Beam", Character)
      Beam.Name = "AIM_VIEWER"
      --Beam.Attachment0 = Character:waitForChild("Head"):waitForChild("FaceCenterAttachment")
      Beam.Enabled = false
      Beam.Color = ColorSequence.new(Color3.fromRGB(84, 101, 255), Color3.fromRGB(84, 101, 255))
      Beam.Width0 = 0.3
      Beam.Width1 = 0.3
      return Beam
   end

   function Gun(Name)
      for Check = 1, 100000 do
         if game.Workspace.Ignored.Shop:FindFirstChild("[" .. Name .. "] - $" .. Check) then
            return tostring("[" .. Name .. "] - $" .. Check)
         end
      end
   end
   
   function Ammo(Name)
      for Check1 = 1, 250 do
         for Check2 = 1, 500 do
            if game.Workspace.Ignored.Shop:FindFirstChild(Check1 .. " [" .. Name .. " Ammo] - $" .. Check2) then
               return tostring(Check1 .. " [" .. Name .. " Ammo] - $" .. Check2)
            end
         end
      end
   end
   
   function Buy(Target, Delay, LagBack, Times)
      if Times == nil then Times = 3 end
      local item = game.Workspace.Ignored.Shop:FindFirstChild(Target)
      if item then
         savepos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
         for i = 1, Times do 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.Head.CFrame * CFrame.new(0, 3, 0)
            task.wait(0.5)
            for i = 1, 10 do
               fireclickdetector(item.ClickDetector)
            end
            task.wait(0.5)
         end
         if LagBack then
            task.wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savepos
         end
         if Delay ~= nil then
            task.wait(Delay)
         end
      end
   end
   
   function BuyGunAndAmmo(GUN,times)
      if game.Players.LocalPlayer.Backpack:FindFirstChild("["..GUN.."]") or game.Players.LocalPlayer.Character:FindFirstChild("["..GUN.."]") then 
         Buy(Ammo(GUN),0.3,true,times)
      else
         Buy(Gun(GUN),0.5,true)
      end
   end
   
   local hitSoundsNames = {"Rust", "Bameware", "Bubble", "Pick", "Pop", "Sans", "Fart", "Big", "Vine", "Bruh", "Skeet", "Neverlose", "Fatality", "Bonk","Minecraft"}

   if not isfile(utility.folder.."/version.txt") then 
      writefile(utility.folder.."/version.txt",utility.ver)
   else
      if readfile(utility.folder.."/version.txt") ~= utility.ver then 
         notify("hvh has updated since the last time you used it please update your configs.")
         writefile(utility.folder.."/version.txt",utility.ver)
      end 
   end
   
   
local CustomCursor = Instance.new("ScreenGui")
local Cursor = Instance.new("ImageLabel")

CustomCursor.Name = "CustomCursor"
CustomCursor.Parent = game.CoreGui
CustomCursor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CustomCursor.DisplayOrder = 1000
Cursor.Name = "Cursor"
Cursor.Parent = CustomCursor
Cursor.AnchorPoint = Vector2.new(0.5, 0.5)
Cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Cursor.BackgroundTransparency = 1.000
Cursor.Position = UDim2.new(0.372170985, 0, 0.512376249, 0)
Cursor.Size = UDim2.new(0, 28, 0, 28)

local guntable = {
	"[Rifle]",
	"[Shotgun]",
	"[Silencer]",
	"[Revolver]",
	"[SilencerAR]",
	"[LMG]",
	"[Glock]",
	"[Double-Barrel SG]",
	"[SMG]",
	"[TacticalShotgun]",
	"[AK47]",
	"[AR]",
	"[RPG]",
	"[AUG]",
	"[Flamethrower]",
	"[DrumGun]",
	"[P90]",
}

local function getMousePosition()
	local mouse = game.Players.LocalPlayer:GetMouse()
	local x, y = mouse.X, mouse.Y
	return UDim2.new(0,x,0,y)
end

local function isholdingtool()
	local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if tool then
		if table.find(guntable,tool.Name) then
			return true
		else
			return false
		end
		return false
	end
end

local CustomCursorPreview = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local CursorPreview = Instance.new("ImageLabel")
local PreviewText = Instance.new("TextLabel")

CustomCursorPreview.Name = "CustomCursorPreview"
CustomCursorPreview.DisplayOrder = 999
CustomCursorPreview.Parent = game.CoreGui
CustomCursorPreview.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Holder.Name = "Holder"
Holder.Parent = CustomCursorPreview
Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Holder.BorderColor3 = Color3.fromRGB(25,25,25)
Holder.BorderSizePixel = 1
Holder.Position = UDim2.new(0.0678960681, 0, 0.232673258, 0)
Holder.Size = UDim2.new(0, 197, 0, 203)
Holder.Active = true
Holder.Draggable = true

CursorPreview.Name = "CursorPreview"
CursorPreview.Parent = Holder
CursorPreview.AnchorPoint = Vector2.new(0.5, 0.5)
CursorPreview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CursorPreview.BackgroundTransparency = 1.000
CursorPreview.Position = UDim2.new(0.496535271, 0, 0.510699451, 0)
CursorPreview.Size = UDim2.new(0, 162, 0, 162)

PreviewText.Name = "PreviewText"
PreviewText.Parent = Holder
PreviewText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreviewText.BackgroundTransparency = 1.000
PreviewText.Size = UDim2.new(0, 197, 0, 23)
PreviewText.Font = Enum.Font.Ubuntu
PreviewText.Text = "Preview"
PreviewText.TextColor3 = Color3.fromRGB(255, 255, 255)
PreviewText.TextSize = 14.000


game:GetService("RunService").RenderStepped:Connect(function()
    if utility.visuals.crosshair.custom.enabled and utility.visuals.crosshair.custom.preview then 
        CursorPreview.Image = utility.visuals.crosshair.custom.id
        CursorPreview.ImageTransparency = utility.visuals.crosshair.custom.transparency
        Holder.Visible = true
    else
        Holder.Visible = false
    end
	if utility.visuals.crosshair.custom.enabled then
		Cursor.Image = utility.visuals.crosshair.custom.id
        Cursor.ImageTransparency = utility.visuals.crosshair.custom.transparency
        Cursor.Size = UDim2.new(0,utility.visuals.crosshair.custom.size,0,utility.visuals.crosshair.custom.size)
		Cursor.Position = getMousePosition()
		if isholdingtool() then 
		    Cursor.Visible = true
		    game:GetService("UserInputService").MouseIconEnabled = false
    		get("screen").Aim.BackgroundTransparency = 1
    		get("screen").Aim.Top.Visible = false
    		get("screen").Aim.Bottom.Visible = false
    		get("screen").Aim.Right.Visible = false
    		get("screen").Aim.Left.Visible = false
    	else
    	    Cursor.Visible = false
    		game:GetService("UserInputService").MouseIconEnabled = true
    		get("screen").Aim.BackgroundTransparency = 0
    		get("screen").Aim.Top.Visible = true
    		get("screen").Aim.Bottom.Visible = true
    		get("screen").Aim.Right.Visible = true
    		get("screen").Aim.Left.Visible = true
		end
	else
	    Cursor.Visible = false
		game:GetService("UserInputService").MouseIconEnabled = true
		get("screen").Aim.BackgroundTransparency = 0
		get("screen").Aim.Top.Visible = true
		get("screen").Aim.Bottom.Visible = true
		get("screen").Aim.Right.Visible = true
		get("screen").Aim.Left.Visible = true
	end
end)

function setcursortransparency(value)   
    utility.visuals.crosshair.custom.transparency = tonumber(value)
end

function setcursor(id) 
    utility.visuals.crosshair.custom.id = "rbxassetid://"..tostring(id)
end

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/laagginq/storage/main/AtlasV2.lua'))()

-- // Window \\ --
local menu = library.new(utility.name..' | build '..utility.ver, utility.folder)

-- // Tabs \\ --
local Aiming = menu.new_tab('rbxassetid://10709818534')
local Visuals = menu.new_tab('rbxassetid://10723346959')
local Plrs = menu.new_tab('rbxassetid://10747373426')
local Movement = menu.new_tab('rbxassetid://10734920149')
local Settings = menu.new_tab('rbxassetid://10747383470')

-- // Sections \\ --
local Aiming_Types = Aiming.new_section('Aiming')

local Crosshair = Visuals.new_section('Crosshair')
local Map = Visuals.new_section('Map Visuals')

local SelfSection = Plrs.new_section('Self')
local PlayersSection = Plrs.new_section('Players')

local AntiAim = Movement.new_section('Anti Aim')
local Resolver = Movement.new_section('Resolver')
local Visualizer = Movement.new_section('Visualizers')

local Aiming_Settings = Aiming.new_section('Settings')
local Settings = Settings.new_section('Settings')

-- // Sector \\ --
local Aiming_Settings2 = Aiming_Types.new_sector('Settings', 'Left')
local Checks = Aiming_Types.new_sector('Checks', 'Left')
local AimingVisuals = Aiming_Types.new_sector('Visuals', 'Right')
local FOV = Aiming_Types.new_sector('Field Of View', 'Right')

local RotateCrosshair = Crosshair.new_sector('Crosshair Rotation', 'Left')
local CustomCrosshair = Crosshair.new_sector('Custom Crosshair', 'Right')
local MapVisuals = Map.new_sector('Map', 'Left')

local AutoBuy = SelfSection.new_sector('Auto Buy', 'Left')
local Teleports = SelfSection.new_sector('Locations', 'Right')
local Misc = SelfSection.new_sector('Miscellaneous', 'Right')

local CustomVel = AntiAim.new_sector('Custom Velocity', 'Left')
local BreakVel = AntiAim.new_sector('Velocity Breaker', 'Right')
local MultiplyVel = AntiAim.new_sector('Velocity Multiplier', 'Right')

local Dot = Visualizer.new_sector('Dot Visualizer', 'Left')
local VisualizerSettings = Visualizer.new_sector('Settings', 'Left')
local Line = Visualizer.new_sector('Line Visualizer', 'Right')

local Plr_Target = PlayersSection.new_sector('Target', 'Left')

-- // Elements \\ --

-- // Aiming \\ --

Aiming_Settings2.element('Toggle', 'Enabled', false, function(v)
   utility.silent.enabled = v.Toggle
end)


Aiming_Settings2.element('Toggle', 'Aim Viewer Bypass', false, function(v)
   utility.silent.aimviewerbypass = v.Toggle
end)

Aiming_Settings2.element('Dropdown', 'HitPart', {options = utility.hitparts}, function(v)
   utility.silent.hitpart = v.Dropdown
end)

Aiming_Settings2.element('Slider', 'Jump Offset', {default = {min = 0, max = 50, default = 0}}, function(v)
   local a = v.Slider / 10
   utility.silent.jumpoffset = -a
end)




Checks.element('Toggle', 'Visible', false, function(v)
   utility.silent.visiblecheck = v.Toggle
end)

Checks.element('Toggle', 'Knocked', false, function(v)
   utility.silent.kocheck = v.Toggle
end)

Checks.element('Toggle', 'Friend', false, function(v)
   utility.silent.friendcheck = v.Toggle
end)


Checks.element('Toggle', 'Crew', false, function(v)
   utility.silent.crewcheck = v.Toggle
end)

Checks.element('Toggle', 'Distance', false, function(v)
   utility.silent.distancecheck = v.Toggle
end)

Checks.element('Slider', 'Max Distance', {default = {min = 1, max = 1000, default = 250}}, function(v)
   utility.silent.maxdistance = v.Slider
end)

AimingVisuals.element('Toggle', 'Target UI', false, function(v)
   utility.silent.targetui = v.Toggle
end)

AimingVisuals.element('Toggle', 'Hit Log', false, function(v)
   utility.silent.hitlog = v.Toggle
end)

AimingVisuals.element('Toggle', 'Highlight', false, function(v)
   if v.Toggle == true then 
      utility.silent.highlight = true
   else
      utility.silent.highlight = false
   end
end):add_color({Color = Color3.fromRGB(84, 101, 255)}, nil, function(v)
   utility.silent.highlightcolor = v.Color
end)



AimingVisuals.element('Toggle', 'Hit Sound Enabled', false, function(v)
   utility.silent.hitsound.enabled = v.Toggle
end)

AimingVisuals.element('Slider', 'Hit Sound Volume', {default = {min = 1, max = 100, default = 10}}, function(v)
   utility.silent.hitsound.volume = v.Slider / 10
end)

AimingVisuals.element('Dropdown', 'Hit Sound', {options = hitSoundsNames}, function(v)
   utility.silent.hitsound.sound = v.Dropdown
end)



FOV.element('Toggle', 'Visible', false, function(v)
   utility.fov.visible = v.Toggle
end):add_color({Color = Color3.fromRGB(84, 101, 255)}, nil, function(v)
   utility.fov.color = v.Color
end)

FOV.element('Toggle', 'Filled', false, function(v)
   utility.fov.filled = v.Toggle
end)

FOV.element('Slider', 'Size', {default = {min = 1, max = 100, default = 50}}, function(v)
   utility.fov.size = v.Slider
end)

FOV.element('Slider', 'Transparency', {default = {min = 1, max = 10, default = 10}}, function(v)
   utility.fov.transparency = v.Slider / 10
end)

FOV.element('Slider', 'Thickness', {default = {min = 1, max = 100, default = 1}}, function(v)
   utility.fov.thickness = v.Slider
end)

FOV.element('Dropdown', 'Shape', {options = {'Decagon','Circle', 'Hexagon', 'Octagon'}}, function(v)
   if v.Dropdown == "Decagon" then 
      utility.fov.sides = 10
   elseif v.Dropdown == "Hexagon" then
      utility.fov.sides = 6
   elseif v.Dropdown == "Octagon" then
      utility.fov.sides = 8
   elseif v.Dropdown == "Circle" then
      utility.fov.sides = 100
   end
end)




-- // Players \\ --

local Guns = {
   "Revolver",
   "Double-Barrel SG",
   "High-Medium Armor",
   "Flamethrower",
   "SMG",
   "RPG",
   "P90",
   "LMG",
   "Key" 
}

local Food = {
   "Pizza",
   "Taco",
   "Chicken",
   "Cranberry",
   "Popcorn",
   "Hamburger",
   "HotDog",
}

local selectedfood = "Pizza"
local selectedgun = "Revolver"

AutoBuy.element('Slider', 'Multiplier', {default = {min = 0, max = 10, default = 1}}, function(v)
   autobuymultiplier = v.Slider
end)

AutoBuy.element('Scroll', 'Guns', {options = Guns}, function(v)
   selectedgun = v.Scroll
end)

AutoBuy.element('Button', 'Buy Gun/Ammo', nil, function()
   BuyGunAndAmmo(selectedgun,autobuymultiplier)
end)

AutoBuy.element('Scroll', 'Food', {options = Food}, function(v)
   selectedfood = v.Scroll
end)

AutoBuy.element('Button', 'Buy Food', nil, function()
   Buy(Gun(selectedfood),0.3,true,1)
end)

local locations = {
   "Uphill",
   "Military",
   "Park",
   "Downhill",
   "Double Barrel",
   "Casino",
   "Trailer",
   "School",
   "Revolver",
   "Bank",
   "Sewer",
   "Fire Station",
   "Hood Fitness",
   "Hood Kicks",
   "Jail",
   "Church",
}

local tplocation = "Uphill"

Teleports.element('Scroll', 'Locations', {options = locations}, function(v)
   tplocation = v.Scroll
end)

Teleports.element('Button', 'Goto', nil, function()
   tp(tplocation)
end)

Teleports.element('Button', 'Goto Random', nil, function()
   tp(locations[math.random(1,#locations)])
end)

Misc.element('Toggle', 'Auto Reload', false, function(v)
   utility.misc.autoreload = v.Toggle
end)

Misc.element('Button', 'Code Farm', nil, function()
   task.spawn(function()
      local codes = {}
      for i,v in pairs(game.Players:GetChildren()) do 
         if v:FindFirstChild("DataFolder") and v.DataFolder:FindFirstChild("Information") and v.DataFolder.Information:FindFirstChild("Codes") then
            local codes2 = game:GetService("HttpService"):JSONDecode(v.DataFolder.Information.Codes.Value)
            for i2,v2 in pairs(codes2) do 
                  if not table.find(codes,i2) then 
                     table.insert(codes,i2)
                  end
            end
         end
      end
      local eq = 0.1 * #codes
      game:GetService("StarterGui"):SetCore("SendNotification",{
         Title = #codes.." codes found", -- Required
         Text = "ETA: "..math.floor(eq).."s", -- Required
      })
      for i, v in pairs(codes) do 
         task.wait(0.1)
         print("[TRYING "..v.."]: "..i.."/"..#codes)
         game.ReplicatedStorage.MainEvent:FireServer("EnterPromoCode",v)
      end
      game:GetService("StarterGui"):SetCore("SendNotification",{
         Title = "Completed", -- Required
         Text = "Server hop to try to find new codes.", 
      })
   end)
end)


local PlayerList = Plr_Target.element("Scroll", "Player List", {options = {game.Players.LocalPlayer.Name}}, function(State)
   utility.target.target = State.Scroll
end)


Plr_Target.element('Button', 'Goto', nil, function()
   LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[utility.target.target].Character.Head.CFrame
end)

local autostomp = {
   enabled = false,
   target = nil,
   db = false,
}

Plr_Target.element('Button', 'Stomp', nil, function()
   if autostomp.db == false then
      autostomp.db = true
      if not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
         notify("You must have a gun equipped to do this.")
            autostomp.target = nil
            autostomp.enabled = false
            autostomp.db = false
         return
      end
      saving_position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      autostomp.target = utility.target.target
      autostomp.enabled = true
      notify("Stomping "..autostomp.target.." click stomp again to cancel")
      if utility.target.mode == "Orbit" then 
         repeat
            task.wait()
            for i = 0, 360, 20 do
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                     CFrame.new(game.Players[autostomp.target].Character.Head.Position) *
                     CFrame.Angles(0, math.rad(i), 0) *
                     CFrame.new(math.random(5,15), math.random(5,15), 0)
               task.wait()
            end
            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
         until game.Players[autostomp.target].Character.BodyEffects:FindFirstChild("K.O").Value == true or not game.Players:FindFirstChild(autostomp.target)
      elseif utility.target.mode == "Sky" then 
         repeat
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[autostomp.target].Character.Head.Position + Vector3.new(0,math.random(10,20),0))
            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
         until game.Players[autostomp.target].Character.BodyEffects:FindFirstChild("K.O").Value == true or not game.Players:FindFirstChild(autostomp.target)
      end
      game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Deactivate()
      autostomp.enabled = false
      for i = 1, 20 do 
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[autostomp.target].Character.UpperTorso.Position + Vector3.new(0,1,0))
         task.wait()
         get("event"):FireServer("Stomp")
         task.wait()
      end
      notify(autostomp.target.." has been stomped.")
      autostomp.db = false
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saving_position
   else
      autostomp.enabled = false
      autostomp.db = false
      if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
          game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Deactivate()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saving_position
      autostomp.target = nil
      notify("Canceled.")
   end
end)

Plr_Target.element('Button', 'Bring', nil, function()
   if autostomp.db == false then
      autostomp.db = true
      if not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
         notify("You must have a gun equipped to do this.")
            autostomp.target = nil
            autostomp.enabled = false
            autostomp.db = false
         return
      end
      saving_position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      autostomp.target = utility.target.target
      autostomp.enabled = true
      notify("Bringing "..autostomp.target.." click bring again to cancel")
      if utility.target.mode == "Orbit" then 
         repeat
            task.wait()
            for i = 0, 360, 20 do
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                     CFrame.new(game.Players[autostomp.target].Character.HumanoidRootPart.Position) *
                     CFrame.Angles(0, math.rad(i), 0) *
                     CFrame.new(math.random(5,15), math.random(5,15), 0)
               task.wait()
            end
            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
         until game.Players[autostomp.target].Character.BodyEffects:FindFirstChild("K.O").Value == true or not game.Players:FindFirstChild(autostomp.target)
      elseif utility.target.mode == "Sky" then 
         repeat
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[autostomp.target].Character.HumanoidRootPart.Position + Vector3.new(0,math.random(10,20),0))
            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
         until game.Players[autostomp.target].Character.BodyEffects:FindFirstChild("K.O").Value == true or not game.Players:FindFirstChild(autostomp.target)
      end
      game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Deactivate()
      autostomp.enabled = false
      repeat
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[autostomp.target].Character.UpperTorso.Position + Vector3.new(0,1,0))
         task.wait(0.2)
         get("event"):FireServer("Grabbing",false)
         task.wait(0.2)
      until game.Players[autostomp.target].Character:FindFirstChild("GRABBING_CONSTRAINT")
      task.wait(0.2)
      notify(autostomp.target.." has been brought to you.")
      autostomp.db = false
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saving_position
      task.wait(1)
      get("event"):FireServer("Grabbing",false)
   else
      autostomp.enabled = false
      autostomp.db = false
      if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
          game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Deactivate()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saving_position
      autostomp.target = nil
      notify("Canceled.")
   end
end)

OnScreen = function(Object)
   local _, screen = CurrentCamera:WorldToScreenPoint(Object.Position)
   return screen
end

RayCastCheck = function(Part, PartDescendant)
   local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
   local Origin = CurrentCamera.CFrame.Position

   local RayCastParams = RaycastParams.new()
   RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
   RayCastParams.FilterDescendantsInstances = {Character, CurrentCamera}

   local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
   
   if (Result) then
       local PartHit = Result.Instance
       local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
       
       return Visible
   end
   return false
end

GetMagnitudeFromMouse = function(Part)
   local PartPos, OnScreen = CurrentCamera:WorldToScreenPoint(Part.Position)
   if OnScreen then
       local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
       return Magnitude
   end
   return math.huge
end

FindCrew = function(Player)
	if Player:FindFirstChild("DataFolder") and Player.DataFolder:FindFirstChild("Information") and Player.DataFolder.Information:FindFirstChild("Crew") and LocalPlayer:FindFirstChild("DataFolder") and LocalPlayer.DataFolder:FindFirstChild("Information") and LocalPlayer.DataFolder.Information:FindFirstChild("Crew") then
        if LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= "" and LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= "" then 
			return true
		end
	end
	return false
end

CheckDistance = function(Player)
   if (Player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > utility.silent.maxdistance then 
       return true
   else
       return false
   end
end


GetClosestPlayer = function()
   local Target = nil
   local Closest = math.huge
   for _, v in pairs(Players:GetPlayers()) do
       if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
           if not OnScreen(v.Character.HumanoidRootPart) then 
               continue 
           end
           if utility.silent.visiblecheck and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
               continue 
           end
           if utility.silent.kocheck and v.Character:FindFirstChild("BodyEffects") then
               local KoCheck 
               if v.Character.BodyEffects:FindFirstChild("KO") then 
                   KoCheck = v.Character.BodyEffects:FindFirstChild("KO").Value
               elseif v.Character.BodyEffects:FindFirstChild("K.O") then
                   KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
               end
               
               if KoCheck then
                   continue
               end
           end
           if utility.silent.crewcheck and FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value then
               continue
           end
           if utility.silent.friendcheck and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
               continue
           end

           if utility.silent.distancecheck and CheckDistance(v) then
               continue
           end


           local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

           if (Distance < Closest and utility.fov.size * 3 + Distance * 0.3 > Distance) then
               Closest = Distance
               Target = v
           end
       end
   end

   return Target
   
end


LPH_NO_VIRTUALIZE(function()
   local mt = getrawmetatable(game)
   local old = mt.__namecall
   setreadonly(mt, false)
   mt.__namecall = newcclosure(function(...)
       local args = {...}

       if autostomp.enabled and getnamecallmethod() == "FireServer" and args[2] == utility.silent.arg then
           args[3] = game.Players[autostomp.target].Character.HumanoidRootPart.Position + (game.Players[autostomp.target].Character.HumanoidRootPart.Velocity * utility.prediction.pred)
           return old(unpack(args))
       end

       return old(...)
   end)
end)()

Plr_Target.element('Toggle', 'View', false, function(v)
   if v.Toggle == true then 
      utility.target.view = true
   else
      utility.target.view = false
   end
end)

Plr_Target.element('Toggle', 'Highlight', false, function(v)
   if v.Toggle == true then 
      utility.target.highlight = true
   else
      utility.target.highlight = false
   end
end):add_color({Color = Color3.fromRGB(84, 101, 255)}, nil, function(v)
   utility.target.highlightcolor = v.Color
end)

Plr_Target.element('Toggle', 'Aim View', false, function(v)
   utility.target.aimview = v.Toggle
end)

local saved_pos = nil

Plr_Target.element('Toggle', 'Fling', false, function(v)
   if v.Toggle == true then 
      saved_pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
      task.wait()
      utility.target.fling = true
   else
      utility.target.fling = false
      if saved_pos == nil then 
         return
      end
      task.wait()
      LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
      LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(saved_pos)
      LocalPlayer.Character.HumanoidRootPart.Anchored = true
      for i = 1,10 do 
         LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
         task.wait()
      end
      LocalPlayer.Character.HumanoidRootPart.Anchored = false
      LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(saved_pos)
   end
end)



-- // Visuals \\ --
RotateCrosshair.element('Toggle', 'Enabled', false, function(v)
   utility.visuals.crosshair.rotating.enabled = v.Toggle
end)

RotateCrosshair.element('Toggle', 'Round', false, function(v)
   if v.Toggle == true then 
      local Round = Instance.new("UICorner")
      Round.Name = "hvh_"
      Round.CornerRadius = UDim.new(1, 0)
      Round.Parent = get("screen").Aim
   else
      if get("screen").Aim:FindFirstChild("hvh_") then 
         get("screen").Aim:FindFirstChild("hvh_"):Destroy()
      end
   end
end)


RotateCrosshair.element('Slider', 'Speed', {default = {min = 1, max = 10, default = 1}}, function(v)
   utility.visuals.crosshair.rotating.speed = v.Slider
end)

RotateCrosshair.element('Slider', 'Size', {default = {min = 1, max = 25, default = 4}}, function(v)
   get("screen").Aim.Size =  UDim2.new(0, v.Slider, 0, v.Slider)
end)

RotateCrosshair.element('Dropdown', 'Direction', {options = {'Left', 'Right', 'Random', 'Fluctuate'}}, function(v)
   utility.visuals.crosshair.rotating.direction = v.Dropdown
end)

RotateCrosshair.element("Button", "Reset", nil, function()
   if utility.visuals.crosshair.custom.enabled == false then
    get("screen").Aim.Rotation = 0
   else
      Cursor.Rotation = 0
   end
end)

CustomCrosshair.element('Toggle', 'Enabled', false, function(v)
   utility.visuals.crosshair.custom.enabled = v.Toggle
end)

CustomCrosshair.element('Toggle', 'Preview', false, function(v)
   utility.visuals.crosshair.custom.preview = v.Toggle
end)

CustomCrosshair.element('Slider', 'Transparency', {default = {min = 0, max = 10, default = 0}}, function(v)
   utility.visuals.crosshair.custom.transparency = v.Slider / 10
end)


CustomCrosshair.element('Slider', 'Size', {default = {min = 10, max = 100, default = 28}}, function(v)
   utility.visuals.crosshair.custom.size = v.Slider 
end)

CustomCrosshair.element('Dropdown', 'Preset', {options = {"Light Blue Glow","Dark Blue Glow","Pink Glow","Green Glow","Yellow Glow","Orange Glow","Hello Kitty","X","43 cross","swag","Divine","Standard","milooue"}}, function(v)
   if v.Dropdown == "Pink Glow" then 
      setcursor(11927593271)
  elseif v.Dropdown == "Light Blue Glow" then
      setcursor(11927574847)
  elseif v.Dropdown == "Dark Blue Glow" then
      setcursor(11934534450)
  elseif v.Dropdown == "Green Glow" then
      setcursor(11927621846)
  elseif v.Dropdown == "Yellow Glow" then
      setcursor(11932942663)
  elseif v.Dropdown == "Orange Glow" then
      setcursor(11934947206)
  elseif v.Dropdown == "Hello Kitty" then
      setcursor(11927681023)
  elseif v.Dropdown == "X" then 
      setcursor(2167271529)
   elseif v.Dropdown == "43 cross" then
      setcursor(2128690040)
   elseif v.Dropdown == "swag" then
      setcursor(2706158688)
   elseif v.Dropdown == "Divine" then
      setcursor(2513422930)
   elseif v.Dropdown == "Standard" then
      setcursor(2169048241)
   elseif v.Dropdown == "milooue" then
      setcursor(358650770)
  end
end)

CustomCrosshair.element("TextBox", "Crosshair ID","11934534450",function(v)
   setcursor(v.Text)
end)


MapVisuals.element('Toggle', 'Enabled', false, function(v)
   utility.visuals.map.enabled = v.Toggle
end):add_color({Color = Color3.fromRGB(255,255,255)}, nil, function(v)
   utility.visuals.map.color = v.Color
end)

MapVisuals.element('Slider', 'Brightness', {default = {min = 0, max = 100, default = 0}}, function(v)
   utility.visuals.map.brightness = v.Slider / 50
end)

MapVisuals.element('Slider', 'Contrast', {default = {min = 0, max = 100, default = 0}}, function(v)
   utility.visuals.map.contrast = v.Slider / 50
end)

MapVisuals.element('Slider', 'Saturation', {default = {min = 0, max = 100, default = 0}}, function(v)
   utility.visuals.map.saturation = v.Slider / 10
end)


-- // Movement Tab \\ --

CustomVel.element('Toggle', 'Enabled', false, function(v)
   utility.anti.custom.enabled = v.Toggle
end)

CustomVel.element('Slider', 'X', {default = {min = -300, max = 300, default = 0}}, function(v)
   utility.anti.custom.x = v.Slider
end)
CustomVel.element('Slider', 'Y', {default = {min = -300, max = 300, default = 0}}, function(v)
   utility.anti.custom.y = v.Slider
end)
CustomVel.element('Slider', 'Z', {default = {min = -300, max = 300, default = 0}}, function(v)
   utility.anti.custom.z = v.Slider
end)

CustomVel.element('Dropdown', 'Preset', {options = {'Custom','Sky', 'Ground', 'Random'}}, function(v)
   utility.anti.custom.preset = v.Dropdown
end)

BreakVel.element('Toggle', 'Enabled', false, function(v)
   utility.anti.breaker.enabled = v.Toggle
end)

MultiplyVel.element('Toggle', 'Enabled', false, function(v)
   utility.anti.multiply.enabled = v.Toggle
end)

MultiplyVel.element('Slider', 'Multiplier', {default = {min = -10, max = 10, default = 1}}, function(v)
   utility.anti.multiply.multiplier = v.Slider
end)

Dot.element('Toggle', 'Enabled', false, function(v)
   utility.anti.visuals.dot.enabled = v.Toggle
end):add_color({Color = Color3.fromRGB(255,255,255)}, nil, function(v)
   utility.anti.visuals.dot.color = v.Color
end)

Dot.element('Slider', 'Size', {default = {min = 1, max = 10, default = 3}}, function(v)
   utility.anti.visuals.dot.size = v.Slider
end)

Dot.element('Slider', 'Transparency', {default = {min = 1, max = 100, default = 100}}, function(v)
   utility.anti.visuals.dot.trans = v.Slider / 100
end)

Dot.element('Toggle', 'Filled', false, function(v)
   utility.anti.visuals.dot.filled = v.Toggle
end)

Line.element('Toggle', 'Enabled', false, function(v)
   utility.anti.visuals.line.enabled = v.Toggle
end):add_color({Color = Color3.fromRGB(255,255,255)}, nil, function(v)
   utility.anti.visuals.line.color = v.Color
end)

Line.element('Slider', 'Size', {default = {min = 1, max = 10, default = 1}}, function(v)
   utility.anti.visuals.line.size = v.Slider
end)

Line.element('Slider', 'Transparency', {default = {min = 1, max = 100, default = 100}}, function(v)
   utility.anti.visuals.line.trans = v.Slider / 100
end)

VisualizerSettings.element('Dropdown', 'Part', {options = utility.hitparts}, function(v)
   utility.anti.visuals.part = v.Dropdown
end)



-- // Settings Tab \\ --

if not isfile(utility.folder.."/autoload.txt") then 
   writefile(utility.folder.."/autoload.txt","None")
end

local configs = Settings.new_sector("Configurations","Left")
local settings = Settings.new_sector('Settings', 'Right')


local autosave = false
local autosaveinterval = 30
local notifications = false

local configname = ""
local text
local list = configs.element("Scroll", "Configuration list", {options = {"None"}}, function(State)
   text:set_value({Text = State.Scroll})
end)

text = configs.element("TextBox", "Configuration name","None",function(v)
   configname = v.Text
end)

configs.element("Button", "Save", nil, function()
   if configname == "None" then 
      notify("Err: Cannot save to 'None'")
      return
   end
   menu.save_cfg("/"..configname)
   notify("Saved: "..configname)
end)

configs.element("Button", "Load", nil, function()
   if configname == "None" then 
      notify("Err: Cannot load 'None'")
      return
   end
   menu.load_cfg("/"..configname)
   notify("Loaded: "..configname)
end)

configs.element("Button", "Delete", nil, function()
   if configname == "None" then 
      notify("Err: Cannot delete 'None'")
      return
   end
   delfile(utility.folder.."/settings/"..configname..".json")
   notify("Deleted: "..configname)
   list:remove_value(config_name)
end)

configs.element("Button", "Set Autoload", nil, function()
   writefile(utility.folder.."/autoload.txt",configname)
   notify("Autoload set to: "..configname)
end)

configs.element('Toggle', 'Autosave', false, function(v)
   autosave = v.Toggle
end)

configs.element('Toggle', 'Save Notifications', false, function(v)
   notifications = v.Toggle
end)

configs.element('Slider', 'Save Interval', {default = {min = 5, max = 300, default = 30}}, function(v)
   autosaveinterval = v.Slider
end)

task.spawn(function()
   while task.wait(autosaveinterval) do 
       if autosave then
            if configname == "None" then 
               notify("Please select a config to use autosave.")
               return
            end
            menu.save_cfg("/"..configname)
            if notifications then 
               notify(configname.." has been autosaved.")
            end
       end
   end
end)

task.spawn(function()
    while true do
        task.wait(1)
        local all_cfgs = listfiles(utility.folder.."/settings".."\\")
        for index,cfg in next, all_cfgs do
            all_cfgs[index] = string.gsub(string.gsub(cfg, utility.folder.."/settings".."\\", ""), ".json", "")
            list:add_value(all_cfgs[index])
        end
    end
end)


settings.element("TextBox", "Aiming Prediction","0.013",function(v)
   utility.prediction.pred = tonumber(v.Text)
end)

settings.element('Toggle', 'Auto Prediction', false, function(v)
   utility.prediction.auto = v.Toggle
end)


settings.element('Dropdown', 'Aiming Argument', {options = utility.mouse_args}, function(v)
   utility.silent.arg = v.Dropdown
end)

settings.element('Dropdown', 'Target Mode', {options = {"Orbit","Sky"}}, function(v)
   utility.target.mode = v.Dropdown
end)


settings.element('Dropdown', 'Notification Type', {options = utility.options.notifications.notification_modes}, function(v)
   utility.options.notifications.mode = v.Dropdown
end)

settings.element('Slider', 'Notification Duration', {default = {min = 1, max = 10, default = 3}}, function(v)
   utility.options.notifications.duration = v.Slider
end)

settings.element('Toggle', 'Show Friends', false, function(v)
   utility.show_friends = v.Toggle
end)

settings.element('Toggle', 'Notify On Friend Joined/Left', false, function(v)
   utility.notify_on_friend_join = v.Toggle
end)

settings.element('Toggle', 'Show Stats', false, function(v)
   utility.show_stats = v.Toggle
end)


-- // Electron Variables 

local hitSounds = {
   Bameware = "rbxassetid://3124331820",
   Bell = "rbxassetid://6534947240",
   Bubble = "rbxassetid://6534947588",
   Pick = "rbxassetid://1347140027",
   Pop = "rbxassetid://198598793",
   Rust = "rbxassetid://1255040462",
   Sans = "rbxassetid://3188795283",
   Fart = "rbxassetid://130833677",
   Big = "rbxassetid://5332005053",
   Vine = "rbxassetid://5332680810",
   Bruh = "rbxassetid://4578740568",
   Skeet = "rbxassetid://5633695679",
   Neverlose = "rbxassetid://6534948092",
   Fatality = "rbxassetid://6534947869",
   Bonk = "rbxassetid://5766898159",
   Minecraft = "rbxassetid://4018616850",
}

function setuphitmarker(plr) 
   plr.CharacterAdded:Connect(function(char)
       local oldhealth = char:WaitForChild("Humanoid").Health
       local connection
       connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
           if health < oldhealth then 
               if plr == Script.ClosestSilentTarget then 
                   if utility.silent.hitsound.enabled then 
                       local Sound = Instance.new('Sound', CurrentCamera)
                       local SoundName = utility.silent.hitsound.sound
                       local SoundID = hitSounds[SoundName]
                       Sound.SoundId = SoundID
                       Sound.Volume = utility.silent.hitsound.volume
                       Sound:Play()
                       delay(10,function()
                           Sound:Destroy()
                       end)
                   end
                   if utility.silent.hitlog then 
                     if math.floor(health) > 0 then
                        notify(tostring(math.floor(oldhealth) - math.floor(health)).." damage inflicted on "..char.Humanoid.DisplayName)
                     else
                        notify("Knocked "..char.Humanoid.DisplayName)
                     end
                   end
               end
           end
           oldhealth = health
           if health == 0 then 
               connection:Disconnect()
           end
       end)
   end)
end

for i,v in pairs(game.Players:GetChildren()) do 
   setuphitmarker(v)
end

for i,plr in pairs(game.Players:GetChildren()) do 
   local char = plr.Character
   local oldhealth = char:WaitForChild("Humanoid").Health
   local connection
   connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
       if health < oldhealth then 
           if plr == Script.ClosestSilentTarget then 
               if utility.silent.hitsound.enabled then 
                   local Sound = Instance.new('Sound', CurrentCamera)
                   local SoundName = utility.silent.hitsound.sound
                   local SoundID = hitSounds[SoundName]
                   Sound.SoundId = SoundID
                   Sound.Volume = utility.silent.hitsound.volume
                   Sound:Play()
                   delay(10,function()
                       Sound:Destroy()
                   end)
               end
               if utility.silent.hitlog then 
                  if math.floor(health) > 0 then
                     notify(tostring(math.floor(oldhealth) - math.floor(health)).." damage inflicted on "..char.Humanoid.DisplayName)
                  else
                     notify("Knocked "..char.Humanoid.DisplayName)
                  end
               end
           end
       end
       oldhealth = health
       if health == 0 then 
           connection:Disconnect()
       end
   end)
end

game.Players.PlayerAdded:Connect(function(plr)
   setuphitmarker(plr)
end)



local fluc = 100
local fluc2 = true
local beam = createbeam(Workspace.Terrain)
local Attachment = Instance.new("Attachment", Workspace.Terrain)
beam.Attachment1 = Attachment 
local velocitymarker = Drawing.new("Text")
velocitymarker.Text = "{velocity: 0, 0, 0}"
velocitymarker.Color = Color3.fromRGB(84, 101, 255)
velocitymarker.Visible = false
velocitymarker.Outline = true
velocitymarker.Size = 16
velocitymarker.Font = 3
velocitymarker.Position = Vector2.new(20, 210)
velocitymarker.ZIndex = 1500
local pingmarker = Drawing.new("Text")
pingmarker.Text = "{ping: 0ms}"
pingmarker.Color = Color3.fromRGB(84, 101, 255)
pingmarker.Visible = false
pingmarker.Outline = true
pingmarker.Size = 16
pingmarker.Font = 3
pingmarker.Position = Vector2.new(20, 230)
pingmarker.ZIndex = 1500
local predictionmarker = Drawing.new("Text")
predictionmarker.Text = "{prediction: 0.013}"
predictionmarker.Color = Color3.fromRGB(84, 101, 255)
predictionmarker.Visible = false
predictionmarker.Outline = true
predictionmarker.Size = 16
predictionmarker.Font = 3
predictionmarker.Position = Vector2.new(20, 250)
predictionmarker.ZIndex = 1500
-- // Code \\ --
local velDot = Drawing.new("Circle")
velDot.Filled = true
velDot.Thickness = 1
velDot.Transparency = 1
velDot.Radius = 3

local velLine = Drawing.new("Line")
velLine.Visible = false
velLine.From = Vector2.new(0, 0)
velLine.To = Vector2.new(200, 200)
velLine.Thickness = 1
velLine.Transparency = 1

local Circle = Drawing.new("Circle")
Circle.Transparency = utility.fov.transparency
Circle.Radius = utility.fov.size * 3
Circle.Visible = utility.fov.visible
Circle.Color = utility.fov.color
Circle.Thickness = utility.fov.thickness
Circle.Filled = utility.fov.filled
Circle.NumSides = utility.fov.sides


local LocalHL = Instance.new("Highlight")
LocalHL.FillColor = utility.target.highlightcolor
LocalHL.OutlineColor = utility.target.highlightcolor

local LocalHL2 = Instance.new("Highlight")
LocalHL2.FillColor = utility.silent.highlightcolor
LocalHL2.OutlineColor = utility.silent.highlightcolor

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "TargetUI"
MainGui.Parent = game.CoreGui
MainGui.DisplayOrder = 998

local TargetUI = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Container_2 = Instance.new("Frame")
local Line_2 = Instance.new("Frame")
local Profile = Instance.new("ImageButton")
local HealthBorder = Instance.new("Frame")
local HealthBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local HealthText = Instance.new("TextLabel")
local HealthIcon = Instance.new("ImageButton")
local Title_2 = Instance.new("TextLabel")
local ArmorBorder = Instance.new("Frame")
local ArmorBar = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local ArmorText = Instance.new("TextLabel")
local ArmorIcon = Instance.new("ImageButton")
local UmbraShadow_2 = Instance.new("ImageLabel")
local AmbientShadow_2 = Instance.new("ImageLabel")

TargetUI.Name = "Target UI"
TargetUI.Parent = MainGui
TargetUI.AnchorPoint = Vector2.new(0.5, 0.5)
TargetUI.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
TargetUI.BackgroundTransparency = 0.700
TargetUI.BorderSizePixel = 0
TargetUI.Position = UDim2.new(0.504575729, 0, 0.787337661, 0)
TargetUI.Size = UDim2.new(0, 251, 0, 97)
TargetUI.Visible = false

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = TargetUI

Container_2.Name = "Container"
Container_2.Parent = TargetUI
Container_2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Container_2.BackgroundTransparency = 0.700
Container_2.BorderSizePixel = 0
Container_2.Position = UDim2.new(0.00973401312, 0, 0.027855942, 0)
Container_2.Size = UDim2.new(0, 248, 0, 94)

Line_2.Name = "Line"
Line_2.Parent = Container_2
Line_2.BackgroundColor3 = Color3.fromRGB(84, 101, 255)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(-0.00261220615, 0, -0.00655640941, 0)
Line_2.Size = UDim2.new(0, 249, 0, 3)

Profile.Name = "Profile"
Profile.Parent = Container_2
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 1.000
Profile.Position = UDim2.new(-0.00427350448, 0, 0.0338983051, 0)
Profile.Size = UDim2.new(0, 90, 0, 90)
Profile.AutoButtonColor = false
Profile.Image = "rbxthumb://type=AvatarHeadShot&id=590180069&w=420&h=420"

HealthBorder.Name = "HealthBorder"
HealthBorder.Parent = Container_2
HealthBorder.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
HealthBorder.BackgroundTransparency = 0.500
HealthBorder.BorderSizePixel = 0
HealthBorder.Position = UDim2.new(0.400000006, 0, 0.349999994, 0)
HealthBorder.Size = UDim2.new(0, 135, 0, 22)

HealthBar.Name = "HealthBar"
HealthBar.Parent = HealthBorder
HealthBar.Active = true
HealthBar.BackgroundColor3 = Color3.fromRGB(84, 101, 255)
HealthBar.BorderSizePixel = 0
HealthBar.ClipsDescendants = true
HealthBar.Position = UDim2.new(0.0220597833, 0, -0.0436026901, 0)
HealthBar.Size = UDim2.new(1, 0, 1, 0)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = HealthBar

HealthText.Name = "HealthText"
HealthText.Parent = HealthBorder
HealthText.BackgroundColor3 = Color3.fromRGB(118, 118, 118)
HealthText.BackgroundTransparency = 1.000
HealthText.Size = UDim2.new(0, 138, 0, 22)
HealthText.Font = Enum.Font.Ubuntu
HealthText.Text = "100"
HealthText.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthText.TextSize = 20.000

HealthIcon.Name = "HealthIcon"
HealthIcon.Parent = HealthBorder
HealthIcon.BackgroundTransparency = 1.000
HealthIcon.Position = UDim2.new(0.0900000036, 0, 0.119999997, 0)
HealthIcon.Size = UDim2.new(0, 15, 0, 15)
HealthIcon.ZIndex = 2
HealthIcon.Image = "rbxassetid://3926305904"
HealthIcon.ImageRectOffset = Vector2.new(964, 444)
HealthIcon.ImageRectSize = Vector2.new(36, 36)

Title_2.Name = "Title"
Title_2.Parent = Container_2
Title_2.BackgroundColor3 = Color3.fromRGB(118, 118, 118)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0.426879644, 0, 0.0496608652, 0)
Title_2.Size = UDim2.new(0, 132, 0, 25)
Title_2.Font = Enum.Font.Ubuntu
Title_2.Text = "xzz (@da1nonlyfr)"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 20.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left

ArmorBorder.Name = "ArmorBorder"
ArmorBorder.Parent = Container_2
ArmorBorder.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ArmorBorder.BackgroundTransparency = 0.500
ArmorBorder.BorderSizePixel = 0
ArmorBorder.Position = UDim2.new(0.400000006, 0, 0.649999976, 0)
ArmorBorder.Size = UDim2.new(0, 135, 0, 22)

ArmorBar.Name = "ArmorBar"
ArmorBar.Parent = ArmorBorder
ArmorBar.BackgroundColor3 = Color3.fromRGB(84, 101, 255)
ArmorBar.BorderSizePixel = 0
ArmorBar.Position = UDim2.new(0.0220597833, 0, -0.0436026901, 0)
ArmorBar.Size = UDim2.new(1, 0, 1, 0)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = ArmorBar

ArmorText.Name = "ArmorText"
ArmorText.Parent = ArmorBorder
ArmorText.BackgroundColor3 = Color3.fromRGB(118, 118, 118)
ArmorText.BackgroundTransparency = 1.000
ArmorText.Size = UDim2.new(0, 138, 0, 21)
ArmorText.Font = Enum.Font.Ubuntu
ArmorText.Text = "100"
ArmorText.TextColor3 = Color3.fromRGB(255, 255, 255)
ArmorText.TextSize = 20.000

ArmorIcon.Name = "ArmorIcon"
ArmorIcon.Parent = ArmorBorder
ArmorIcon.BackgroundTransparency = 1.000
ArmorIcon.Position = UDim2.new(0.0900000036, 0, 0.119999997, 0)
ArmorIcon.Size = UDim2.new(0, 15, 0, 15)
ArmorIcon.ZIndex = 2
ArmorIcon.Image = "rbxassetid://3926307971"
ArmorIcon.ImageRectOffset = Vector2.new(164, 284)
ArmorIcon.ImageRectSize = Vector2.new(36, 36)

UmbraShadow_2.Name = "UmbraShadow"
UmbraShadow_2.Parent = TargetUI
UmbraShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
UmbraShadow_2.BackgroundTransparency = 1.000
UmbraShadow_2.BorderSizePixel = 0
UmbraShadow_2.Position = UDim2.new(0.5, 0, 0.5, 6)
UmbraShadow_2.Size = UDim2.new(1, 10, 1, 10)
UmbraShadow_2.ZIndex = 0
UmbraShadow_2.Image = "rbxassetid://1316045217"
UmbraShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
UmbraShadow_2.ImageTransparency = 0.850
UmbraShadow_2.ScaleType = Enum.ScaleType.Slice
UmbraShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

AmbientShadow_2.Name = "AmbientShadow"
AmbientShadow_2.Parent = TargetUI
AmbientShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
AmbientShadow_2.BackgroundTransparency = 1.000
AmbientShadow_2.BorderSizePixel = 0
AmbientShadow_2.Position = UDim2.new(0.5, 0, 0.476000011, 3)
AmbientShadow_2.Size = UDim2.new(1, 5, 1, 5)
AmbientShadow_2.ZIndex = 0
AmbientShadow_2.Image = "rbxassetid://1316045217"
AmbientShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
AmbientShadow_2.ImageTransparency = 0.500
AmbientShadow_2.ScaleType = Enum.ScaleType.Slice
AmbientShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

function ActivateSilent() 

end

LPH_NO_VIRTUALIZE(function()
   local mt = getrawmetatable(game)
   local old = mt.__namecall
   setreadonly(mt, false)
   mt.__namecall = newcclosure(function(...)
       local args = {...}

       if utility.silent.enabled and Script.ClosestSilentTarget ~= nil and getnamecallmethod() == "FireServer" and args[2] == utility.silent.arg and utility.silent.aimviewbypass == false then
            local offset = Vector3.new(0,0,0)
            if Script.ClosestSilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
               offset = Vector3.new(0,utility.silent.jumpoffset,0)
            end
           args[3] = Script.ClosestSilentTarget.Character.Head.Position + offset + (Script.ClosestSilentTarget.Character.Head.Velocity * utility.prediction.pred)
           return old(unpack(args))
       end

       return old(...)
   end)
end)()

spawn(function()
   while task.wait() do
       if utility.silent.targetui and Script.ClosestSilentTarget ~= nil then
           if Alive(Script.ClosestSilentTarget) then
               local NewHealth = Script.ClosestSilentTarget.Character.Humanoid.Health / Script.ClosestSilentTarget.Character.Humanoid.MaxHealth
               Profile.Image = "rbxthumb://type=AvatarHeadShot&id=" .. Script.ClosestSilentTarget.UserId .. "&w=420&h=420"
               Title_2.Text = Script.ClosestSilentTarget.DisplayName .. " (@" .. Script.ClosestSilentTarget.Name .. ")"
               HealthText.Text = Round(NewHealth * 100, 2)
               HealthBar:TweenSize(UDim2.new(NewHealth, 0, 1, 0), "In", "Linear", 0.1)
               if Script.ClosestSilentTarget.Character:FindFirstChild("BodyEffects") and Script.ClosestSilentTarget.Character:FindFirstChild("BodyEffects"):FindFirstChild("Armor") then
                   local NewArmor = Script.ClosestSilentTarget.Character.BodyEffects.Armor.Value / 200
                   ArmorText.Text = Round(NewArmor * 100, 2)
                   ArmorBar:TweenSize(UDim2.new(NewArmor, 0, 1, 0), "In", "Linear", 0.1)
               else
                   ArmorText.Text = "Data Not Found!"
               end
               TargetUI.Visible = true
           end
       else
           TargetUI.Visible = false
       end
   end
end)

RunService.Heartbeat:Connect(function()
   Circle.Transparency = utility.fov.transparency
   Circle.Radius = utility.fov.size * 3
   Circle.Visible = utility.fov.visible
   Circle.Color = utility.fov.color
   Circle.Thickness = utility.fov.thickness
   Circle.Filled = utility.fov.filled
   Circle.NumSides = utility.fov.sides
   Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Gui:GetGuiInset().Y)
   if utility.silent.highlight and Script.ClosestSilentTarget then 
      if LocalHL2.Parent ~= Script.ClosestSilentTarget.Character then
         LocalHL2.Parent = Script.ClosestSilentTarget.Character
      end
   else
      if LocalHL2.Parent ~= game.CoreGui then 
         LocalHL2.Parent = game.CoreGui
      end
   end
   if utility.prediction.auto then 
      utility.prediction.pred = get("prediction")
   end
   if utility.silent.enabled then 
      if utility.silent.mode == "FOV" then 
         Script.ClosestSilentTarget = GetClosestPlayer()
      end
   end
   local Char = CurrentCamera:WorldToViewportPoint(LocalPlayer.Character[utility.anti.visuals.part].Position)
	local Pred, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(
		LocalPlayer.Character[utility.anti.visuals.part].CFrame.Position +
			(LocalPlayer.Character[utility.anti.visuals.part].AssemblyLinearVelocity *
            utility.prediction.pred))

   if utility.anti.visuals.dot.enabled and onScreen then 
      velDot.Visible = true
      velDot.Color = utility.anti.visuals.dot.color
      velDot.Radius = utility.anti.visuals.dot.size
      velDot.Transparency = utility.anti.visuals.dot.trans
      velDot.Filled = utility.anti.visuals.dot.filled
      velDot.Position = Vector2.new(Pred.X, Pred.Y)
   else
      velDot.Visible = false
   end

   if utility.anti.visuals.line.enabled and onScreen then 
      velLine.Visible = true
      velLine.Color = utility.anti.visuals.line.color
      velLine.Thickness = utility.anti.visuals.line.size
      velLine.Transparency = utility.anti.visuals.line.trans
		velLine.To = Vector2.new(Pred.X, Pred.Y)
      velLine.From = Vector2.new(Char.X, Char.Y)
   else
      velLine.Visible = false
   end
end)
RunService.Heartbeat:Connect(function()
   local RootPart, Humanoid = LocalPlayer.Character.HumanoidRootPart, LocalPlayer.Character.Humanoid
	local Velocity, cFrame = RootPart.Velocity, RootPart.CFrame

   if utility.anti.custom.preset == "Sky" then 
      utility.anti.custom.x = Velocity.X
      utility.anti.custom.y = math.random(80,100)
      utility.anti.custom.z = Velocity.Z
   elseif utility.anti.custom.preset == "Ground" then 
      utility.anti.custom.x = Velocity.X
      utility.anti.custom.y = -math.random(80,100)
      utility.anti.custom.z = Velocity.Z
   elseif utility.anti.custom.preset == "Random" then 
      utility.anti.custom.x = math.random(-300, 300)
      utility.anti.custom.y = math.random(-300, 300)
      utility.anti.custom.z = math.random(-300, 300)
   end

   if utility.anti.custom.enabled then
		RootPart.Velocity = Vector3.new(utility.anti.custom.x, utility.anti.custom.y, utility.anti.custom.z)
      RunService.RenderStepped:wait()
		RootPart.Velocity = Velocity
	end

   if utility.anti.breaker.enabled then
		RootPart.Velocity = Velocity * 0
      RunService.RenderStepped:wait()
		RootPart.Velocity = Velocity
	end

   if utility.anti.multiply.enabled then
		RootPart.Velocity = Velocity * Vector3.new(utility.anti.multiply.multiplier, utility.anti.multiply.multiplier, utility.anti.multiply.multiplier)
      RunService.RenderStepped:wait()
		RootPart.Velocity = Velocity
	end

   if utility.misc.autoreload then 
      if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
         if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
             if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                 get("event"):FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))
             end
         end
     end
   end

   if utility.show_stats then 
      local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
      local Value = tostring(PingStats)
      local PingValue = Value:split(" ")
      local PingNumber = tonumber(PingValue[1])
      velocitymarker.Visible = true
      pingmarker.Visible = true
      predictionmarker.Visible = true
      pingmarker.Text = "{ping: "..tostring(math.floor(PingNumber)).."ms}"
      predictionmarker.Text = "{prediction: "..utility.prediction.pred.."}"
      velocitymarker.Text = "{velocity: "..tostring(math.floor(LocalPlayer.Character.HumanoidRootPart.Velocity.X)..", "..math.floor(LocalPlayer.Character.HumanoidRootPart.Velocity.Y)..", "..math.floor(LocalPlayer.Character.HumanoidRootPart.Velocity.Z)).."}"
   else
      velocitymarker.Visible = false
      pingmarker.Visible = false
      predictionmarker.Visible = false
   end
   if utility.target.view then 
      if utility.target.target == game.Players.LocalPlayer.Name or utility.target.target == nil then 
         return
      end
      CurrentCamera.CameraSubject = game.Players[utility.target.target].Character.Humanoid
   else
      CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
   end

   if utility.target.fling then 
      if utility.target.target == game.Players.LocalPlayer.Name or utility.target.target == nil then 
         return
      end
      local OldVelocityFling = LocalPlayer.Character.HumanoidRootPart.Velocity
      LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[utility.target.target].Character.HumanoidRootPart.CFrame 
      LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,1,0) * -16384
      RunService.RenderStepped:wait() 
      LocalPlayer.Character.HumanoidRootPart.Velocity = OldVelocityFling
      LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[utility.target.target].Character.HumanoidRootPart.CFrame 
   end

   if utility.target.highlight then 
      if utility.target.target == game.Players.LocalPlayer.Name or utility.target.target == nil then
         if LocalHL.Parent ~= game.CoreGui then 
            LocalHL.Parent = game.CoreGui
         end 
         return
      end
      LocalHL.FillColor = utility.target.highlightcolor
      LocalHL.OutlineColor = utility.target.highlightcolor
      if LocalHL.Parent ~= game.Players[utility.target.target].Character then 
         LocalHL.Parent = game.Players[utility.target.target].Character
      end
   else
      if LocalHL.Parent ~= game.CoreGui then 
         LocalHL.Parent = game.CoreGui
      end 
   end

   if utility.target.aimview then 
      if utility.target.target == nil then 
         return
      end
      if Alive(game.Players[utility.target.target]) and game.Players[utility.target.target].Character:FindFirstChildOfClass("Tool") then 
         beam.Enabled = true
         beam.Attachment0 = game.Players[utility.target.target].Character:waitForChild("Head"):waitForChild("FaceCenterAttachment")
         Attachment.WorldPosition = game.Players[utility.target.target].Character:waitForChild("BodyEffects"):waitForChild("MousePos").Value
      else
         beam.Enabled = false
      end
   else
      beam.Enabled = false
   end

   if MapLightingJmp.Enabled ~= utility.visuals.map.enabled then
      MapLightingJmp.Enabled = utility.visuals.map.enabled
   end
   if MapLightingJmp.Brightness ~= utility.visuals.map.brightness then
      MapLightingJmp.Brightness = utility.visuals.map.brightness
   end
   if MapLightingJmp.Contrast ~= utility.visuals.map.contrast then
      MapLightingJmp.Contrast = utility.visuals.map.contrast
   end
   if MapLightingJmp.TintColor ~= utility.visuals.map.color then
      MapLightingJmp.TintColor = utility.visuals.map.color
   end
   if MapLightingJmp.Saturation ~= utility.visuals.map.saturation then
      MapLightingJmp.Saturation = utility.visuals.map.saturation
   end
   if MapLightingJmp.Parent ~= Lighting then
      MapLightingJmp.Parent = Lighting
   end

   if utility.visuals.crosshair.rotating.enabled then 
      if get("screen").Aim.Visible == true then 
         if utility.visuals.crosshair.rotating.direction == "Right" then 
            if utility.visuals.crosshair.custom.enabled == false then
               get("screen").Aim.Rotation = get("screen").Aim.Rotation + utility.visuals.crosshair.rotating.speed
            else
               Cursor.Rotation = Cursor.Rotation + utility.visuals.crosshair.rotating.speed
            end
         elseif utility.visuals.crosshair.rotating.direction == "Left" then
            if utility.visuals.crosshair.custom.enabled == false then
               get("screen").Aim.Rotation = get("screen").Aim.Rotation - utility.visuals.crosshair.rotating.speed
            else
               Cursor.Rotation = Cursor.Rotation - utility.visuals.crosshair.rotating.speed
            end
         elseif utility.visuals.crosshair.rotating.direction == "Fluctuate" then
               if fluc2 == true then 
                  fluc = fluc - 1
                  if fluc == 0 then 
                     fluc2 = false
                  end
                  if utility.visuals.crosshair.custom.enabled == false then
                     get("screen").Aim.Rotation = get("screen").Aim.Rotation - utility.visuals.crosshair.rotating.speed
                  else
                     Cursor.Rotation = Cursor.Rotation - utility.visuals.crosshair.rotating.speed
                  end
               else 
                  fluc = fluc + 1
                  if fluc == 100 then 
                     fluc2 = true
                  end
                  if utility.visuals.crosshair.custom.enabled == false then
                     get("screen").Aim.Rotation = get("screen").Aim.Rotation + utility.visuals.crosshair.rotating.speed
                  else
                     Cursor.Rotation = Cursor.Rotation + utility.visuals.crosshair.rotating.speed
                  end
               end
         elseif utility.visuals.crosshair.rotating.direction == "Random" then
            if utility.visuals.crosshair.custom.enabled == false then
               get("screen").Aim.Rotation = math.random(1, 360)
            else
               Cursor.Rotation = math.random(1, 360)
            end
         end
      end
   end
   for i,v in pairs(utility.friends_esp) do 
      if i ~= LocalPlayer and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
         local Hum = i.Character.Humanoid
         local Hrp = i.Character.HumanoidRootPart
         
         local Vector, OnScreen = CurrentCamera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
         local Size = (CurrentCamera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - CurrentCamera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
         local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
         local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
         local BottomOffset = BoxSize.Y + BoxPos.Y + 1
         if utility.show_friends and OnScreen then         
            v.Marker.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 10)
            v.Marker.Text = i.DisplayName.." ( friend )"
            v.Marker.Visible = true
         else
            v.Marker.Visible = false
         end
      end
   end
end)

local EspPlayers = {}



-- // End \\ --

for i,v in pairs(game.Players:GetPlayers()) do 
   if v ~= LocalPlayer then 
      PlayerList:add_value(v.Name)
      table.insert(utility.players,v.Name)
      if LocalPlayer:IsFriendsWith(v.UserId) then 
         table.insert(utility.friends,v.Name)
         friendmarker(v)
      end
   end
end

game.Players.PlayerAdded:Connect(function(v)
   if v ~= LocalPlayer then 
      PlayerList:add_value(v.Name)
      table.insert(utility.players,v.Name)
      if LocalPlayer:IsFriendsWith(v.UserId) then 
         table.insert(utility.friends,v.Name)
         friendmarker(v)
         if utility.notify_on_friend_join then 
            if v.FollowUserId == LocalPlayer.UserId then 
               notify(v.DisplayName.." has joined you from your profile.")
            else
               notify(v.DisplayName.." has joined your server.")
            end
         end
      end
   end
end)

game.Players.PlayerRemoving:Connect(function(v)
   if v ~= LocalPlayer then 
      local index = table.find(utility.players,v.Name)
      local index2 = table.find(utility.friends,v.Name)
      PlayerList:remove_value(v.Name)
      table.remove(utility.players,index)
      if LocalPlayer:IsFriendsWith(v.UserId) then 
         table.remove(utility.friends,index2)
         for i,v in pairs(utility.friends_esp[v]) do
            v:Remove()
        end
         utility.friends_esp[v] = nil
         if utility.notify_on_friend_join then 
            notify(v.DisplayName.." has left your server.")
         end
      end
   end
end)

notify(utility.name.." has loaded.")

if readfile(utility.folder.."/autoload.txt") ~= "None" then 
   task.wait(0.1)
   menu.load_cfg("/"..readfile(utility.folder.."/autoload.txt"))
   notify(readfile(utility.folder.."/autoload.txt").." has auto loaded. to disable autoload select None and click set autoload.")
end
