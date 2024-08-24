local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst   = game:GetService("ReplicatedFirst")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local Lighting          = game:GetService("Lighting")
local Players           = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer.PlayerGui
local Mouse       = LocalPlayer:GetMouse()
local Camera      = workspace.CurrentCamera

local DLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/f1nobe7650/other/main/plugins/3d%20drawings"))()

if not LPH_OBFUSCATED then  -- set these if not obfuscated so your script can run without obfuscation for when you are testing
    LPH_JIT_MAX = function(...) return (...) end;
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
end




local TargetStrafePart = Instance.new("MeshPart")
TargetStrafePart.MeshId = "rbxassetid://3726303797"
TargetStrafePart.CanCollide = false
TargetStrafePart.Anchored = true
TargetStrafePart.Material = Enum.Material.Neon
TargetStrafePart.Parent = game.Workspace
TargetStrafePart.CFrame = CFrame.new(9999,9999,9999)
TargetStrafePart.Size = Vector3.new(2 * 0.7, 7, 2 * 0.7)
TargetStrafePart.Color = Color3.fromRGB(255,255,255)



local Visualize = DLib:New3DCube()
Visualize.ZIndex = 4 
Visualize.Visible = false 
Visualize.Transparency = 0.5 
Visualize.Color = Color3.fromRGB(255,255,255)
Visualize.Thickness = 1 
Visualize.Filled = true 
Visualize.Position = LocalPlayer.Character.HumanoidRootPart.Position
Visualize.Size = Vector3.new(1,1,1)


local Visualizecframe = game:GetObjects("rbxassetid://8246626421")[1]
Visualizecframe.Humanoid:Destroy()
Visualizecframe.Head.Face:Destroy()
Visualizecframe.Parent = game.Workspace
Visualizecframe.HumanoidRootPart.Velocity = Vector3.new()
Visualizecframe.HumanoidRootPart.CFrame = CFrame.new(9999,9999,9999)

local Dot = Drawing.new("Circle")
Dot.Visible = false 
Dot.Radius = 8
Dot.Thickness = 0 
Dot.Color = Color3.fromRGB(0,0,0)
Dot.Filled = true
Dot.ZIndex = 1

local LockDetector = Drawing.new("Circle")
LockDetector.Visible = false 
LockDetector.Radius = 8
LockDetector.Thickness = 0 
LockDetector.Color = Color3.fromRGB(0,0,0)
LockDetector.Filled = true
LockDetector.ZIndex = 1



local function Create(Object, Properties, Parent)
    local Obj = Instance.new(Object)

    for i,v in pairs (Properties) do
        Obj[i] = v
    end
    if Parent ~= nil then
        Obj.Parent = Parent
    end

    return Obj
end


local bodyParts = {} 

for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do 
    if v:IsA("BasePart") then 
        table.insert(bodyParts,v.Name)
    end 
end 


local ws = game.Workspace



local drawingPool =         {}
local function newDrawing(type, prop)
local obj = Drawing.new(type)
    if prop then
        for i,v in next, prop do
            obj[i] = v
        end
    end
    return obj  
end

for i,v in next, drawingPool do
    if not v.used then
        v.used = true
            drawing = v
        break
    end
end


local Current = {} 



local Watermark = {
Outline = newDrawing("Square", {
    Size = Vector2.new(150, 25),
    Position = Vector2.new(22,41),
    Color = Color3.fromRGB(0, 0, 0),
    Filled = true,
    Visible = false,
 }),
Inline = newDrawing("Square", {
    Size = Vector2.new(1,1),
    Position = Vector2.new(1,1),
    Color = Color3.fromRGB(50,50,50),
    Filled = true,
    Visible = false,
 }),
Frame = newDrawing("Image", {
    Size = Vector2.new(1,1),
    Position = Vector2.new(1,1),
    Visible = false,
    Data = game:HttpGet("https://i.imgur.com/5hmlrjX.png")
 }),
Accent = newDrawing("Square", {
    Size = Vector2.new(2,2),
    Position = Vector2.new(1,1),
    Color = Color3.fromRGB(0,111,255),
    Filled = true,
    Visible = false,
 }),
Title = newDrawing("Text", {
    Position = Vector2.new(1,1),
    Size = 13,
    Font = 2,
    Text = "".. LocalPlayer.Name .."",
    Color = Color3.fromRGB(255, 255, 255),
    Outline = true,
    Visible = false,
 }),
} 
local White = Color3.fromRGB(255,255,255)
--// 10's are Gaps and 8's are Sizes and Thickness is 1
local Cursor = {
    Line1 = newDrawing("Line", {
    Color = White,
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2 + 10, Camera.ViewportSize.Y/2),
    To = Vector2.new(Camera.ViewportSize.X/2 + 8, Camera.ViewportSize.Y/2),
    ZIndex = 2,

}),
    Line2 = newDrawing("Line", {
    Color = White,
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2 - 10, Camera.ViewportSize.Y/2),
    To = Vector2.new(Camera.ViewportSize.X/2 - 8 , Camera.ViewportSize.Y/2),
    ZIndex = 2,
}),
    Line3 = newDrawing("Line", {
    Color = White,
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 - 10),
    To = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 - 8),
    ZIndex = 2,
}),
    Line4 = newDrawing("Line", {
    Color = White,
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 + 10),
    To = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 + 8),
    ZIndex = 2,
}),
} 

local CursorOutlines = {
    OutlineLine1 = newDrawing("Line", {
    Color = Color3.fromRGB(0, 0, 0),
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2 + 10, Camera.ViewportSize.Y/2),
    To = Vector2.new(Camera.ViewportSize.X/2 + 8, Camera.ViewportSize.Y/2),
    ZIndex = 1,
}),
    OutlineLine2 = newDrawing("Line", {
    Color = Color3.fromRGB(0, 0, 0),
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2 - 10, Camera.ViewportSize.Y/2),
    To = Vector2.new(Camera.ViewportSize.X/2 - 8 , Camera.ViewportSize.Y/2),
    ZIndex = 1,
}),
    OutlineLine3 = newDrawing("Line", {
    Color = Color3.fromRGB(0, 0, 0),
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 - 10),
    To = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 - 8),
    ZIndex = 1,
}),
    OutlineLine4 = newDrawing("Line", {
    Color = Color3.fromRGB(0, 0, 0),
    Visible = false,
    Thickness = 1,
    From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 + 10),
    To = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 + 8),
    ZIndex = 1,
}),
}




function Notif(Text,Time,Color)
    local Notification = {
    Outline = newDrawing("Square", {
        Size = Vector2.new(150, 20),
        Position = Vector2.new(-Camera.ViewportSize.X/2,-500),
        Color = Color3.fromRGB(0, 0, 0),
        Filled = true,
        Visible = true,
     }),
    Inline = newDrawing("Square", {
        Size = Vector2.new(1,1),
        Position = Vector2.new(1,1),
        Color = Color3.fromRGB(50,50,50),
        Filled = true,
        Visible = true,
     }),
     Frame = newDrawing("Image", {
        Size = Vector2.new(1,1),
        Position = Vector2.new(1,1),
        Visible = true,
        Data = game:HttpGet("https://i.imgur.com/5hmlrjX.png")
     }),
    Accent = newDrawing("Square", {
        Size = Vector2.new(2,1),
        Position = Vector2.new(1,1),
        Color = Color,
        Filled = true,
        Visible = true,
     }),
    Title = newDrawing("Text", {
        Position = Vector2.new(1,1),
        Size = 13,
        Font = 2,
        Text = "".. Text .."",
        Color = Color3.fromRGB(255, 255, 255),
        Outline = true,
        Visible = true,
     }),
    } 
    
    table.insert(Current ,#Notification)
    
    Notification.Outline.Size =  Vector2.new(Notification.Title.TextBounds.X + 12, Notification.Title.TextBounds.Y + 15)
    Notification.Outline.Position = Vector2.new(Camera.ViewportSize.X/100 ,Camera.ViewportSize.Y/15 + 5 + #Current * 30)
    
    
    Notification.Inline.Size = Vector2.new(Notification.Outline.Size.X - 2, Notification.Outline.Size.Y - 2)
    Notification.Inline.Position = Vector2.new(Notification.Outline.Position.X + 1, Notification.Outline.Position.Y + 1)
    Notification.Inline.Transparency = Notification.Outline.Transparency
    
    Notification.Frame.Size = Vector2.new(Notification.Inline.Size.X - 2, Notification.Inline.Size.Y - 2)
    Notification.Frame.Position = Vector2.new(Notification.Inline.Position.X + 1, Notification.Inline.Position.Y + 1)
    Notification.Frame.Transparency = Notification.Outline.Transparency
        
    
    Notification.Accent.Size = Vector2.new(Notification.Frame.Size.X, 1)
    Notification.Accent.Position = Vector2.new(Notification.Frame.Position.X, Notification.Frame.Position.Y)
    Notification.Accent.Transparency = Notification.Outline.Transparency
    
    
    Notification.Title.Position = Vector2.new(Notification.Frame.Position.X + 4, Notification.Frame.Position.Y + 8)
    Notification.Title.Transparency = Notification.Outline.Transparency
    
    function fade(Speed,In,Out)
        local fade = coroutine.create(function()
            if Out == true then 
                for count = 100, 1, -1 do
                    task.wait(Speed/100)
                        Notification.Outline.Transparency = count/100
                        for i,v in pairs(Notification) do 
                            v.Transparency = Notification.Outline.Transparency
                        end 
                end
                
                for i,v in pairs(Notification) do 
                    v.Transparency = 0
                end 
                
                for i,v in pairs(Notification) do 
                    v:Remove()
                end 
                
                table.remove(Current ,#Current)
            end 
            
            if In == true then 
                 for count = 1, 100, 1 do
                    task.wait(Speed/100)
                    Notification.Outline.Transparency = count/100
                 end
            
                for i,v in pairs(Notification) do 
                    v.Transparency = 0
                end 
                
                for i,v in pairs(Notification) do 
                    v:Remove()
                end 
                table.remove(Current ,#Current)
            end 
        end) 
        
        coroutine.resume(fade)
    end
    
    
    
    
    fade(Time,false,true)
end 


if writefile and isfile and delfile then 
    if isfile("Osiris Config Folder/Image.txt") then 
        Notif("READ PLEASE!\nYou've been detected as having `Image.txt`\ninside your config folder\nthis may have caused bugs!",5,Color3.fromRGB(20,20,255))
        delfile("Osiris Config Folder/Image.txt")
    end 
end  


local menu
do


    
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/f1nobe7650/other/main/uis/cripware"))()

    local menu = library.new("Osiris", "Osiris Config Folder\\")
        local tabs = {
        menu.new_tab("rbxassetid://7300477598"),
        menu.new_tab("rbxassetid://7300535052"),
        menu.new_tab("rbxassetid://7300480952"),        
        menu.new_tab("rbxassetid://7300486042"),
        menu.new_tab("rbxassetid://7300489566"),
    }


    do


        local _menu = tabs[5].new_section("menu")

        local all_cfgs

        local configs = _menu.new_sector("configs")
        local text
        local list = configs.element("Scroll", "config list", {options = {"none"}}, function(State)
            text:set_value({Text = State.Scroll})
        end)
        text = configs.element("TextBox", "config name")
        configs.element("Button", "save", nil, function()
            if menu.values[5].menu.configs["config name"].Text ~= "none" then
                menu.save_cfg(menu.values[5].menu.configs["config name"].Text)
            end
        end)
        configs.element("Button", "load", nil, function()
            if menu.values[5].menu.configs["config name"].Text ~= "none" then
                menu.load_cfg(menu.values[5].menu.configs["config name"].Text)
            end
        end)

        local function update_cfgs()
            all_cfgs = listfiles("Osiris Config Folder\\")
            for _,cfg in next, all_cfgs do
                all_cfgs[_] = string.gsub(string.gsub(cfg, "Osiris Config Folder\\", ""), ".txt", "")
                list:add_value(all_cfgs[_])
            end
        end 
        update_cfgs()

        LPH_JIT_MAX(function()
        task.spawn(function()
            while true do
                task.wait(1)
                update_cfgs()
            end
        end)
    end)() 
        

        local Settings = _menu.new_sector("Settings","Right")
        Settings.element("Toggle", "Watermark", {}, function()
            for i,v in pairs(Watermark) do 
                v.Visible = menu.values[5].menu.Settings["Watermark"].Toggle 
            end 
        end):add_color(nil, false, function()
            Watermark.Accent.Color = menu.values[5].menu.Settings["$Watermark"].Color
        end)
        Settings.element("Slider", "Position: X", {default = {min = 0, max = Camera.ViewportSize.X, default = 22}})
        Settings.element("Slider", "Position: Y", {default = {min = 0, max = Camera.ViewportSize.Y, default = 41}})

        Settings.element("TextBox", "Cheat Name",{default="{cheatname} | {fps} | {game} | {name}"}, function()
            
        end)    
    end



        local aimbot = tabs[1].new_section("main")





        --// Main 
        ---------------------------------------------------------------------------------------

        local main = aimbot.new_sector("aimbot","Left")

        main.element("Toggle", "Enabled"):add_keybind({Type = "Always"}, function()

            if menu.values[1].main["aimbot"]["Enabled"].Toggle == false or not menu.values[1].main["aimbot"]["$Enabled"].Active then 
                getgenv().CTarget = nil
            end 

            if menu.values[1].main["aimbot"]["Enabled"].Toggle then 
                if menu.values[1].main["aimbot"]["$Enabled"].Active then 
                    local shortestDistance = math.huge
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                        local pos, Onscreen = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                        local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                            if magnitude < shortestDistance and Onscreen then
                                getgenv().CTarget = v
                                shortestDistance = magnitude 
                            end
                        end
                    end
                end 
            end 
        end)

        main.element("Dropdown", "Type", {options = {"Camera", "Cursor"}})

        main.element("TextBox", "Prediction",{}, function()
        end)
        

        --main.element("Toggle", "Resolver")
        main.element("Slider", "Smoothness", {default = {min = 0, max = 100, default = 3}}, function()
            Smoothness = 100 - menu.values[1].main["aimbot"]["Smoothness"].Slider
        end)
        main.element("Dropdown", "BodyPart", {options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}})

        function getclosest()
            local mouse = LocalPlayer:GetMouse()
            local x,y = mouse.X, mouse.Y
            local closestPlayer = nil
            local shortestDistance = math.huge
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
             if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
                       local pos = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                       local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(x, y)).magnitude
                       if magnitude < shortestDistance and v.Character.Humanoid.Health > 0 then
                           closestPlayer = v
                           shortestDistance = magnitude
                end
              end
            end
            return closestPlayer
           end 

        getgenv().Target = nil

        local target_aim = aimbot.new_sector("silent aimbot","Right")
        target_aim.element("Toggle", "Enabled"):add_keybind(nil, function(a)
            
        if menu.values[1].main["silent aimbot"]["Type"].Dropdown == "Target" then 
        if not menu.values[1].main["silent aimbot"]["$Enabled"].Active or not menu.values[1].main["silent aimbot"]["Enabled"].Toggle or menu.values[1].main["silent aimbot"]["Type"].Dropdown ~= "Target" then 
            getgenv().Target = nil  
        end 

        if menu.values[1].main["silent aimbot"]["$Enabled"].Active == true and menu.values[1].main["silent aimbot"]["Enabled"].Toggle then 
            getgenv().Target = getclosest()

            if menu.values[1].main["silent aimbot"]["Notifications"].Toggle then 
                if getgenv().Target ~= nil then 
                    Notif("Locked Onto: " .. getgenv().Target.Name .."!",3,menu.values[1].main["silent aimbot"]["$Notifications"].Color)
                end 
            end 

            if table.find(menu.values[1].main["silent aimbot"]["Checks"].Combo, "View Target") then 
                game.Workspace.Camera.CameraSubject = getgenv().Target.Character.Humanoid
            end 

        else 
            game.Workspace.Camera.CameraSubject = LocalPlayer.Character.Humanoid

            if menu.values[1].main["silent aimbot"]["Gun TP"].Toggle then 
                LocalPlayer.Character.RightHand.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            end 
        end 
    end 
end)





        local TargetPart = Instance.new("Part")
        --// LocalPlayer.Character.HumanoidRootPart.Size.X * 3 ,5,LocalPlayer.Character.HumanoidRootPart.Size.X * 3
        TargetPart.Anchored = false 
        TargetPart.CanCollide = false 
        TargetPart.Position = LocalPlayer.Character.HumanoidRootPart.Position
        TargetPart.Parent = game.Workspace
        TargetPart.Material = Enum.Material.Neon
        TargetPart.Shape = Enum.PartType.Block 
        TargetPart.Transparency = 0.8  
        TargetPart.Color = Color3.fromRGB(255,255,255)


        target_aim.element("TextBox", "Prediction",{}, function()
        end)
        target_aim.element("Toggle", "Auto Prediction")

        target_aim.element("TextBox", "Offset")

        --target_aim.element("Toggle", "Resolver")
        target_aim.element("Toggle", "LookAt")
        target_aim.element("Toggle", "Notifications"):add_color() 

        target_aim.element("Type", "Type", {options = {"Cursor", "Character"}})
        target_aim.element("Dropdown", "Type", {options = {"Silent Aim", "Target", "RageBot"}})

        target_aim.element("Combo", "Checks", {options = {"Wall Check", "Knock Check", "Friend Check", "View Target"}})

        target_aim.element("Dropdown", "HitPart", {options = {"Head", "HumanoidRootPart", "LowerTorso", "UpperTorso"}})

        target_aim.element("Slider", "Hit Chance", {default = {min = 0, max = 100, default = 100}}) 

        target_aim.element("Toggle", "Part Enabled"):add_color(nil, true, function()
            TargetPart.Color = menu.values[1].main["silent aimbot"]["$Part Enabled"].Color
            TargetPart.Transparency = menu.values[1].main["silent aimbot"]["$Part Enabled"].Transparency
        end)

        target_aim.element("Dropdown", "Part Type", {options = {"Bubble", "Fake HitBox", "Box"}}, function()
            if menu.values[1].main["silent aimbot"]["Part Type"].Dropdown == "Bubble" then 
                TargetPart.Material = Enum.Material.ForceField 
                TargetPart.Shape = Enum.PartType.Ball
            elseif menu.values[1].main["silent aimbot"]["Part Type"].Dropdown == "Fake HitBox" then 
                TargetPart.Material = Enum.Material.Neon
                TargetPart.Shape = Enum.PartType.Block  
                TargetPart.Transparency = 0.8 
                TargetPart.Size = Vector3.new(4,5,4)
            elseif menu.values[1].main["silent aimbot"]["Part Type"].Dropdown == "Box" then 
                TargetPart.Material = Enum.Material.Neon
                TargetPart.Shape = Enum.PartType.Block 
                TargetPart.Transparency = 0.8  
            end 
        end)

        target_aim.element("Slider", "Part Size", {default = {min = 0, max = 10, default = 3}}, function()
            if menu.values[1].main["silent aimbot"]["Part Type"].Dropdown == "Bubble" or "Box" then
                TargetPart.Size = Vector3.new(menu.values[1].main["silent aimbot"]["Part Size"].Slider,menu.values[1].main["silent aimbot"]["Part Size"].Slider,menu.values[1].main["silent aimbot"]["Part Size"].Slider)
            end 
        end)

        target_aim.element("Toggle", "Dot"):add_color(nil, true, function() 
            Dot.Color = menu.values[1].main["silent aimbot"]["$Dot"].Color
        end)

        target_aim.element("Toggle", "Lock Detector"):add_color(nil, true, function() 
            --//menu.values[1].main["silent aimbot"]["Lock Detector"].Toggle
            LockDetector.Color = menu.values[1].main["silent aimbot"]["$Lock Detector"].Color
        end)

        target_aim.element("Toggle", "Gun TP", {}, function()
            --//menu.values[1].main["silent aimbot"]["Gun TP"].Toggle
            if menu.values[1].main["silent aimbot"]["Gun TP"].Toggle then 
                LocalPlayer.Character.RightHand.RightWrist:Destroy()
                LocalPlayer.Character.RightHand.Transparency = 1
            end 
        end)


        function WallCheck(head)
        if not table.find(menu.values[1].main["silent aimbot"]["Checks"].Combo, "Wall Check") then return false end 
        if v == LocalPlayer then return false end
            local castPoints = {LocalPlayer.Character.Head.Position, head.Position}
            local ignoreList = {LocalPlayer.Character,head.Parent}
            a = workspace.CurrentCamera:GetPartsObscuringTarget(castPoints, ignoreList)
            if #a == 0 then return false end
            return true
        end 

        function KnockCheck(head)
            if not table.find(menu.values[1].main["silent aimbot"]["Checks"].Combo, "Knock Check") then return true end 

            if head.BodyEffects["K.O"].Value == true then 
                return false 
            else
                return true
            end 
        end 

        function HitChance()
            local random = math.random(1,100)

            if random <= menu.values[1].main["silent aimbot"]["Hit Chance"].Slider then 
                return true 
            else 
                return false 
            end 
        end 

        function FriendWith(Player) 
            if not table.find(menu.values[1].main["silent aimbot"]["Checks"].Combo, "Friend Check") then return true end 

            if Player:IsFriendsWith(LocalPlayer.UserId) then 
                return false 
            else 
                return true 
            end 
        end 
        
        local DrawingFov = Drawing.new("Circle")
        DrawingFov.Radius = 10 * 10 
        DrawingFov.Color = Color3.fromRGB(255,0,0)
        DrawingFov.Thickness = 1
        DrawingFov.Filled = false
        DrawingFov.Visible = false  
        DrawingFov.NumSides = 0


        function FOVCHECK(Player) 
            if DrawingFov.Visible == false then return true end 

            local FOVCheck = DrawingFov.Radius

            
            if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health ~= 0 and Player.Character:FindFirstChild("LowerTorso") then
            local pos = Camera:WorldToViewportPoint(Player.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                if magnitude < FOVCheck then
                    FOVCheck = magnitude 
                    return true 
                else 
                    return false 
                end
            end
        end 

        local fov_customization = aimbot.new_sector("Fov","Left")


        fov_customization.element("Toggle", "Enabled", {}, function()
            DrawingFov.Visible = menu.values[1].main["Fov"]["Enabled"].Toggle
        end):add_color({Transparency = 0.5, Color = Color3.fromRGB(255,0,0)}, true, function()
            DrawingFov.Color = menu.values[1].main["Fov"]["$Enabled"].Color
            DrawingFov.Transparency = menu.values[1].main["Fov"]["$Enabled"].Transparency
        end)

        fov_customization.element("Slider", "Thickness", {default = {min = 1, max = 10, default = 1}}, function() DrawingFov.Thickness = menu.values[1].main["Fov"]["Thickness"].Slider end)

        fov_customization.element("Slider", "Radius", {default = {min = 0, max = 100, default = 10}}, function() DrawingFov.Radius = menu.values[1].main["Fov"]["Radius"].Slider * 10  end)

        fov_customization.element("Slider", "Sides", {default = {min = 0, max = 20, default = 0}} , function()
            DrawingFov.NumSides = menu.values[1].main["Fov"]["Sides"].Slider
        end)

        fov_customization.element("Toggle", "Fill", {} , function()
            DrawingFov.Filled = menu.values[1].main["Fov"]["Fill"].Toggle
        end)





        local tracer_customization = aimbot.new_sector("Tracer","Left")

        local Tracer = Drawing.new("Line")
        Tracer.Visible = false 
        Tracer.Color = Color3.fromRGB(255,0,0)
        Tracer.Thickness = 1



        tracer_customization.element("Toggle", "Enabled"):add_color(nil, true, function()
            Tracer.Color = menu.values[1].main["Tracer"]["$Enabled"].Color
            Tracer.Transparency = menu.values[1].main["Tracer"]["$Enabled"].Transparency
        end)

        tracer_customization.element("Slider", "Thickness", {default = {min = 0, max = 10, default = 10}}, function()
            Tracer.Thickness = menu.values[1].main["Tracer"]["Thickness"].Slider / 2
        end)
        ---------------------------------------------------------------------------------------



        ----------------------------------------------------------------------------------------
        --// RESOLVER TAB

        --[[
        Resolver Values:
        menu.values[1].main["Resolver"]["Enabled"].Toggle
        menu.values[1].main["Resolver"]["Manual"].Toggle
        menu.values[1].main["Resolver"]["For"].Combo
        menu.values[1].main["Resolver"]["Prediction"].Text
        menu.values[1].main["Resolver"]["Type"].Dropdown

        menu.values[1].main["Resolver"]["X"].Slider
        menu.values[1].main["Resolver"]["Y"].Slider
        menu.values[1].main["Resolver"]["Z"].Slider

        if menu.values[1].main["Resolver"]["Enabled"].Toggle and table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and menu.values[1].main["Resolver"]["$Enabled"].Active then
        ]]
        local Resolver = aimbot.new_sector("Resolver","Right")

        Resolver.element("Toggle", "Enabled"):add_keybind()
        Resolver.element("Combo", "For", {options = {"Camlock", "Target Aim"}})
        Resolver.element("TextBox", "Prediction")



        --// Anti Aim Tab
        local antiaim = tabs[1].new_section("antiaim")

        --// Desync
        local desync = antiaim.new_sector("Desync","Left")

        desync.element("Toggle", "Enabled", {}, function()
            if menu.values[1]["antiaim"]["Desync"]["Enabled"].Toggle == false then 
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end 

            if menu.values[1]["antiaim"]["Desync"]["Visualize"].Toggle then 
                Visualize.Visible = menu.values[1]["antiaim"]["Desync"]["$Enabled"].Active
            end 
        end):add_keybind(nil, function()
            if menu.values[1]["antiaim"]["Desync"]["Enabled"].Toggle == false then 
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            end 

            if menu.values[1]["antiaim"]["Desync"]["Visualize"].Toggle then 
                Visualize.Visible = menu.values[1]["antiaim"]["Desync"]["$Enabled"].Active
            end 
        end)
        desync.element("Toggle", "Visualize", {}, function()
        Visualize.Visible = menu.values[1]["antiaim"]["Desync"]["Visualize"].Toggle
        end):add_color(nil, true, function()
            Visualize.Color = menu.values[1]["antiaim"]["Desync"]["$Visualize"].Color
            Visualize.Transparency = 1 - menu.values[1]["antiaim"]["Desync"]["$Visualize"].Transparency
        end)

        Visualize.Color = menu.values[1]["antiaim"]["Desync"]["$Visualize"].Color
        Visualize.Transparency = 1 - menu.values[1]["antiaim"]["Desync"]["$Visualize"].Transparency

        desync.element("Dropdown", "Mode", {options = {"Disable Prediction", "Manual", "Teleport Random", "Unhittable"}})

        desync.element("Slider", "X", {default = {min = -50, max = 50, default = 0}})
        desync.element("Slider", "Y", {default = {min = -50, max = 50, default = 0}})
        desync.element("Slider", "Z", {default = {min = -50, max = 50, default = 0}})
        

        desync.element("Slider", "Random Power", {default = {min = 0, max = 50, default = 0}})


        local desyncsettings = antiaim.new_sector("CFrame Desync","Right")

        desyncsettings.element("Toggle", "Enabled", {}, function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().OldPosition 
            for i,v in next, Visualizecframe:GetChildren() do 
                if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle and not menu.values[1]["antiaim"]["CFrame Desync"]["Enabled"].Toggle  then 
                    v.Transparency = 1 
                elseif menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle and menu.values[1]["antiaim"]["CFrame Desync"]["Enabled"].Toggle then 
                    v.Transparency = menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Transparency
                end 
            end
        end):add_keybind(nil, function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().OldPosition 
            for i,v in next, Visualizecframe:GetChildren() do 
                if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle and not menu.values[1]["antiaim"]["CFrame Desync"]["$Enabled"].Active then 
                    v.Transparency = 1 
                elseif menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle and menu.values[1]["antiaim"]["CFrame Desync"]["$Enabled"].Active then 
                    v.Transparency = menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Transparency
                end 
            end
        end)


        local function VisualizerColor(Color,Transparency)
            for i,v in next, Visualizecframe:GetChildren() do 
                v.Color = Color
                v.Transparency = Transparency
            end
        end 

        desyncsettings.element("Toggle", "Visualize", {}, function()
            for i,v in next, Visualizecframe:GetChildren() do 
                if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                    v.Transparency = menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Transparency 
                else 
                    v.Transparency = 1
                end 
            end
        end):add_color(nil, true, function()
            VisualizerColor(menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Color,menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Transparency)
        end)

        for i,v in next, Visualizecframe:GetChildren() do 
            v.CanCollide = false 
            v.Transparency = menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Transparency
            v.Color = menu.values[1]["antiaim"]["CFrame Desync"]["$Visualize"].Color
        end 

        desyncsettings.element("Dropdown", "Mode", {options = {"Nothing", "Random", "Floor Plant", "Upside Down","Sine"}})

        desyncsettings.element("Toggle", "Manual")
        desyncsettings.element("Slider", "X", {default = {min = -50, max = 50, default = 0}})
        desyncsettings.element("Slider", "Y", {default = {min = -50, max = 50, default = 0}})
        desyncsettings.element("Slider", "Z", {default = {min = -50, max = 50, default = 0}})
        desyncsettings.element("Slider", "Rotation X", {default = {min = -360, max = 360, default = 0}})
        desyncsettings.element("Slider", "Rotation Y", {default = {min = -360, max = 360, default = 0}})
        desyncsettings.element("Slider", "Rotation Z", {default = {min = -360, max = 360, default = 0}})


        desyncsettings.element("Slider", "Random Power", {default = {min = 0, max = 50, default = 0}})
        desyncsettings.element("Slider", "Sine Speed", {default = {min = 1, max = 5, default = 1}})

        local FakeLagFolder = Instance.new("Folder")
        FakeLagFolder.Parent = game.Workspace

        --// Fake lag
        local fake_lag = antiaim.new_sector("Fake Lag","Left")
        fake_lag.element("Toggle", "Enabled", {} , function()
        end):add_keybind(nil)

        LPH_JIT_MAX(function() 
        task.spawn(function()
            while true do 
                task.wait()
                if menu.values[1]["antiaim"]["Fake Lag"]["Enabled"].Toggle and LocalPlayer.Character then 
                    sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
                    task.wait(menu.values[1]["antiaim"]["Fake Lag"]["Delay"].Slider/10)
                    sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
                end 
            end 
        end)
        fake_lag.element("Slider", "Delay", {default = {min = 0, max = 20, default = 2}})
    end)() 



        local Angles = antiaim.new_sector("Angles","Right")
        Angles.element("Toggle", "SpinBot", {} , function()
            if not menu.values[1]["antiaim"]["Angles"]["SpinBot"].Toggle then
                LocalPlayer.Character.Humanoid.AutoRotate = true
            end 
        end):add_keybind(nil)
        Angles.element("Slider", "Speed", {default = {min = 0, max = 360, default = 0}})


        --// Movement
        local MovementSection = tabs[2].new_section("Movement")
        local Movement = MovementSection.new_sector("Movement","Left")

        Movement.element("Toggle", "Enabled", {}, function()
        end):add_keybind(nil)

        Movement.element("Dropdown", "Type", {options = {"CFrame", "LookVector"}})
        Movement.element("Slider", "Speed", {default = {min = 0, max = 100, default = 0}})
        Movement.element("Toggle", "Infinite Jump", {}, function()

            if menu.values[2].Movement.Movement["Infinite Jump"].Toggle then 
                local InfJump = UserInputService.InputBegan:Connect(function(inp)
                        if inp.KeyCode == Enum.KeyCode.Space then 
                            if menu.values[2].Movement.Movement["Infinite Jump"].Toggle then 
                                LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                                LocalPlayer.Character.Humanoid.UseJumpPower = false
                            else 
                                InfJump:Disconnect()
                        end 
                    end 
                end)
            end 
        end)

        Movement.element("Toggle", "Macro", {}, function()
         end):add_keybind(nil)

        task.spawn(function()
            while true do 
                task.wait(0.020)
                if menu.values[2].Movement.Movement["$Macro"].Active and menu.values[2].Movement.Movement["Macro"].Toggle then 
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game) 
                    task.wait(0.020)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game) 
                end 
            end 
        end)


        --//if menu.values[2].Movement.Movement["$Fly"].Active and menu.values[2].Movement.Movement["Fly"].Toggle then  
        --// menu.values[2].Movement.Movement["Fly Speed"].Slider
        Movement.element("Toggle", "Fly", {}, function()
        end):add_keybind(nil)
        Movement.element("Slider", "Fly Speed", {default = {min = 0, max = 400, default = 50}})
        

        local TargetStrafe = MovementSection.new_sector("Target Strafe","Right")
        TargetStrafe.element("Toggle", "Enabled")
        TargetStrafe.element("Toggle", "Visualize"):add_color(nil, true, function()
            TargetStrafePart.Color = menu.values[2].Movement["Target Strafe"]["$Visualize"].Color 
            TargetStrafePart.Transparency = menu.values[2].Movement["Target Strafe"]["$Visualize"].Transparency 
        end)
        TargetStrafe.element("Slider", "Radius", {default = {min = 1, max = 50, default = 2}})
        TargetStrafe.element("Slider", "Speed", {default = {min = 1, max = 50, default = 2}})
        TargetStrafe.element("Slider", "Height", {default = {min = 0, max = 50, default = 0}})


        --// Esp
        local Visuals = tabs[3].new_section("Visuals")
        local ESP = Visuals.new_sector("ESP","Left")

        ESP.element("Toggle", "Enabled", {},function()
        end)

        ESP.element("Toggle", "Name"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Image Esp"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Box"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "BoxFill"):add_color({Color = Color3.fromRGB(255,255,255), Transparency = 0.25}, true)
        ESP.element("Toggle", "Health"):add_color({Color = Color3.fromRGB(0,255,0)}, false)
        ESP.element("Toggle", "Armor Bar"):add_color({Color = Color3.fromRGB(0,0,255)}, false)
        ESP.element("Toggle", "Health Number"):add_color({Color = Color3.fromRGB(0,255,0)}, false)
        ESP.element("Toggle", "Weapon"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Tracer"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Distance"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Angle"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESP.element("Toggle", "Arrow"):add_color({Color = Color3.fromRGB(255,255,255), Transparency = 0}, true)
        ESP.element("Combo", "Arrow Addons", {options = {"Distance", "Health Text"}})
        ESP.element("Toggle", "Chams", {}, function()
            if menu.values[3].Visuals["ESP"]["Chams"].Toggle then 
                for i,v in pairs(game.Players:GetPlayers()) do 
                    AddCham(v)
                    v.CharacterAdded:Connect(function(plr)
                        AddCham(game.Players[plr.Name])
                    end)
                end
            else 
                for i,v in pairs(game.Players:GetPlayers()) do 
                    RemoveCham(v)
                end
            end 
        end):add_color({Color = Color3.fromRGB(255, 20, 20), Transparency = 0.75}, true)


        ESP.element("Toggle", "Through Walls",{}, function()
            if menu.values[3].Visuals["ESP"]["Through Walls"].Toggle then 
                for i,v in pairs(game.Players:GetPlayers()) do 
                    AddCham(v)
                    v.CharacterAdded:Connect(function(plr)
                        AddCham(game.Players[plr.Name])
                    end)
                end
            else 
                for i,v in pairs(game.Players:GetPlayers()) do 
                    RemoveCham(v)
                end
            end 
        end):add_color({Color = Color3.fromRGB(255,255,255), Transparency = 0.5}, true, function()
            for i,v in pairs(game.Players:GetPlayers()) do 
                for m,n in next, v.Character do 
                    if n:IsA("BoxHandleAdornment") then 
                        n.Color3 = menu.values[3].Visuals["ESP"]["$Through Walls"].Color
                    end 
                end 
            end
        end)

        local ESPSettings = Visuals.new_sector("ESP Settings","Left")
        ESPSettings.element("Slider", "ESP Distance", {default = {min = 250, max = 15000, default = 15000}})
        ESPSettings.element("Toggle", "ESP Target"):add_color({Color = Color3.fromRGB(255,255,255)}, false)
        ESPSettings.element("Slider", "Arrow Radius", {default = {min = 100, max = 800, default = 100}})
        ESPSettings.element("Slider", "Arrow Size", {default = {min = 10, max = 100, default = 25}})
        ESPSettings.element("Toggle", "Arrow Pulse")
        ESPSettings.element("Slider", "Pulse Speed", {default = {min = 1, max = 5, default = 5}})

        local WorldVisuals = Visuals.new_sector("World","Right")

        _G.Ambient = game:GetService("Lighting").Ambient
        _G.OutdoorAmbient = game:GetService("Lighting").OutdoorAmbient
        _G.Tint = game:GetService("Lighting").ColorCorrection.TintColor
        WorldVisuals.element("Toggle", "Indoor Ambient", {},function()
            if menu.values[3].Visuals.World["Indoor Ambient"].Toggle then 
                game:GetService("Lighting").Ambient =  _G.Ambient
            else 
                game:GetService("Lighting").Ambient = Color3.fromRGB(255,255,255)
            end 
        end):add_color({Color = Color3.fromRGB(0,0,0)}, false, function()
            if menu.values[3].Visuals.World["Indoor Ambient"].Toggle then 
                _G.Ambient = menu.values[3].Visuals.World["$Indoor Ambient"].Color
                game:GetService("Lighting").Ambient = _G.Ambient
            end 
        end)

        WorldVisuals.element("Toggle", "Outdoor Ambient", {},function()
            if menu.values[3].Visuals.World["Outdoor Ambient"].Toggle then 
                game:GetService("Lighting").OutdoorAmbient =  _G.OutdoorAmbient
            else 
                game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(152, 152, 146)
            end 
        end):add_color({Color = Color3.fromRGB(0,0,0)}, false, function()
            if menu.values[3].Visuals.World["Outdoor Ambient"].Toggle then 
                _G.OutdoorAmbient = menu.values[3].Visuals.World["$Outdoor Ambient"].Color
                game:GetService("Lighting").OutdoorAmbient = _G.OutdoorAmbient
            end 
        end)

        

        WorldVisuals.element("Toggle", "Tint", {},function()
            if menu.values[3].Visuals.World["Tint"].Toggle then 
                game:GetService("Lighting").ColorCorrection.TintColor =  _G.Tint
            else 
                game:GetService("Lighting").ColorCorrection.TintColor = Color3.fromRGB(152, 152, 146)
            end 
        end):add_color({Color = Color3.fromRGB(0,0,0)}, false, function()
            if menu.values[3].Visuals.World["Tint"].Toggle then 
                _G.Tint = menu.values[3].Visuals.World["$Tint"].Color
                game:GetService("Lighting").ColorCorrection.TintColor = _G.Tint
            end 
        end)
        
        WorldVisuals.element("Slider", "Saturation", {default = {min = 0, max = 10, default = 0}},function(a)
            game:GetService("Lighting").ColorCorrection.Saturation = menu.values[3].Visuals.World["Saturation"].Slider/5
        end)

        local SkyBoxes = {
            ["Normal"] = {600886090,600830446,600831635,600832720,600833862,600835177},
            ["DoomSpire"] = {6050649245,6050664592,6050648475,6050644331,6050649718,6050650083},
            ["CatGirl"] = {444167615,444167615,444167615,444167615,444167615,444167615},
            ["Vibe"] = {1417494402,1417494030,1417494146,1417494253,1417494499,1417494643},
            ["Blue Aurora"] = {12063984,12064107,12064152,12064121,12064115,12064131},
            ["Purple Clouds"] = {151165191,151165214,151165197,151165224,151165206,151165227},
            ["Purple Nebula"] = {159454286,159454299,159454296,159454293,159454300,159454288},
            ["Twighlight"] = {264909758,264908339,264907909,264909420,264908886,264907379},
            ["Vivid Skies"] = {271042310,271042516,271077243,271042556,271042467,271077958},
            ["Purple and Blue"] = {149397684,149397692,149397686,149397697,149397688,149397702},
        }
        local Sky = game:GetService("Lighting"):FindFirstChildWhichIsA("Sky")

        WorldVisuals.element("Toggle", "Force Time")
        WorldVisuals.element("Slider", "Time", {default = {min = 0, max = 24, default = 12}})

       WorldVisuals.element("Dropdown", "Custom Skybox", {options = {"Normal", "DoomSpire", "CatGirl", "Vibe", "Blue Aurora","Purple Clouds","Purple Nebula","Purple and Blue","Vivid Skies","Twighlight"}}, function()
            Sky.SkyboxLf = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][1]..""
            Sky.SkyboxBk = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][2]..""
            Sky.SkyboxDn = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][3]..""
            Sky.SkyboxFt = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][4]..""
            Sky.SkyboxRt = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][5]..""
            Sky.SkyboxUp = "rbxassetid:// "..SkyBoxes[menu.values[3].Visuals.World["Custom Skybox"].Dropdown][6]..""
        end)

        local LocalVisuals = Visuals.new_sector("Local","Right")

        LocalVisuals.element("Toggle", "Halo", {},function()
            HeadVisual.Visible = menu.values[3].Visuals.Local["Halo"].Toggle 
            HeadVisual.Radius = 2
        end):add_color({Color = Color3.fromRGB(255,255,255)}, false, function()

        end)

        LocalVisuals.element("Toggle", "ForceField", {},function()
            for __,v in pairs(LocalPlayer.Character:GetDescendants()) do 
                if v:IsA("BasePart") then 
                    if v.Material == Enum.Material.ForceField then 
                        v.Material = Enum.Material.Plastic
                    end 
                end 
            end 
        end):add_color({Color = Color3.fromRGB(255,255,255)}, false, function()
        end)

        LocalVisuals.element("Toggle", "Highlight", {},function()
            if menu.values[3].Visuals.Local["Highlight"].Toggle then 
                local Highlight = Instance.new("Highlight")
                Highlight.Enabled = true
                Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                Highlight.FillColor = Color3.fromRGB(255,255,255)
                Highlight.OutlineColor = Color3.fromRGB(255,255,255)
                Highlight.FillTransparency = 0.5
                Highlight.Parent = LocalPlayer.Character
                Highlight.OutlineTransparency = 1

                local DeadLoop = LocalPlayer.Character.Humanoid.Died:Connect(function()
                    task.wait(7)
                    local Highlight = Instance.new("Highlight")
                    Highlight.Enabled = true
                    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    Highlight.FillColor = menu.values[3].Visuals.Local["$Highlight"].Color
                    Highlight.OutlineColor = menu.values[3].Visuals.Local["$Highlight Outline"].Color
                    Highlight.FillTransparency = menu.values[3].Visuals.Local["$Highlight"].Transparency
                    Highlight.Parent = LocalPlayer.Character
                    Highlight.OutlineTransparency = menu.values[3].Visuals.Local["$Highlight Outline"].Transparency
                end)
            else 
                if DeadLoop then 
                    DeadLoop:Disconnect()
                end 
                LocalPlayer.Character:FindFirstChild("Highlight"):Destroy()
            end 

        end):add_color({Color = Color3.fromRGB(255,255,255)}, true, function()
            LocalPlayer.Character:FindFirstChild("Highlight").FillColor = menu.values[3].Visuals.Local["$Highlight"].Color
            LocalPlayer.Character:FindFirstChild("Highlight").FillTransparency = menu.values[3].Visuals.Local["$Highlight"].Transparency
        end)

        LocalVisuals.element("Toggle", "Highlight Outline", {},function()
            if menu.values[3].Visuals.Local["Highlight Outline"].Toggle then 
                LocalPlayer.Character:FindFirstChild("Highlight").OutlineTransparency = 0.5
            end 
        end):add_color({Color = Color3.fromRGB(255,255,255)}, true, function()
            if menu.values[3].Visuals.Local["Highlight Outline"].Toggle then 
                LocalPlayer.Character:FindFirstChild("Highlight").OutlineColor = menu.values[3].Visuals.Local["$Highlight Outline"].Color
                LocalPlayer.Character:FindFirstChild("Highlight").OutlineTransparency = menu.values[3].Visuals.Local["$Highlight Outline"].Transparency
            end 
        end)

        function Weld(x,y)
            local W = Instance.new("Weld")
            W.Part0 = x
            W.Part1 = y
            local CJ = CFrame.new(x.Position)
            local C0 = x.CFrame:inverse()*CJ
            local C1 = y.CFrame:inverse()*CJ
            W.C0 = C0
            W.C1 = C1
            W.Parent = x
     end
        LocalVisuals.element("Toggle", "Custom Character", {},function()
            if menu.values[3].Visuals["Local"]["Custom Character"].Toggle then 
                for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
                    if v:IsA("BasePart") or v:IsA("Decal") then 
                        v.Transparency = 1 
                    end 
                end 
                
        getgenv().Custom = LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
        fuc:Destroy()
        wait(5)
        fuc = Instance.new("Part",workspace) 
        fuc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        fuc.CanCollide = false
        fuck = Instance.new("SpecialMesh")
        fuck.Parent = fuc
        fuck.MeshType ="FileMesh"
            if menu.values[3].Visuals["Local"]["Character"].Dropdown  == "AmongUs" then 
                fuck.Scale=Vector3.new(0.05,0.05,0.05) 
                fuck.TextureId="http://www.roblox.com/asset/?id=6686375937" 
                fuck.MeshId="http://www.roblox.com/asset/?id=6686375902"
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Stewie" then 
                fuck.Scale=Vector3.new(0.1,0.1,0.1) 
                fuck.TextureId="http://www.roblox.com/asset/?id=3692134820"
                fuck.MeshId="http://www.roblox.com/asset/?id=3692134742" 
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Sonic" then 
                fuck.Scale=Vector3.new(0.025,0.025,0.025) 
                fuck.TextureId="http://www.roblox.com/asset/?id=6901422268"
                fuck.MeshId="http://www.roblox.com/asset/?id=6901422170"
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Chicken" then     
                fuck.Scale=Vector3.new(3,3,3) 
                fuck.TextureId="http://www.roblox.com/asset/?id=2114220248" 
                fuck.MeshId="http://www.roblox.com/asset/?id=2114220154" 
        end 
        
            Weld(game.Players.LocalPlayer.Character.HumanoidRootPart,fuc)
        
            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
                if v:IsA("BasePart") or v:IsA("Decal") then 
                    v.Transparency = 1
                end 
            end 
        
        end)
                
                fuc = Instance.new("Part",workspace) 
                fuc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                fuc.CanCollide = false
                fuck = Instance.new("SpecialMesh")
                fuck.Parent = fuc
                fuck.MeshType = "FileMesh"
        
                if menu.values[3].Visuals["Local"]["Character"].Dropdown  == "AmongUs" then 
                fuck.Scale=Vector3.new(0.2,0.2,0.2) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=6686375937" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=6686375902" -- Mesh Id
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Stewie" then 
                fuck.Scale=Vector3.new(0.1,0.1,0.1) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=3692134820" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=3692134742" -- Mesh Id
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Sonic" then 
                fuck.Scale=Vector3.new(0.1,0.1,0.1) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=6901422268" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=6901422170"
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown  == "Chicken" then     
                fuck.Scale=Vector3.new(3,3,3) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=2114220248" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=2114220154" -- Mesh Id
            end 
        
                Weld(LocalPlayer.Character.HumanoidRootPart,fuc)
                else 
                    if fuc then 
                        fuc:Destroy()
                    end 
                
                for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
                    if v:IsA("BasePart") or v:IsA("Decal") and v.Name ~= "CUFF" then 
                        v.Transparency = 0
                    end 
                    
                    if v.Name == "CUFF" then 
                        v:Destroy()
                    end 
                end 
                
                
                for i,v in pairs(LocalPlayer.Character.BodyEffects.SpecialParts:GetDescendants()) do 
                    if v:IsA("BasePart") or v:IsA("Decal") then 
                        v.Transparency = 1
                    end 
                end 
                if getgenv().Custom then 
                    getgenv().Custom:Disconnect()
                end 
                LocalPlayer.Character.HumanoidRootPart.Transparency = 1
            end 
        end) 

        LocalVisuals.element("Dropdown", "Character", {options = {"Chicken","Sonic","Stewie","AmongUs"}}, function()
            if menu.values[3].Visuals["Local"]["Character"].Dropdown == "AmongUs" then 
                fuck.Scale=Vector3.new(0.2,0.2,0.2) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=6686375937" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=6686375902" -- Mesh Id
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown == "Stewie" then 
                fuck.Scale=Vector3.new(0.1,0.1,0.1) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=3692134820" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=3692134742" -- Mesh Id
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown == "Sonic" then 
                fuck.Scale=Vector3.new(0.25,0.25,0.25) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=6901422268" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=6901422170"
            elseif menu.values[3].Visuals["Local"]["Character"].Dropdown == "Chicken" then     
                fuck.Scale=Vector3.new(3,3,3) --sizerbxassetid://6901422268
                fuck.TextureId="http://www.roblox.com/asset/?id=2114220248" --Texture / Skin
                fuck.MeshId="http://www.roblox.com/asset/?id=2114220154" -- Mesh Id
            end 
        end)

local Miscallenous = tabs[4].new_section("Misc")


local Misc = Miscallenous.new_sector("Shit Talk","Left")


Misc.element("Toggle", "Enabled"):add_keybind(nil, function() end) 

Misc.element("Dropdown", "Type", {options = {"Chinese", "Main", "Emoji"}})
Misc.element("Slider", "Delay", {default = {min = 0, max = 30, default = 3}})

local RandomShitTalk = {
    [1] = {
			"but doctor prognosis: OWNED but doctor prognosis: OWNED but doctor prognosis: OWNED but doctor prognosis: OWNED but doctor prognosis: OWNED but doctor prognosis: OWNED ",
			"but doctor results: 🔥 but doctor results: 🔥 but doctor results: 🔥 but doctor results: 🔥 but doctor results: 🔥 but doctor results: 🔥 but doctor results: 🔥 " ,
			"looks like you need to talk to your doctor looks like you need to talk to your doctor looks like you need to talk to your doctor looks like you need to talk to your doctor ",
			"speak to your doctor about this one speak to your doctor about this one speak to your doctor about this one speak to your doctor about this one speak to your doctor about this one ",
			"but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED but analysis: PWNED ",
			"but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND but diagnosis: OWND ",
    },
    ["Chinese"] = {
			"音频少年公民记忆欲求无尽 heywe 僵尸强迫身体哑集中排水",
			"持有毁灭性的神经重景气游行脸红青铜色类别创意案",
			"诶比西迪伊艾弗吉艾尺艾杰开艾勒艾马艾娜哦屁吉吾",
			"完成与草屋两个苏巴完成与草屋两个苏巴完成与草屋",
			"庆崇你好我讨厌你愚蠢的母愚蠢的母庆崇",
			"坐下，一直保持着安静的状态。 谁把他拥有的东西给了他，所以他不那么爱欠债务，却拒  参加锻炼，这让他爱得更少了",
			"OSIRIS OSIRIS OSIRIS 他，所以他不那r给了他东西给了他爱欠s，却拒绝参加锻炼，这让他爱得更UGT少了",
			"他，所以他不那r给了他东西给了他爱欠s，却拒绝参加锻炼，这让他爱得更UGT少了",
			"有的东西给了他，所以他不那rblx trader captain么有的东西给了他爱欠绝参加锻squidward炼，务，却拒绝参加锻炼，这让他爱得更UGT少了",
			"wocky slush他爱欠债了他他squilliam拥有的东西给爱欠绝参加锻squidward炼",
			"坐下，一直保持着安静的状态 谁把他拥有的东西给了他，所以他不那rblx trader captain么有的东西给了他爱欠债了他他squilliam拥有的东西给爱欠绝参加锻squidward炼，务，却拒绝参加锻炼，这让他爱得更UGT少了",
			"免费手榴弹 hack绕过作弊工作DA HOOD roblox aimbot瞄准无声目标绕过2020工作真正免费下载和使用",
			"zal發明了roblox汽車貿易商的船長ro blocks，並將其洩漏到整個宇宙，還修補了虛假的角神模式和虛假的身體，還發明了基於速度的AUTOWALL和無限制的自動壁紙遊戲 ",
			"彼が誤って禁止されたためにファントムからautowallgamingを禁止解除する請願とそれはでたらめですそれはまったく意味がありませんなぜあなたは合法的なプレーヤーを禁止するのですか ",
			"ジェイソンは私が神に誓う女性的な男の子ではありません ",
			"傑森不是我向上帝發誓女性男孩 ",
	},
	["Emoji"] = {
			"🔥🔥🔥🔥🔥🔥🔥🔥",
			"😅😅😅😅😅😅😅😅",
			"😂😂😂😂😂😂😂😂",
			"😹😹😹😹😹😹😹😹",
			"😛😛😛😛😛😛😛😛",
			"🤩🤩🤩🤩🤩🤩🤩🤩",
			"🌈🌈🌈🌈🌈🌈🌈🌈",
			"😎😎😎😎😎😎😎😎",
			"🤠🤠🤠🤠🤠🤠🤠🤠",
			"😔😔😔😔😔😔😔😔",
		},
		["Main"] = {
			"brb taking a nap 💤💤💤 ",
			"gonna go take a walk 🚶‍♂️🚶‍♀️🚶‍♂️🚶‍♀️ ",
			"#osiris better XD .gg/dhmscript",
			"osiris user VV 😳😳😳",
		    "just a skill issue that you dont have osiris",
		    "mad cause no osiris LOL .gg/dhmscript",
		},
}

task.spawn(function()
    while wait(menu.values[4].Misc["Shit Talk"]["Delay"].Slider) do 
        if menu.values[4].Misc["Shit Talk"]["Enabled"].Toggle and menu.values[4].Misc["Shit Talk"]["$Enabled"].Active then 
            local RandomChat = math.random(0,#RandomShitTalk[menu.values[4].Misc["Shit Talk"]["Type"].Dropdown])
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(RandomShitTalk[menu.values[4].Misc["Shit Talk"]["Type"].Dropdown][RandomChat],"All")
        end 
    end 
end)

local Local = Miscallenous.new_sector("Local","Left")
Local.element("Toggle", "Remove Chairs", {}, function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Seat") then
            v.Disabled = menu.values[4].Misc["Local"]["Remove Chairs"].Toggle
        end
    end 
end)

Local.element("Toggle", "Infinite Zoom", {}, function()
    if menu.values[4].Misc["Local"]["Anti Stomp"].Toggle == true then
        LocalPlayer.CameraMaxZoomDistance = math.huge
    else 
        LocalPlayer.CameraMaxZoomDistance = 35
    end
end)

Local.element("Toggle", "Money Aura")
Local.element("Toggle", "Auto Stomp")
Local.element("Toggle", "Anti Stomp")
Local.element("Toggle", "Auto Reload")
Local.element("Toggle", "Auto Shoot"):add_keybind()
Local.element("Toggle", "Anti Bag")

Local.element("Toggle", "Remove Jump Cooldown", {}, function()
    LocalPlayer.Character.Humanoid.UseJumpPower = true 
end)

Local.element("Toggle", "Remove Snow", {}, function()
    LocalPlayer.PlayerGui.MainScreenGui.SNOWBALLFRAME.Visible = menu.values[4].Misc["Local"]["Remove Snow"].Toggle
    if menu.values[4].Misc["Local"]["Remove Snow"].Toggle then 
        workspace.Ignored.SnowBlock.Parent = ReplicatedStorage
    else
        if game.ReplicatedStorage:FindFirstChild("SnowBlock") then
        game.ReplicatedStorage.SnowBlock.Parent = workspace.Ignored
        end
    end 
end)

local Guns = Miscallenous.new_sector("Guns","Right")
Guns.element("Toggle", "Custom Gun SFX") -- menu.values[4].Misc["Guns"]["Custom Gun SFX"].Toggle
Guns.element("TextBox", "ID HERE",{}, function() -- menu.values[4].Misc["Guns"]["ID HERE"].Text
end)

--[[
    menu.values[4].Misc["Guns"]["Bullet Tracers"].Toggle
    menu.values[4].Misc["Guns"]["$Bullet Tracers"].Color
    menu.values[4].Misc["Guns"]["Asset ID"].Text
]]


local CustomCursor = Miscallenous.new_sector("Custom Cursor","Left")

--menu.values[4].Misc["Custom Cursor"]["Enabled"].Toggle


CustomCursor.element("Toggle", "Enabled", {}, function()
    for i,v in pairs(Cursor) do 
        v.Visible = menu.values[4].Misc["Custom Cursor"]["Enabled"].Toggle
    end

    game:GetService("UserInputService").OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
end)
:add_color(nil, false, function()
    for i,v in pairs(Cursor) do 
        v.Color = menu.values[4].Misc["Custom Cursor"]["$Enabled"].Color
    end 
end)



CustomCursor.element("Toggle", "Outline", {}, function()
    for i,v in pairs(CursorOutlines) do 
        v.Visible = menu.values[4].Misc["Custom Cursor"]["Outline"].Toggle
    end
end)

CustomCursor.element("Dropdown", "Position", {options = {"Follow Cursor", "Follow Tool"}})

CustomCursor.element("Slider", "Thickness", {default = {min = 0, max = 50, default = 1}}, function()
    for i,v in pairs(Cursor) do 
        v.Thickness = menu.values[4].Misc["Custom Cursor"]["Thickness"].Slider
    end 

    if menu.values[4].Misc["Custom Cursor"]["Outline"].Toggle then 
        for i,v in pairs(CursorOutlines) do 
            v.Thickness = menu.values[4].Misc["Custom Cursor"]["Thickness"].Slider * 3
        end 
    end 
end)
CustomCursor.element("Slider", "Size", {default = {min = 0, max = 50, default = 10}})
CustomCursor.element("Slider", "Gap", {default = {min = 0, max = 50, default = 8}})
CustomCursor.element("Slider", "Follow Gun Offset", {default = {min = 0, max = 50, default = 5}})


local GunsInShop = {
    "Silencer",
    "Revolver",
    "Double-Barrel",
    "Flamethrower",
    "Rifle",
    "Smg",
    "Shotgun",
    "DrumGun",
    "LMG",
    "AK47",
    "RPG",
}

local ActualGuns = {}
local ActualGunsPath = {}


if game.PlaceId == 2788229376 then 
    for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do 
        if v:IsA("Model") then 
            if not string.match(v.Name, "Ammo") then
                if not string.match(v.Name, "Phone") then 
                    if not string.match(v.Name, "Mask") then 
                        if not string.match(v.Name, "Weights") then 
                            table.insert(ActualGuns, v)
                        end 
                    end 
                end 
            end 
        end 
    end
end 
--//

local Buy = Miscallenous.new_sector("Auto Buy","Right")

local BuyList = Buy.element("Scroll", "Buys", {options = {"none"}}, function(State)

end)


Buy.element("Button", "Buy", nil, function()
    for i,b in pairs(ActualGuns) do 
        if string.match(tostring(b), menu.values[4].Misc["Auto Buy"]["Buys"].Scroll) then
            local OldPos = LocalPlayer.Character.HumanoidRootPart.CFrame

            LocalPlayer.Character.HumanoidRootPart.CFrame = b.Head.CFrame 
            wait(0.2)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            fireclickdetector(b.ClickDetector)
            wait(0.2)
            LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
        end 
    end 

    wait(1)

    for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetDescendants()) do 
        if string.match(v.Name, "Ammo") and string.match(v.Name, menu.values[4].Misc["Auto Buy"]["Buys"].Scroll) then
            if menu.values[4].Misc["Auto Buy"]["Buy Ammo"].Toggle then 
                for count = 1, menu.values[4].Misc["Auto Buy"]["Amount of times"].Slider, 1 do
                        local OldPos = LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(0.5)
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame 
                        wait(0.2)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        fireclickdetector(v.ClickDetector)
                        wait(0.2)
                        LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
                end
            end 
        end 
    end 
end) 

Buy.element("Toggle", "Buy Ammo")

Buy.element("Slider", "Amount of times", {default = {min = 1, max = 20, default = 1}})

for i,v in pairs(GunsInShop) do 
    for i,b in pairs(ActualGuns) do 
        if string.match(tostring(b), v) then
            BuyList:add_value(v)
            table.insert(ActualGunsPath, b)
        end 
    end 
end 



local TargetTab = Miscallenous.new_sector("Target","Right")

TargetTab.element("TextBox", "Name Here",{}, function()
    --//menu.values[4].Misc["Target"]["Name Here"].Text
end)

TargetTab.element("Button", "Goto", nil, function()
    for i,v in pairs(game.Players:GetPlayers()) do 
        if string.match(tostring(v), menu.values[4].Misc["Target"]["Name Here"].Text) then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        end
    end 
end)

TargetTab.element("Button", "Bring", nil, function()
for i,v in pairs(game.Players:GetPlayers()) do 
    if string.match(tostring(v), menu.values[4].Misc["Target"]["Name Here"].Text) then 
        local OldPos = LocalPlayer.Character.HumanoidRootPart.CFrame 
        LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].Head.CFrame 
        wait(0.1)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        wait(0.1)
        LocalPlayer.Backpack["[SledgeHammer]"].Parent = LocalPlayer.Character
        wait(0.1)
        LocalPlayer.Character["[SledgeHammer]"].Handle.Size = Vector3.new(5,5,5)
        wait(0.1)
        LocalPlayer.Character["[SledgeHammer]"]:Activate()
        wait(0.75)
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait(0.2)
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait(0.2)
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait(0.2)
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait(0.2)
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        wait(0.5)
        if v.Character.BodyEffects["K.O"].Value == true then  
            LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.UpperTorso.CFrame 
            wait(1)
            LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.UpperTorso.CFrame 
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "G", false, game)  
        end 
        LocalPlayer.Character["[SledgeHammer]"].Parent = LocalPlayer.Backpack 
        wait(1)
        for count = 100, 1, -5 do
            LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
        end 
    end 
end 
end) 


TargetTab.element("Toggle", "View", {}, function()
    if not menu.values[4].Misc["Target"]["View"].Toggle then 
        Camera.CameraSubject = LocalPlayer.Character.Humanoid
    end 

    if menu.values[4].Misc["Target"]["View"].Toggle then 
        for i,v in pairs(game.Players:GetPlayers()) do 
            if string.match(tostring(v), menu.values[4].Misc["Target"]["Name Here"].Text) then 
                Camera.CameraSubject = v.Character.Humanoid
            end
        end 
    end 
end)

TargetTab.element("Toggle", "HeadSit", {}, function()
end)

local PlayerDrawings = {}
local Utility        = {}
Utility.Settings = {
    Line = {
        Thickness = 1,
        Color = Color3.fromRGB(0, 255, 0)
    },
    Text = {
    
        Size = 13,
        Center = true,
        Outline = true,
        Font = Drawing.Fonts.Plex,
        Color = Color3.fromRGB(255, 255, 255)
    
    },
    Square = {
        Thickness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        Filled = false,
    },
    Triangle = {
        Color = Color3.fromRGB(255, 255, 255),
        Filled = true,
        Visible = false,
        Thickness = 1,
    },
}
function Utility.New(Type, Outline, Name, Filled)
    local drawing = Drawing.new(Type)
    for i, v in pairs(Utility.Settings[Type]) do
        drawing[i] = v
    end
    if Outline then
        drawing.Color = Color3.new(0,0,0)
        drawing.Thickness = 3
    end
    if Filled then 
        drawing.Filled = true 
    end 
    return drawing
end

function Utility.Add(Player)
    if not PlayerDrawings[Player] then
        PlayerDrawings[Player] = {
            Name = Utility.New("Text", nil, "Name",false),
            Tool = Utility.New("Text", nil, "Tool",false),
            BoxOutline = Utility.New("Square", true, "BoxOutline",false),
            Box = Utility.New("Square", nil, "Box",false),
            HealthOutline = Utility.New("Line", true, "HealthOutline",false),
            Health = Utility.New("Line", nil, "Health",false),
            HealthText = Utility.New("Text",nil,"HealthText",false),
            Tracers = Utility.New("Line", nil, "Tracers",false),
            BoxFill = Utility.New("Square", nil, "BoxFill",true),
            Distance = Utility.New("Text", nil, "Distance",false),
            ArmorBar = Utility.New("Line", nil, "ArmorBar", false),
            Angle = Utility.New("Line", nil, "Angle", false),
            ArrowOutline = Utility.New("Triangle", false, "ArrowOutline", false),
            Arrow = Utility.New("Triangle", nil, "Arrow", false),
            ArrowDistance = Utility.New("Text", nil, "ArrowDistance", false),
            ArrowHealth = Utility.New("Text", nil, "ArrowHealth", false),
        }
    end
end

function AddCham(Player)
    if Player ~= LocalPlayer and menu.values[3].Visuals["ESP"]["Chams"].Toggle then 
        for n,m in next, bodyParts do 
            if m ~= "HumanoidRootPart" then 
                if menu.values[3].Visuals["ESP"]["Chams"].Toggle then 
                Box1 = Instance.new("BoxHandleAdornment", Player.Character[m])
                Box1.Name = "Box1"
                Box1.AlwaysOnTop = false
                Box1.ZIndex = 1
                Box1.Color3 = menu.values[3].Visuals["ESP"]["$Chams"].Color
                Box1.Transparency = menu.values[3].Visuals["ESP"]["$Chams"].Transparency
                Box1.Size = Player.Character[m].Size + Vector3.new(0.2,0.2,0.2)
                Box1.Adornee = Player.Character[m]
                end 

                if menu.values[3].Visuals["ESP"]["Through Walls"].Toggle then 
                    Box2 = Instance.new("BoxHandleAdornment", Player.Character[m])
                    Box2.Name = "Box2"
                    Box2.AlwaysOnTop = true
                    Box2.ZIndex = 1
                    Box2.Color3 = menu.values[3].Visuals["ESP"]["$Through Walls"].Color
                    Box2.Transparency = menu.values[3].Visuals["ESP"]["$Through Walls"].Transparency
                    Box2.Size = Player.Character[m].Size + Vector3.new(0.1,0.1,0.1)
                    Box2.Adornee = Player.Character[m]
                end 
            end 
        end
    end 
end 


function RemoveCham(Player)
    if not menu.values[3].Visuals["ESP"]["Through Walls"].Toggle then 
        for i,v in pairs(Player.Character:GetDescendants()) do 
            if v:IsA("BoxHandleAdornment") and v.Name == "Box2" then 
                v:Destroy()
            end 
        end 
    end 

    if not menu.values[3].Visuals["ESP"]["Chams"].Toggle then 
        for i,v in pairs(Player.Character:GetDescendants()) do 
            if v:IsA("BoxHandleAdornment") and v.Name == "Box1" then 
                v:Destroy()
            end 
        end 
    end 
end 


for _,Player in pairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        Utility.Add(Player)

        if menu.values[3].Visuals["ESP"]["Chams"].Toggle then 
            AddCham(Player)
        end 

    end
end

for i,v in pairs(game.Players:GetPlayers()) do 
    AddCham(v)
    v.CharacterAdded:Connect(function(plr)
        task.wait(4)
        AddCham(game.Players[plr.Name])
    end)
end 

game.Players.PlayerAdded:Connect(function(player)
    task.wait(4)
    AddCham(player)
end) 

Players.PlayerAdded:Connect(Utility.Add)

Players.PlayerAdded:Connect(Utility.Add)
Players.PlayerRemoving:Connect(function(Player)
    if PlayerDrawings[Player] then
        for i,v in pairs(PlayerDrawings[Player]) do
            if v then 
                v:Remove()
            end 
        end 
        PlayerDrawings[Player] = nil
    end
end)



LPH_NO_VIRTUALIZE(function()
local ESPLoop = RunService:BindToRenderStep("updateESP", 205, function()

    for _,Player in pairs (Players:GetPlayers()) do
        local PlayerDrawing = PlayerDrawings[Player]
        if not PlayerDrawing then continue end


        for _,Drawing in pairs (PlayerDrawing) do
            Drawing.Visible = false
        end

        if not menu.values[3].Visuals.ESP["Enabled"].Toggle then
            return false
        end

        local Character = Player.Character
        local RootPart, Humanoid = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid")
        local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude

        if not Character or not RootPart or not Humanoid then continue end

        

        local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
        local AnglePos = Camera:WorldToViewportPoint(Character.Head.Position)
        local AngleExtend = Camera:WorldToViewportPoint(Character.Head.Position + Character.Head.CFrame.lookVector * 5)
        


        if not OnScreen then 
            if menu.values[3].Visuals.ESP["Arrow"].Toggle  then
                if menu.values[3].Visuals["ESP Settings"]["ESP Distance"].Slider < DistanceFromCharacter then continue end 
                --menu.values[3].Visuals.ESP["Arrow"].Toggle
                local Arrow          = PlayerDrawing.Arrow
                local ArrowDistance  = PlayerDrawing.ArrowDistance
                local ArrowOutline   = PlayerDrawing.ArrowOutline
                local ArrowHealth   = PlayerDrawing.ArrowHealth
                local viewportSize   = Camera.ViewportSize
    
                local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
                local objectSpacePoint = (CFrame.new().PointToObjectSpace(Camera.CFrame, RootPart.Position) * Vector3.new(1, 0, 1)).Unit
                local crossVector = Vector3.new().Cross(objectSpacePoint, Vector3.new(0, 1, 1))
                local rightVector = Vector2.new(crossVector.X, crossVector.Z) 
    
                local arrowRadius, arrowSize = menu.values[3].Visuals["ESP Settings"]["Arrow Radius"].Slider, menu.values[3].Visuals["ESP Settings"]["Arrow Size"].Slider
                local arrowPosition = screenCenter + Vector2.new(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius
                local arrowDirection = (arrowPosition - screenCenter).Unit
    
                local pointA, pointB, pointC = arrowPosition, screenCenter + arrowDirection * (arrowRadius - arrowSize) + rightVector * arrowSize, screenCenter + arrowDirection * (arrowRadius - arrowSize) + -rightVector * arrowSize
    
                Arrow.PointA = pointA 
                ArrowOutline.PointA = pointA 
                Arrow.PointB = pointB
                ArrowOutline.PointB = pointB 
                Arrow.PointC = pointC 
                ArrowOutline.PointC = pointC 
                Arrow.Color = menu.values[3].Visuals.ESP["$Arrow"].Color
                ArrowOutline.Color = Color3.fromRGB(0,0,0)
                Arrow.Visible = true
                ArrowOutline.Visible = true 
                Arrow.Filled = true
                ArrowOutline.Filled = false

                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Arrow.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end

    
                if table.find(menu.values[3].Visuals["ESP"]["Arrow Addons"].Combo, "Distance") then
                    ArrowDistance.Visible = true
                    ArrowDistance.Position = pointA + Vector2.new(0,20,0)--screenCenter + vec2(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius--arrowPosition + vec2(0,15,15)--pointC * 0.98 --screenCenter + vec2(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius * 0.94;
                    ArrowDistance.Text = ""..math.floor(DistanceFromCharacter).."m"
                    ArrowDistance.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                    ArrowDistance.Color = Color3.fromRGB(255,255,255)
                    ArrowDistance.Center = false
                    if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                        if Player == getgenv().Target or Player == getgenv().CTarget then  
                            ArrowDistance.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                        end 
                    end
                end

                if table.find(menu.values[3].Visuals["ESP"]["Arrow Addons"].Combo, "Health Text") then
                    ArrowHealth.Visible = true
                    ArrowHealth.Position = pointA + Vector2.new(0,30,0)--screenCenter + vec2(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius--arrowPosition + vec2(0,15,15)--pointC * 0.98 --screenCenter + vec2(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius * 0.94;
                    ArrowHealth.Text = ""..math.floor(Humanoid.Health).."%"
                    ArrowHealth.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                    ArrowHealth.Color = Color3.fromRGB(0,255,0)
                    ArrowHealth.Center = false
                end 
    


                if menu.values[3].Visuals["ESP Settings"]["Arrow Pulse"].Toggle then
                    Arrow.Transparency = (math.sin(tick() * menu.values[3].Visuals["ESP Settings"]["Pulse Speed"].Slider) + 1) / 2
                    ArrowOutline.Transparency = (math.sin(tick() * menu.values[3].Visuals["ESP Settings"]["Pulse Speed"].Slider) + 1) / 2
                    ArrowDistance.Transparency = (math.sin(tick() * menu.values[3].Visuals["ESP Settings"]["Pulse Speed"].Slider) + 1) / 2
                    ArrowHealth.Transparency = (math.sin(tick() * menu.values[3].Visuals["ESP Settings"]["Pulse Speed"].Slider) + 1) / 2
                else 
                    Arrow.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                    ArrowOutline.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                    ArrowHealth.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                    ArrowDistance.Transparency = 1 - menu.values[3].Visuals.ESP["$Arrow"].Transparency
                end

            end  
        end 
       

        if OnScreen then
if menu.values[3].Visuals["ESP Settings"]["ESP Distance"].Slider < DistanceFromCharacter then continue end 
            local Size           = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize        = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos         = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))
    
            local Name           = PlayerDrawing.Name
            local Tool           = PlayerDrawing.Tool
            local Box            = PlayerDrawing.Box
            local BoxOutline     = PlayerDrawing.BoxOutline
            local Health         = PlayerDrawing.Health
            local HealthOutline  = PlayerDrawing.HealthOutline
            local HealthText     = PlayerDrawing.HealthText
            local ArmorBar       = PlayerDrawing.ArmorBar
            local Tracers        = PlayerDrawing.Tracers 
            local BoxFill        = PlayerDrawing.BoxFill 
            local Distance       = PlayerDrawing.Distance
            local Angle          = PlayerDrawing.Angle 
            local Arrow          = PlayerDrawing.Arrow
            local ArrowDistance  = PlayerDrawing.ArrowDistance
            local ArrowOutline   = PlayerDrawing.ArrowOutline
            

            if menu.values[3].Visuals.ESP["Box"].Toggle then
                Box.Size = BoxSize
                Box.Position = BoxPos
                Box.Visible = true
                Box.Color = menu.values[3].Visuals.ESP["$Box"].Color
                BoxOutline.Size = BoxSize
                BoxOutline.Position = BoxPos
                BoxOutline.Visible = true


                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Box.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 
            end
    
            if menu.values[3].Visuals.ESP["Health"].Toggle then
                Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                Health.To = Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                Health.Color = menu.values[3].Visuals.ESP["$Health"].Color
                Health.Visible = true
    
                HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) -1)
                HealthOutline.Visible = true


                if Humanoid.Health > 75 then 
                    Health.Color = menu.values[3].Visuals.ESP["$Health"].Color
                    elseif Humanoid.Health  < 75 and Humanoid.Health > 25 then 
                        Health.Color = Color3.fromRGB(255, 165, 0)
                    elseif Humanoid.Health  < 25 then 
                        Health.Color = Color3.fromRGB(255, 0, 0)
                end 
            end

            if menu.values[3].Visuals.ESP["Armor Bar"].Toggle and menu.values[3].Visuals.ESP["Health"].Toggle then
                if Character and Character.BodyEffects:FindFirstChild("Armor") then 
                    ArmorBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    ArmorBar.To = Vector2.new(Health.From.X, Health.From.Y - (Character.BodyEffects.Armor.Value / 100) * BoxSize.Y)
                    ArmorBar.Color = menu.values[3].Visuals.ESP["$Armor Bar"].Color
                    ArmorBar.Visible = true
                end 
            end
    
            if menu.values[3].Visuals.ESP["Name"].Toggle then
                Name.Text = ""..Player.Name..""
                Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                Name.Color = menu.values[3].Visuals.ESP["$Name"].Color
                Name.Visible = true


                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Name.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 
            end

            if menu.values[3].Visuals.ESP["Angle"].Toggle then
                Angle.From = Vector2.new(AnglePos.X,AnglePos.Y)
                Angle.To = Vector2.new(AngleExtend.X,AngleExtend.Y)
                Angle.Visible = true 
                Angle.Color = menu.values[3].Visuals.ESP["$Angle"].Color

                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Angle.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end
            end 
    
            if menu.values[3].Visuals.ESP["Weapon"].Toggle then
                local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                local Equipped = Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name or "None"
                Tool.Text = ""..Equipped..""
                Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                Tool.Color = menu.values[3].Visuals.ESP["$Weapon"].Color
                Tool.Visible = true
                BottomOffset = BottomOffset + 15

                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Tool.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 
            end

            if menu.values[3].Visuals.ESP["Health Number"].Toggle then
                HealthText.Text = "".. math.floor(Humanoid.Health) .. ""

                if Humanoid.Health > 75 then 
                HealthText.Color = menu.values[3].Visuals.ESP["$Health Number"].Color
                elseif Humanoid.Health  < 75 and Humanoid.Health > 25 then 
                    HealthText.Color = Color3.fromRGB(255, 165, 0)
                elseif Humanoid.Health  < 25 then 
                    HealthText.Color = Color3.fromRGB(255, 0, 0)
                end 
                HealthText.Visible = true
                local HealthNumberPos = Vector2.new((BoxPos.X ), BoxPos.Y + BoxSize.Y)
                HealthText.Position = Vector2.new(HealthNumberPos.X - 18 , HealthNumberPos.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
            end 

            if menu.values[3].Visuals.ESP["Tracer"].Toggle then
                Tracers.From = Vector2.new(Mouse.X, Mouse.Y + 36)
                Tracers.To = Vector2.new(Pos.X, Pos.Y)
                Tracers.Color = menu.values[3].Visuals.ESP["$Tracer"].Color
                Tracers.Visible = true

                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Tracers.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 
            end 

            if menu.values[3].Visuals.ESP["BoxFill"].Toggle then 
                BoxFill.Size = BoxSize - Vector2.new(4.5, 4.5)
                BoxFill.Position = BoxPos + Vector2.new(2.25, 2.25)
                BoxFill.Visible = true
                BoxFill.Color = menu.values[3].Visuals.ESP["$BoxFill"].Color
                BoxFill.Transparency = menu.values[3].Visuals.ESP["$BoxFill"].Transparency 
                
                
                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        BoxFill.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 
            end 
     

            if menu.values[3].Visuals.ESP["Distance"].Toggle then
                local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                Distance.Text = ""..math.floor(DistanceFromCharacter).."m"
                if menu.values[3].Visuals.ESP["Weapon"].Toggle then 
                    Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset + 10)
                else 
                    Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                end 
                Distance.Color = menu.values[3].Visuals.ESP["$Weapon"].Color
                Distance.Visible = true
                BottomOffset = BottomOffset + 15

                if menu.values[3].Visuals["ESP Settings"]["ESP Target"].Toggle then 
                    if Player == getgenv().Target or Player == getgenv().CTarget then  
                        Distance.Color = menu.values[3].Visuals["ESP Settings"]["$ESP Target"].Color
                    end 
                end 

            end
        end
    end
end)
end)() 



menu.values[5].menu.Settings["Cheat Name"].Text = "Osiris"
LPH_NO_VIRTUALIZE(function()
    RunService.RenderStepped:Connect(function(fps)
    Watermark.Title.Text = (menu.values[5].menu.Settings["Cheat Name"].Text:gsub("{game}", game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name):gsub("{name}", LocalPlayer.Name):gsub("{fps}", "FPS: " .. math.floor(1/fps)):gsub("{cheatname}", "Osiris"):gsub("{time}", os.date("%b. %d, %Y")))
    Watermark.Outline.Size = Vector2.new(Watermark.Title.TextBounds.X + 13, 25)
    Watermark.Inline.Size = Vector2.new(Watermark.Outline.Size.X - 2, Watermark.Outline.Size.Y - 1)
    Watermark.Frame.Size = Vector2.new(Watermark.Inline.Size.X - 2, Watermark.Inline.Size.Y - 2)
    Watermark.Accent.Size = Vector2.new(Watermark.Frame.Size.X, 1)
    


    Watermark.Outline.Position = Vector2.new(menu.values[5].menu.Settings["Position: X"].Slider ,menu.values[5].menu.Settings["Position: Y"].Slider )
    Watermark.Inline.Position = Vector2.new(Watermark.Outline.Position.X + 1, Watermark.Outline.Position.Y + 1)
    Watermark.Frame.Position = Vector2.new(Watermark.Inline.Position.X + 1, Watermark.Inline.Position.Y + 1)
    Watermark.Accent.Position = Vector2.new(Watermark.Frame.Position.X, Watermark.Frame.Position.Y)
    Watermark.Title.Position = Vector2.new(Watermark.Frame.Position.X + 4, Watermark.Frame.Position.Y + 4)
end) 
end)() 

Angle = 0

LPH_JIT_MAX(function()
RunService.RenderStepped:Connect(function()
    for _, v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end

    if menu.values[4].Misc["Target"]["HeadSit"].Toggle then 
        for i,v in pairs(game.Players:GetPlayers()) do 
            if string.match(tostring(v), menu.values[4].Misc["Target"]["Name Here"].Text) then 
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame
                LocalPlayer.Character.Humanoid.Sit = true 
            end
        end 
    end 
    
if menu.values[4].Misc["Local"]["Anti Stomp"].Toggle then 
    if LocalPlayer.Character.Humanoid.Health < 5 then 
        for i,v in pairs(LocalPlayer.Character:GetDescendants()) do 
            if v:IsA("BasePart") then 
                v:Destroy()
            end 
        end  
    end    
end 

if menu.values[2].Movement["Target Strafe"]["Enabled"].Toggle and getgenv().Target ~= nil and menu.values[2].Movement["Target Strafe"]["Visualize"].Toggle then
    TargetStrafePart.CFrame = getgenv().Target.Character.HumanoidRootPart.CFrame
    TargetStrafePart.Size = Vector3.new(menu.values[2].Movement["Target Strafe"]["Radius"].Slider * 0.7, 2 , menu.values[2].Movement["Target Strafe"]["Radius"].Slider * 0.7)
else 
    TargetStrafePart.CFrame = CFrame.new(9999,9999,9999)
end 


if menu.values[4].Misc["Local"]["Anti Bag"].Toggle then 
    if LocalPlayer.Character:FindFirstChild("Christmas_Sock") ~= nil then 
        LocalPlayer.Character["Christmas_Sock"]:Destroy()
    end 
end 

if menu.values[4].Misc["Custom Cursor"]["Enabled"].Toggle then 
    

    if menu.values[4].Misc["Custom Cursor"]["Position"].Dropdown == "Follow Cursor" then 
        game:GetService("UserInputService").OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide

        for i,v in pairs(Cursor) do 
            v.Visible = true
        end 

        if menu.values[4].Misc["Custom Cursor"]["Outline"].Toggle then 
            for i,v in pairs(CursorOutlines) do 
                v.Visible = true
            end 
        end 

        Cursor.Line1.From = Vector2.new(Mouse.X + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5 , Mouse.Y + 36)
        Cursor.Line1.To = Vector2.new(Mouse.X + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5, Mouse.Y+ 36)
        Cursor.Line2.From = Vector2.new(Mouse.X - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Mouse.Y+ 36)
        Cursor.Line2.To = Vector2.new(Mouse.X - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5 , Mouse.Y+ 36)
        Cursor.Line3.From = Vector2.new(Mouse.X, Mouse.Y - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5 + 36)
        Cursor.Line3.To = Vector2.new(Mouse.X, Mouse.Y - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
        Cursor.Line4.From = Vector2.new(Mouse.X, Mouse.Y + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5+ 36)
        Cursor.Line4.To = Vector2.new(Mouse.X, Mouse.Y + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
        
        CursorOutlines.OutlineLine1.From = Vector2.new(Mouse.X + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Mouse.Y + 36)
        CursorOutlines.OutlineLine1.To = Vector2.new(Mouse.X + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5, Mouse.Y+ 36)
        CursorOutlines.OutlineLine2.From = Vector2.new(Mouse.X - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Mouse.Y+ 36)
        CursorOutlines.OutlineLine2.To = Vector2.new(Mouse.X - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5 , Mouse.Y+ 36)
        CursorOutlines.OutlineLine3.From = Vector2.new(Mouse.X, Mouse.Y - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5 + 36)
        CursorOutlines.OutlineLine3.To = Vector2.new(Mouse.X, Mouse.Y - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
        CursorOutlines.OutlineLine4.From = Vector2.new(Mouse.X, Mouse.Y + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5+ 36)
        CursorOutlines.OutlineLine4.To = Vector2.new(Mouse.X, Mouse.Y + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
    end 



    if menu.values[4].Misc["Custom Cursor"]["Position"].Dropdown == "Follow Tool" then 
        game:GetService("UserInputService").OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
        if LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then
            for i,v in pairs(Cursor) do 
                v.Visible = true
            end 

            if menu.values[4].Misc["Custom Cursor"]["Outline"].Toggle then 
                for i,v in pairs(CursorOutlines) do 
                    v.Visible = true
                end 
            end 

            local Tool2DPosition = Camera:WorldToScreenPoint(LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.Position + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * menu.values[4].Misc["Custom Cursor"]["Follow Gun Offset"].Slider)

            Cursor.Line1.From = Vector2.new(Tool2DPosition.X + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Tool2DPosition.Y + 36)
            Cursor.Line1.To = Vector2.new(Tool2DPosition.X + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5, Tool2DPosition.Y+ 36)
            Cursor.Line2.From = Vector2.new(Tool2DPosition.X - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Tool2DPosition.Y+ 36)
            Cursor.Line2.To = Vector2.new(Tool2DPosition.X - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5 , Tool2DPosition.Y+ 36)
            Cursor.Line3.From = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5 + 36)
            Cursor.Line3.To = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
            Cursor.Line4.From = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5+ 36)
            Cursor.Line4.To = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)

            CursorOutlines.OutlineLine1.From = Vector2.new(Tool2DPosition.X + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Tool2DPosition.Y + 36)
            CursorOutlines.OutlineLine1.To = Vector2.new(Tool2DPosition.X + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5, Tool2DPosition.Y+ 36)
            CursorOutlines.OutlineLine2.From = Vector2.new(Tool2DPosition.X - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5, Tool2DPosition.Y+ 36)
            CursorOutlines.OutlineLine2.To = Vector2.new(Tool2DPosition.X - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5 , Tool2DPosition.Y+ 36)
            CursorOutlines.OutlineLine3.From = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y - menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5 + 36)
            CursorOutlines.OutlineLine3.To = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y - menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
            CursorOutlines.OutlineLine4.From = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y + menu.values[4].Misc["Custom Cursor"]["Gap"].Slider * 5+ 36)
            CursorOutlines.OutlineLine4.To = Vector2.new(Tool2DPosition.X, Tool2DPosition.Y + menu.values[4].Misc["Custom Cursor"]["Size"].Slider * 5+ 36)
        else
            for i,v in pairs(Cursor) do 
                v.Visible = false
            end 

            for i,v in pairs(CursorOutlines) do 
                v.Visible = false
            end 
        end 
    end 

end 


if menu.values[4].Misc["Guns"]["Custom Gun SFX"].Toggle then 
    for i,v in pairs(LocalPlayer.Character:GetDescendants()) do 
        if v:IsA("Sound") and v.Name == "ShootSound" or v.Name == "MG" then 
            v.SoundId = "rbxassetid://"..menu.values[4].Misc["Guns"]["ID HERE"].Text..""
            v.Volume  = 10
        end 
    end 
end 

if menu.values[3].Visuals.World["Force Time"].Toggle then 
    game:GetService("Lighting").TimeOfDay = ""..menu.values[3].Visuals.World["Time"].Slider..":00:00"
end 

if menu.values[4].Misc["Local"]["Money Aura"].Toggle then 
    for i,v in pairs(game:GetService("Workspace").Ignored.Drop:GetDescendants()) do 
        if v.Name == "MoneyDrop" then 
            if (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 25 then 
                fireclickdetector(v.ClickDetector)
            end 
        end 
    end 
end 

if menu.values[4].Misc["Local"]["Auto Stomp"].Toggle then 
    game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
end 


if menu.values[4].Misc["Local"]["Auto Stomp"].Toggle then 
    if LocalPlayer.Character.Humanoid.Health < 5 then
        for i,v in pairs(LocalPlayer.Character:GetDescendants()) do 
            if v:IsA("BasePart") then 
                v:Destroy()
            end 
        end 
    end
end 

if menu.values[4].Misc["Local"]["Auto Reload"].Toggle then 
    if LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then
        if LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
            if LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                game:GetService("ReplicatedStorage").MainEvent:FireServer(
                "Reload",
                LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                )
            end
        end
    end
end 
    
if menu.values[1].main["silent aimbot"]["Auto Prediction"].Toggle then 
    local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local split = string.split(pingvalue,'(')
    local ping = tonumber(split[1])
    if ping < 130 then 
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.151
    elseif ping < 125 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.149
    elseif ping < 110 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.146
    elseif ping < 105 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.138
    elseif ping < 90 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.136
    elseif ping < 80 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.134379
    elseif ping < 70 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.129762
    elseif ping < 60 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.1248976
    elseif ping < 50 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.1245
    elseif ping < 40 then
        menu.values[1].main["silent aimbot"]["Prediction"].Text = 0.13232
            end 
end 

if menu.values[4].Misc["Local"]["Auto Shoot"].Toggle and menu.values[4].Misc["Local"]["$Auto Shoot"].Active then 
    if LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then
        LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() 
    end 
end

if menu.values[4].Misc["Local"]["Remove Jump Cooldown"].Toggle then 
    LocalPlayer.Character.Humanoid.UseJumpPower = false 
end 



if getgenv().Target ~= nil and menu.values[1].main["silent aimbot"]["Enabled"].Toggle then 
    --// Yes I added all these vars cause I had to make a list of if statements if I didnt :( 
    local FloorMaterial = getgenv().Target.Character.Humanoid.FloorMaterial
    local Resolver = menu.values[1].main["Resolver"]["Enabled"].Toggle 
    local ResolverActive = menu.values[1].main["Resolver"]["$Enabled"].Active 
    local Move_Direction = getgenv().Target.Character.Humanoid.MoveDirection 
    local TableResolver =  table.find(menu.values[1].main["Resolver"]["For"].Combo, "Target Aim")
    local HitPart = menu.values[1].main["silent aimbot"]["HitPart"].Dropdown
    local Resolver_Prediction = menu.values[1].main["Resolver"]["Prediction"].Text or 0
    local Jump_Offset = menu.values[1].main["silent aimbot"]["Offset"].Text or 0 
    local Prediction = menu.values[1].main["silent aimbot"]["Prediction"].Text or 0

    --// Not Resolver
    if not Resolver then 
        if not WallCheck(getgenv().Target.Character.Head) and FriendWith(getgenv().Target) and FOVCHECK(getgenv().Target) and HitChance() and FloorMaterial ~= Enum.Material.Air and not Resolver or not TableResolver or not ResolverActive then 
            print("Non Resolver No Jump")
            getgenv().Hit = getgenv().Target.Character[HitPart].CFrame + (getgenv().Target.Character.HumanoidRootPart.Velocity * Prediction)  
            print("1")              
        elseif not WallCheck(getgenv().Target.Character.Head) and FriendWith(getgenv().Target) and FOVCHECK(getgenv().Target) and HitChance() and FloorMaterial == Enum.Material.Air and not Resolver or not TableResolver or not ResolverActive then 
            print("Non Resolver w jump")
            getgenv().Hit = getgenv().Target.Character.LeftFoot.CFrame + (getgenv().Target.Character.HumanoidRootPart.Velocity * Prediction) + Vector3.new(0,Jump_Offset,0)                      
            print("2")
        end 
    end 

    if Resolver then 
        if not WallCheck(getgenv().Target.Character.Head) and FriendWith(getgenv().Target) and FOVCHECK(getgenv().Target) and HitChance() and FloorMaterial ~= Enum.Material.Air and Resolver and TableResolver and ResolverActive then 
            print("3")
            getgenv().Hit = getgenv().Target.Character[HitPart].CFrame + (Move_Direction * 19.64285714289 * Resolver_Prediction)                    
        elseif not WallCheck(getgenv().Target.Character.Head) and FriendWith(getgenv().Target) and FOVCHECK(getgenv().Target) and HitChance() and FloorMaterial == Enum.Material.Air and Resolver and TableResolver and ResolverActive then 
            print("4")
            getgenv().Hit = getgenv().Target.Character.LeftFoot.CFrame + (Move_Direction * 19.64285714289 * Resolver_Prediction)                    
        end 
    end 

    if not FOVCHECK(getgenv().Target) then 
        getgenv().Hit = nil 
    end 
end    


if menu.values[1].main["aimbot"]["Enabled"].Toggle and getgenv().CTarget ~= nil and menu.values[1].main["aimbot"]["$Enabled"].Active then 
    
    if menu.values[1].main["aimbot"]["Type"].Dropdown == "Camera" and not WallCheck(getgenv().CTarget.Character.Head) and FriendWith(getgenv().CTarget) and KnockCheck(getgenv().CTarget.Character) and FOVCHECK(getgenv().CTarget) then 
        
        getgenv().Main = CFrame.new(Camera.CFrame.p, getgenv().CTarget.Character[menu.values[1].main["aimbot"]["BodyPart"].Dropdown].Position + (getgenv().CTarget.Character.HumanoidRootPart.Velocity * menu.values[1].main["aimbot"]["Prediction"].Text))

        if menu.values[1].main["Resolver"]["Enabled"].Toggle and table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and menu.values[1].main["Resolver"]["$Enabled"].Active then
            getgenv().Main = CFrame.new(Camera.CFrame.p, getgenv().CTarget.Character[menu.values[1].main["aimbot"]["BodyPart"].Dropdown].Position + (getgenv().CTarget.Character.Humanoid.MoveDirection * menu.values[1].main["Resolver"]["Prediction"].Text))
        elseif menu.values[1].main["Resolver"]["Enabled"].Toggle and table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and menu.values[1].main["Resolver"]["$Enabled"].Active and menu.values[1].main["aimbot"]["Air Prediction"].Toggle and getgenv().CTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
            getgenv().Main = CFrame.new(Camera.CFrame.p, getgenv().CTarget.Character.LeftFoot.Dropdown.Position + (getgenv().CTarget.Character.Humanoid.MoveDirection * menu.values[1].main["Resolver"]["Prediction"].Text))
        elseif not menu.values[1].main["Resolver"]["Enabled"].Toggle and not table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and not menu.values[1].main["Resolver"]["$Enabled"].Active and not menu.values[1].main["aimbot"]["Air Prediction"].Toggle and getgenv().CTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
            CFrame.new(Camera.CFrame.p, getgenv().CTarget.Character.LeftFoot.Position + (getgenv().CTarget.Character.LeftFoot.Velocity * menu.values[1].main["aimbot"]["Prediction"].Text))
        end

        Camera.CFrame = Camera.CFrame:Lerp(getgenv().Main, Smoothness/ 100 , Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
    end 

    if menu.values[1].main["aimbot"]["Type"].Dropdown == "Cursor" and not WallCheck(getgenv().CTarget.Character.Head) and FriendWith(getgenv().CTarget) and KnockCheck(getgenv().CTarget.Character) and FOVCHECK(getgenv().CTarget) then 
        if menu.values[1].main["Resolver"]["Enabled"].Toggle and table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and menu.values[1].main["Resolver"]["$Enabled"].Active then
            local Main = Camera:WorldToScreenPoint(getgenv().CTarget.Character[menu.values[1].main["aimbot"]["BodyPart"].Dropdown].Position + (getgenv().CTarget.Character.Humanoid.MoveDirection * menu.values[1].main["Resolver"]["Prediction"].Text))
        elseif menu.values[1].main["Resolver"]["Enabled"].Toggle and not table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and not menu.values[1].main["Resolver"]["$Enabled"].Active then 
            local Main = Camera:WorldToScreenPoint(getgenv().CTarget.Character[menu.values[1].main["aimbot"]["BodyPart"].Dropdown].Position + (getgenv().CTarget.Character.HumanoidRootPart.Velocity * menu.values[1].main["aimbot"]["Prediction"].Text))
        elseif menu.values[1].main["Resolver"]["Enabled"].Toggle and not table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and not menu.values[1].main["Resolver"]["$Enabled"].Active and menu.values[1].main["aimbot"]["Air Prediction"].Toggle and getgenv().CTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
            local Main = Camera:WorldToScreenPoint(getgenv().CTarget.Character.LeftFoot.Position + (getgenv().CTarget.Character.LeftFoot.Velocity * menu.values[1].main["aimbot"]["Prediction"].Text))
        elseif menu.values[1].main["Resolver"]["Enabled"].Toggle and table.find(menu.values[1].main["Resolver"]["For"].Combo, "Camlock") and menu.values[1].main["Resolver"]["$Enabled"].Active and menu.values[1].main["aimbot"]["Air Prediction"].Toggle and getgenv().CTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
            local Main = Camera:WorldToScreenPoint(getgenv().CTarget.Character.LeftFoot.Position + (getgenv().CTarget.Character.Humanoid.MoveDirection * menu.values[1].main["Resolver"]["Prediction"].Text))
        end
        local Offset = Vector2.new(Main.X - Mouse.X,Main.Y - Mouse.Y)
        mousemoverel(Offset.X / (menu.values[1].main["aimbot"]["Smoothness"].Slider + 1), Offset.Y / (menu.values[1].main["aimbot"]["Smoothness"].Slider + 1))
    end 
end 
 
if menu.values[1].main["silent aimbot"]["Enabled"].Toggle and menu.values[1].main["silent aimbot"]["Type"].Dropdown == "RageBot" then 
    local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local split = string.split(pingvalue,'(')
    local ping = tonumber(split[1])

    if LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then
        if LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
            if LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value < 0.1 then
                game:GetService("ReplicatedStorage").MainEvent:FireServer(
                "Reload",
                LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                )
            end
        end
    end
    
    for _,q in pairs (game:GetService("Players"):GetPlayers()) do 
        if q  ~= LocalPlayer and q and q.Character then
            local RageBotD = (LocalPlayer.Character.HumanoidRootPart.Position - q.Character.HumanoidRootPart.Position).Magnitude
            if 200 > RageBotD  and not WallCheck(q.Character.Head) then 
                if q.Character.BodyEffects["K.O"].Value == false then 
                    getgenv().Target = q
                    if getgenv().Target ~= nil and LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil and ping < 200 then 
                        LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
                    end 
                end 
            end
        end
    end                    
end 



    if menu.values[1].main["silent aimbot"]["Enabled"].Toggle and menu.values[1].main["silent aimbot"]["Type"].Dropdown == "Silent Aim" then 
    local shortestDistance = math.huge 
        
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
        local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
        local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    getgenv().Target = v
                    shortestDistance = magnitude 
                end
            end
        end
    end 

    if DrawingFov.Visible then 
        DrawingFov.Position = Vector2.new(Mouse.X,Mouse.Y + 36)
    end

    if getgenv().Target ~= nil then 
        local ScreenPosition , OnScreen = Camera:WorldToViewportPoint(getgenv().Target.Character.HumanoidRootPart.Position + getgenv().Target.Character.HumanoidRootPart.Velocity * menu.values[1].main["silent aimbot"]["Prediction"].Text)
                
        if menu.values[1].main["silent aimbot"]["Dot"].Toggle and getgenv().Target ~= nil and OnScreen then 
            Dot.Position = Vector2.new(ScreenPosition.X,ScreenPosition.Y)
            Dot.Visible = true
        else 
            Dot.Visible = false 
        end 

        if menu.values[1].main["silent aimbot"]["Lock Detector"].Toggle and getgenv().Target.Character.BodyEffects.MousePos.Value ~= Vector3.new(0,0,0) and getgenv().Target.Character:FindFirstChildWhichIsA("Tool") ~= nil then 
            local Pos = Camera:WorldToViewportPoint(getgenv().Target.Character.BodyEffects.MousePos.Value)
            LockDetector.Position = Vector2.new(Pos.X,Pos.Y)
            LockDetector.Visible = true
        else 
            LockDetector.Visible = false
        end 

        if menu.values[1].main["silent aimbot"]["Gun TP"].Toggle then 
            LocalPlayer.Character.RightHand.CFrame = CFrame.new(getgenv().Target.Character.HumanoidRootPart.Position) * CFrame.new(0,5,0)
        end 


        if menu.values[1].main["Tracer"]["Enabled"].Toggle and getgenv().Target ~= nil then 
            local MyScreenPosition = Camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position)
            if OnScreen then 
                Tracer.Visible = true 
                Tracer.From = Vector2.new(ScreenPosition.X,ScreenPosition.Y)
                Tracer.To = Vector2.new(MyScreenPosition.X,MyScreenPosition.Y)
            else 
                Tracer.Visible = false
            end 
        end
        


        if menu.values[1].main["silent aimbot"]["Part Enabled"].Toggle then 
            TargetPart.CFrame = getgenv().Target.Character.HumanoidRootPart.CFrame
        end 


        if menu.values[1].main["silent aimbot"]["LookAt"].Toggle then 
            LocalPlayer.Character.Humanoid.AutoRotate = false 
            local OldCframe = LocalPlayer.Character.PrimaryPart
            local NearestRoot = getgenv().Target.Character.HumanoidRootPart
            local NearestPos = CFrame.new(LocalPlayer.Character.PrimaryPart.Position, Vector3.new(NearestRoot.Position.X, OldCframe.Position.Y, NearestRoot.Position.Z))
            LocalPlayer.Character:SetPrimaryPartCFrame(NearestPos)
        end 

    else 
        LockDetector.Visible = false
        if LocalPlayer.Character ~= nil then 
            LocalPlayer.Character.Humanoid.AutoRotate = true
        end 
        Tracer.Visible = false 
        TargetPart.CFrame = CFrame.new(9999,9999,9999)
        Dot.Visible = false
    end 


    if menu.values[3].Visuals.Local["Halo"].Toggle then 
        HeadVisual.Position = LocalPlayer.Character.Head.Position + Vector3.new(0,1,0)
        HeadVisual.Color = menu.values[3].Visuals.Local["$Halo"].Color
    end 

    if menu.values[3].Visuals.Local["ForceField"].Toggle then 
        for __,v in pairs(LocalPlayer.Character:GetDescendants()) do 
            if v:IsA("BasePart") then 
                if v.Material ~= Enum.Material.ForceField then 
                    v.Material = Enum.Material.ForceField
                    v.Color = menu.values[3].Visuals.Local["$ForceField"].Color
                end 

                if v.Color ~= menu.values[3].Visuals.Local["$ForceField"].Color then 
                    v.Color = menu.values[3].Visuals.Local["$ForceField"].Color
                end 
            end 
        end 
    end

    if menu.values[2].Movement.Movement["Enabled"].Toggle and menu.values[2].Movement.Movement["$Enabled"].Active then 
        if menu.values[2].Movement.Movement["Type"].Dropdown == "CFrame" then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * menu.values[2].Movement.Movement["Speed"].Slider / 15
        else 
            LocalPlayer.Character.HumanoidRootPart.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * menu.values[2].Movement.Movement["Speed"].Slider * 4
        end 
    end 

    if menu.values[2].Movement.Movement["$Fly"].Active and menu.values[2].Movement.Movement["Fly"].Toggle then  
        local FlyPosition = Vector3.new(0,0,0)
        local CCV = game.Workspace.CurrentCamera.CFrame.lookVector
    
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
		    FlyPosition = FlyPosition + CCV
        end
	
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
		    FlyPosition = FlyPosition - CCV
		end
    
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
		    FlyPosition = FlyPosition + Vector3.new(-CCV.Z, 0, CCV.X)
		end
	
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            FlyPosition = FlyPosition + Vector3.new(CCV.Z, 0, -CCV.x)
        end
        
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            FlyPosition = FlyPosition + Vector3.new(0, 1, 0)
        end
        
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            FlyPosition = FlyPosition - Vector3.new(0, 1, 0)
        end
        
        if FlyPosition.Unit.y == FlyPosition.Unit.y then
            LocalPlayer.Character.HumanoidRootPart.Anchored = false 
            LocalPlayer.Character.HumanoidRootPart.Velocity = FlyPosition.Unit * menu.values[2].Movement.Movement["Fly Speed"].Slider
        else 
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            LocalPlayer.Character.HumanoidRootPart.Anchored = true
        end 
    end 
    --// menu.values[2].Movement.Movement["Fly Speed"].Slider

    if menu.values[1]["antiaim"]["Angles"]["SpinBot"].Toggle then 
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(menu.values[1]["antiaim"]["Angles"]["Speed"].Slider / 7.234),0)
        LocalPlayer.Character.Humanoid.AutoRotate = false
    end 

   if menu.values[1]["antiaim"]["Desync"]["Visualize"].Toggle then 
        if getgenv().Visualizer ~= nil then 
            Visualize.Position = LocalPlayer.Character.HumanoidRootPart.Position + getgenv().Visualizer * 0.1413
        end 
    end
end)


RunService.heartbeat:Connect(function()
    getgenv().OldVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity
    getgenv().OldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame

    if menu.values[2].Movement["Target Strafe"]["Enabled"].Toggle and getgenv().Target ~= nil then 
        Angle = Angle + menu.values[2].Movement["Target Strafe"]["Speed"].Slider
        LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().Target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Angle), 0) * CFrame.new(0, menu.values[2].Movement["Target Strafe"]["Height"].Slider, menu.values[2].Movement["Target Strafe"]["Radius"].Slider)
    end    

 


    if menu.values[1]["antiaim"]["CFrame Desync"]["Enabled"].Toggle and menu.values[1]["antiaim"]["CFrame Desync"]["$Enabled"].Active then 

        if menu.values[1]["antiaim"]["CFrame Desync"]["Manual"].Toggle then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(menu.values[1]["antiaim"]["CFrame Desync"]["X"].Slider,menu.values[1]["antiaim"]["CFrame Desync"]["Y"].Slider,menu.values[1]["antiaim"]["CFrame Desync"]["Z"].Slider) * CFrame.Angles(math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation X"].Slider),math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation Y"].Slider),math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation Z"].Slider))
            if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                Visualizecframe.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(menu.values[1]["antiaim"]["CFrame Desync"]["X"].Slider,menu.values[1]["antiaim"]["CFrame Desync"]["Y"].Slider,menu.values[1]["antiaim"]["CFrame Desync"]["Z"].Slider) * CFrame.Angles(math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation X"].Slider),math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation Y"].Slider),math.rad(menu.values[1]["antiaim"]["CFrame Desync"]["Rotation Z"].Slider))
            end 
        end 

        if menu.values[1]["antiaim"]["CFrame Desync"]["Mode"].Dropdown == "Random" then 
            local TargetPos = LocalPlayer.Character.HumanoidRootPart.Position
            local Random_CFrame = (CFrame.new(TargetPos) + Vector3.new(math.random(-menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider, menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider), math.random(-menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider, menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider), math.random(-menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider, menu.values[1]["antiaim"]["CFrame Desync"]["Random Power"].Slider))) * CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)))
            LocalPlayer.Character.HumanoidRootPart.CFrame = Random_CFrame 
            if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                Visualizecframe.HumanoidRootPart.CFrame = Random_CFrame
            end 
        end 

        if menu.values[1]["antiaim"]["CFrame Desync"]["Mode"].Dropdown == "Upside Down" then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0,math.rad(-180))
            if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                Visualizecframe.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            end 
        end 

        if menu.values[1]["antiaim"]["CFrame Desync"]["Mode"].Dropdown == "Floor Plant" then 
            local Floor_Plant = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-4,0) * CFrame.Angles(0,math.rad(math.random(1,360)),math.rad(-180))
            LocalPlayer.Character.HumanoidRootPart.CFrame = Floor_Plant
            if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                Visualizecframe.HumanoidRootPart.CFrame = Floor_Plant
            end 
        end 

        if menu.values[1]["antiaim"]["CFrame Desync"]["Mode"].Dropdown == "Sine" then 
            local Sine_Value = math.abs(math.sin(tick() * (menu.values[1]["antiaim"]["CFrame Desync"]["Sine Speed"].Slider/5)))
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(Sine_Value*360),math.rad(Sine_Value*360),math.rad(Sine_Value*360))
            if menu.values[1]["antiaim"]["CFrame Desync"]["Visualize"].Toggle then 
                Visualizecframe.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(Sine_Value*360),math.rad(Sine_Value*360),math.rad(Sine_Value*360))
            end 
        end 

    end 

    if menu.values[1]["antiaim"]["Desync"]["Enabled"].Toggle and menu.values[1]["antiaim"]["Desync"]["$Enabled"].Active then 
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001,0)
        if menu.values[1]["antiaim"]["Desync"]["Mode"].Dropdown == "Manual" then 
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(menu.values[1]["antiaim"]["Desync"]["X"].Slider/2500,menu.values[1]["antiaim"]["Desync"]["Y"].Slider/2500,menu.values[1]["antiaim"]["Desync"]["Z"].Slider/2500) * 2^16
        elseif menu.values[1]["antiaim"]["Desync"]["Mode"].Dropdown == "Disable Prediction" then 
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        elseif menu.values[1]["antiaim"]["Desync"]["Mode"].Dropdown == "Teleport Random" then 
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(1,menu.values[1]["antiaim"]["Desync"]["Random Power"].Slider)/2500,
            math.random(1,menu.values[1]["antiaim"]["Desync"]["Random Power"].Slider)/2500,
            math.random(1,menu.values[1]["antiaim"]["Desync"]["Random Power"].Slider)/2500) 
            * 2^16
        elseif menu.values[1]["antiaim"]["Desync"]["Mode"].Dropdown == "Unhittable" then
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(1,1,1) * -(2^16)
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001,0)
end 
end

    getgenv().CFrameVisualizer = LocalPlayer.Character.HumanoidRootPart.Position
    getgenv().Visualizer = LocalPlayer.Character.HumanoidRootPart.Velocity

    RunService.RenderStepped:Wait() 



    if menu.values[1]["antiaim"]["CFrame Desync"]["Enabled"].Toggle then 
        LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().OldPosition
    end 

    if menu.values[1]["antiaim"]["Desync"]["Enabled"].Toggle then 
        LocalPlayer.Character.HumanoidRootPart.Velocity = getgenv().OldVelocity
    end
end)
end)() 



LPH_NO_VIRTUALIZE(function()
local oldIndex
oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if not checkcaller() then
            if key == "CFrame" and menu.values[1]["antiaim"]["CFrame Desync"]["Enabled"].Toggle and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                if self == LocalPlayer.Character.HumanoidRootPart and getgenv().OldPosition ~= nil then
                    return getgenv().OldPosition
                end

                
            end
        end
    return oldIndex(self, key)
end))


local Old
Old = hookmetamethod(game, "__index", function(self, k)
    if getgenv().Target ~= nil then 
    if (self:IsA("Mouse") and (k == "Hit" or k == "Target")) and FOVCHECK(getgenv().Target) then 
        return (k == "Hit" and getgenv().Hit)
    end
end 
    return Old(self, k)
end)

end)() 
end
