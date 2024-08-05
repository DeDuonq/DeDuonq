local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()


local Window = Library:CreateWindow({


    Title = 'Illusion.lua | Rewrite || .gg/illusions',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Aiming = Window:AddTab('Aiming'),
    Misc = Window:AddTab('Misc'),
    Teleports = Window:AddTab('Teleports'),
    Visuals = Window:AddTab("Visuals")
}

local LeftGroupBox = Tabs.Aiming:AddLeftGroupbox('Target')
local LeftGroupBox1 = Tabs.Aiming:AddRightGroupbox('Aimbot')
local LeftGroupBox2 = Tabs.Misc:AddLeftGroupbox('Misc')
local LeftGroupBox3 = Tabs.Teleports:AddLeftGroupbox('Teleports')
local LeftGroupBox4 = Tabs.Visuals:AddLeftGroupbox('Visuals')
local LeftGroupBox5 = Tabs.Visuals:AddLeftGroupbox('ESP')
local LeftGroupBox6 = Tabs.Visuals:AddRightGroupbox('Chams')
local LeftGroupBox7 = Tabs.Misc:AddRightGroupbox('Float')






local MyButton1 = LeftGroupBox3:AddButton('Revolver', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-642.438049, 21.7499943, -120.54261, -0.996704638, -4.62153764e-08, 0.0811163932, -5.21754728e-08, 1, -7.13562187e-08, -0.0811163932, -7.53533627e-08, -0.996704638)
end)
local MyButton2 = LeftGroupBox3:AddButton('Bank', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-374.392303, 21.2499924, -287.927338, -0.855447054, -1.72182069e-07, -0.517890275, 2.95946307e-07, 1, -8.21309982e-07, 0.517890275, -8.55854921e-07, -0.855447054)
end)
local MyButton3 = LeftGroupBox3:AddButton('Admin Base', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.853516, -34.4276848, -538.013306, -0.999724388, -3.9898886e-08, -0.0234765243, -3.9204977e-08, 1, -3.00177518e-08, 0.0234765243, -2.90890814e-08, -0.999724388)

end)
local MyButton4 = LeftGroupBox3:AddButton('Rev mountain', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-696.847717, 167.674957, -41.0118256, 0.626992583, 7.53169349e-09, -0.779025197, -1.29610933e-09, 1, 8.62493632e-09, 0.779025197, -4.39806902e-09, 0.626992583)

end)
local MyButton5 = LeftGroupBox3:AddButton('Ufo', function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.85052466, 132, -736.571106, -0.0460956171, -4.24733706e-08, -0.998937011, 7.26012459e-08, 1, -4.58687275e-08, 0.998937011, -7.46384217e-08, -0.0460956171)

end)
local MyButton6 = LeftGroupBox3:AddButton('RPG', function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.815933, -22.9016266, -136.737762, 0.0339428484, -7.90177737e-08, 0.999423802, -4.7851227e-08, 1, 8.06884728e-08, -0.999423802, -5.0562452e-08, 0.0339428484)
end)
local MyButton7 = LeftGroupBox3:AddButton('Taco', function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(707.502014, 139, -543.044739, -0.00318608154, -0.00102963799, 0.999993861, 0.000187970581, 0.999999464, 0.00103024102, -0.99999404, 0.00019125198, -0.00318560796)
end)
local MyButton8 = LeftGroupBox3:AddButton('Drum Gun', function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-80.8381271, 46.828949, -85.845993, 0.999289691, 4.71884114e-08, 0.0376862474, -4.71660684e-08, 1, -1.48225032e-09, -0.0376862474, -2.96314889e-10, 0.999289691)
end)
local MyButton9 = LeftGroupBox3:AddButton('Rev Roof', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-634.463135, 80.434761, -204.232559, -0.0190527271, -1.03574322e-07, -0.999818563, 4.36709335e-09, 1, -1.03676342e-07, 0.999818563, -6.3416179e-09, -0.0190527271)
end)
local MyButton10 = LeftGroupBox3:AddButton('PlayGround', function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-308.851196, 103.049866, -685.874817, 0.0775452703, 4.43633544e-05, -0.996988416, 4.02679916e-06, 1, 4.48105384e-05, 0.996988416, -7.48951334e-06, 0.0775452703)
end)
local MyButton11 = LeftGroupBox3:AddButton('Gas Station', function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595.925171, 130.75, -346.41568, -0.0400748774, 7.26109022e-08, 0.999196708, 2.20863914e-08, 1, -7.17834538e-08, -0.999196708, 1.91919352e-08, -0.0400748774)
end)
local MyButton12 = LeftGroupBox3:AddButton('GraveYard', function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.109558, 99.75, -57.2315979, 0.999993503, -0.000633752206, -0.0035054055, 0.000638642872, 0.999998808, 0.00139435288, 0.00350463158, -0.00139658386, 0.999992728)
end)
local MyButton13 = LeftGroupBox3:AddButton('School Roof', function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-525.353455, 68.125, 311.824402, 0.999992013, 1.03866675e-08, -0.00399552286, -1.03507425e-08, 1, 9.01170427e-09, 0.00399552286, -8.97027519e-09, 0.999992013)
end)






























getgenv().sped = false
getgenv().AntiAim2 = false
getgenv().jitter = false
getgenv().autoreload = false
getgenv().cframe = false
getgenv().BlatantAA = false
getgenv().antistomp = false 
getgenv().weaponchams = false
getgenv().Color = Color3.fromRGB(255, 0, 0)
getgenv().Material = "ForceField"
local Jit = math.random(30, 90)
local Angle = 60
getgenv().speedvalue = 0.50
getgenv().FakeMacro = false
getgenv().fakemacrospeed = 0.1
game:GetService("RunService").Heartbeat:Connect(
    function()
        
        if sped then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
        end
        if AntiAim2 then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.999, 0)
            wait(0.2)
        end

        if jitter then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
            CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
        end
        if autoreload then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                        "Ammo"
                    )
                 then
                    if
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                            "Ammo"
                        ).Value <= 0
                     then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer(
                            "Reload",
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                        )
                    end
                end
            end
        end
        if cframe then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
                    v:Destroy()
                end
            end
            game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
                repeat
                    wait()
                until game.Players.LocalPlayer.Character
                char.ChildAdded:Connect(function(child)
                    if child:IsA("Script") then 
                        wait(0.1)
                        if child:FindFirstChild("LocalScript") then
                            child.LocalScript:FireServer()
                        end
                    end
                end)
            end)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
            game.Players.LocalPlayer.Character.Humanoid.MoveDirection * speedvalue
            end
            if BlatantAA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
                end
                if antistomp then 
                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v:Destroy()
                            end
                        end
                    end
                end


                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild 'Default' then
                if weaponchams == true then
                    Game.GetService(game, "Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Material = getgenv().Material
                    Game.GetService(game, "Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Color = getgenv().Color
                else
                    if tool and tool:FindFirstChild 'Default' then
                        if weaponchams == false then
                            Game.GetService(game, "Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.Glass
                        end
                    end
                    end
                end


                if FakeMacro then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * fakemacrospeed
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * fakemacrospeed
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * fakemacrospeed
                end




                

end)







    LeftGroupBox2:AddToggle('Misc1', {
        Text = 'Anti Stomp',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables Anti Stomp', -- Information shown when you hover over the toggle
    })

    LeftGroupBox2:AddToggle('Misc2', {
        Text = 'Spinbot AA',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables SpinBot', -- Information shown when you hover over the toggle
    })

    LeftGroupBox2:AddToggle('Misc3', {
        Text = 'Slingshot AA',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables Slingshot AA', -- Information shown when you hover over the toggle
    })

    LeftGroupBox2:AddToggle('Misc4', {
        Text = 'Jitter AA',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables Jitter AA', -- Information shown when you hover over the toggle
    })

    LeftGroupBox2:AddToggle('Misc5', {
        Text = 'Desync AA',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables Desync AA', -- Information shown when you hover over the toggle
    })

    LeftGroupBox2:AddToggle('Misc6', {
        Text = 'CFrame',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables CFrame Speed', -- Information shown when you hover over the toggle
    }):AddKeyPicker("boofkeybind11", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'CFS Keybind' }) 

    LeftGroupBox2:AddToggle('www', {
        Text = 'Auto Move',
        Default = false, -- Default value (true / false)
        Tooltip = 'Enables Auto Move', -- Information shown when you hover over the toggle
    }):AddKeyPicker("boofkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Auto Move Keybind' }) 





    Toggles.www:OnChanged(function()
        getgenv().FakeMacro = Toggles.www.Value
    end)



    Toggles.Misc6:OnChanged(function()
        getgenv().cframe = Toggles.Misc6.Value
    end)



    
    Toggles.Misc1:OnChanged(function()
        getgenv().antistomp = Toggles.Misc1.Value
    end)

    Toggles.Misc2:OnChanged(function()
        getgenv().sped = Toggles.Misc2.Value
    end)

    Toggles.Misc3:OnChanged(function()
        getgenv().AntiAim2 = Toggles.Misc3.Value
    end)



    
    Toggles.Misc4:OnChanged(function()
        getgenv().jitter = Toggles.Misc4.Value
    end)

        
    Toggles.Misc5:OnChanged(function()
        getgenv().BlatantAA = Toggles.Misc5.Value
    end)




    LeftGroupBox2:AddInput('Misc7', {
        Default = '0.50',
        Numeric = false, -- true / false, only allows numbers
        Finished = false, -- true / false, only calls callback when you press enter
    
        Text = 'CFrame Value',
        Tooltip = 'Edits CFrame Speed Value', -- Information shown when you hover over the textbox
    
        Placeholder = '0.50', -- placeholder text when the box is empty
        -- MaxLength is also an option which is the max length of the text
    })

    Options.Misc7:OnChanged(function()
        getgenv().speedvalue = Options.Misc7.Value
    end)

























































































getgenv().Aiming = { 
    Target = { 
        Enabled = false,
        Prediction = 0.11621,
        AirshotFunc = false,
        Part = "HumanoidRootPart", -- Head UpperTorso HumanoidRootPart LowerTorso
        AirshotPart = "LowerTorso", -- i use rightfoot and rightarm
        Key = "c",
        Notifications = true,
        Toggle = false
    },
    TargetExtras = { 
        SpectatePlayer = false,
        TeleportToPlayer = false
    }
}





local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer
local lp = game.Players.LocalPlayer


getgenv().Show = false
_G.Color = Color3.fromRGB(255, 255, 255)
_G.Size = Vector3.new(0.9, 1.2, 0.9)

local Part = Instance.new("Part", game.Workspace)
Part.Anchored = true
Part.CanCollide = false
Part.Parent = game.Workspace
Part.Shape = Enum.PartType.Ball
Part.Size = _G.Size
Part.Color = _G.Color
Part.Transparency = 1



Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (getgenv().Aiming.Target.Key) then
        if getgenv().Aiming.Target.Toggle == true then
        if getgenv().Aiming.Target.Enabled == true then
            getgenv().Aiming.Target.Enabled = false
            if getgenv().Aiming.Target.Notifications == true then
                Plr = FindClosestUser()
                game.StarterGui:SetCore("SendNotification", {       -------------- all of this is if key is pressed the notification will pop up and will lock on to the closest player via m2p
                    Title = "illusion.lua",
                    Text = "No longer locked on"
                })
            end
            if getgenv().Aiming.TargetExtras.SpectatePlayer == true then
                game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
            end
            while getgenv().Show == true do
                wait()
                Part.Transparency = 0
            end
            while getgenv().Show == false do
                wait()
                Part.Transparency = 1
            end
        else
            Plr = FindClosestUser()
            getgenv().Aiming.Target.Enabled = true
            if getgenv().Aiming.Target.Notifications == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "illusion.lua",
                    Text = "Locked on to:" .. tostring(Plr.Character.Humanoid.DisplayName)
                })
            end
            if getgenv().Aiming.TargetExtras.SpectatePlayer == true then
                game.Workspace.CurrentCamera.CameraSubject = Plr.Character
            end
            if getgenv().Aiming.TargetExtras.TeleportToPlayer == true then
                lp.Character.HumanoidRootPart.CFrame = Plr.Character.HumanoidRootPart.CFrame
            end
        end
    end
end
end)

function FindClosestUser()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
            v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude     -- this getclosestplayer function is ass but it works ig
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end








local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if getgenv().Aiming.Target.Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = Plr.Character[getgenv().Aiming.Target.Part].Position +
                      (Plr.Character[getgenv().Aiming.Target.Part].Velocity * getgenv().Aiming.Target.Prediction)           ----- MAIN
        return old(unpack(args))
    end
    return old(...)
end)

-- airshot function bellow then end of target code

if getgenv().Aiming.Target.AirshotFunc == true then
    if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Aiming.Target.Part = getgenv().Aiming.Target.AirshotPart
    else
        Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
            if new == Enum.HumanoidStateType.Freefall then
                getgenv().Aiming.Target.Part = getgenv().Aiming.Target.AirshotPart
            else
                getgenv().Aiming.Target.Part = "LowerTorso"
            end
        end)
    end
end








RunService.Stepped:connect(function()
    if getgenv().Aiming.Target.Enabled and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
        Part.CFrame = CFrame.new(Plr.Character[getgenv().Aiming.Target.Part].Position +
                                     (Plr.Character.LowerTorso.Velocity * getgenv().Aiming.Target.Prediction))
    else
        Part.CFrame = CFrame.new(0, 9999, 0)

    end
end)














getgenv().Aimbot = { 
    Enabled = false,
    Smoothness = 0.005,
    Smoothing = false,
    AirshotFunc = false,
    AirshotPart = "RightFoot",
    AimPart = "HumanoidRootPart",
    Predicting = 1.2,
    Key = Enum.KeyCode.Q,
    Toggled
}


function x(tt,tx,cc)
    game.StarterGui:SetCore("SendNotification", {
        Title = tt;
        Text = tx;
        Duration = cc;
        Icon = "rbxthumb://type=Asset&id=7262533709&w=150&h=150";
    })
end

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Plr

function FindClosestPlayer()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil

        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
                local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                             .Position)
                if IsVisibleOnViewPort then
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end



    game:GetService("UserInputService").InputBegan:Connect(function(keygo)
           if (keygo.KeyCode == getgenv().Aimbot.Key) then
               Toggled = not Toggled
               if Toggled then
               Plr =  FindClosestPlayer()
end
         end
           
end)
game:GetService("RunService").RenderStepped:Connect(function()
if getgenv().Aimbot.Smoothing and getgenv().Aimbot.Enabled and Toggled == true then
    local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Plr.Character[getgenv().Aimbot.AimPart].Position + Plr.Character[getgenv().Aimbot.AimPart].Velocity*getgenv().Aimbot.Predicting/10)
                                 workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().Aimbot.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            elseif getgenv().Aimbot.Smoothing == false and getgenv().Aimbot.Enabled and Toggled == true then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Plr.Character[getgenv().Aimbot.AimPart].Position + Plr.Character[getgenv().Aimbot.AimPart].Velocity*getgenv().Aimbot.Predicting/10)
                            end

end)

if getgenv().Aimbot.AirshotFunc == true then
    
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    getgenv().Aimbot.AimPart = getgenv().Aimbot.AirshotPart
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        getgenv().Aimbot.AimPart = getgenv().Aimbot.AirshotPart
                        else
                            getgenv().Aimbot.AimPart = getgenv().Aimbot.AimPart
                        end
                    end)
                end
            end





LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Enable Target',
    Default = false, -- Default value (true / false)
    Tooltip = 'Target Aim Toggle', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('MyToggle1', {
    Text = 'Airshot Function',
    Default = false, -- Default value (true / false)
    Tooltip = 'Airshot Function Toggle', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('MyToggle2', {
    Text = 'Visualize Prediction',
    Default = false, -- Default value (true / false)
    Tooltip = 'Visualises Prediction', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('MyToggle3', {
    Text = 'Teleport Mode',
    Default = false, -- Default value (true / false)
    Tooltip = 'Teleports To Target', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('MyToggle4', {
    Text = 'Spectate Mode',
    Default = false, -- Default value (true / false)
    Tooltip = 'Spectates Target', -- Information shown when you hover over the toggle
})

LeftGroupBox1:AddToggle('MyToggle5', {
    Text = 'Enable Aimbot',
    Default = false, -- Default value (true / false)
    Tooltip = 'Q To Lock on', -- Information shown when you hover over the toggle
})

LeftGroupBox1:AddToggle('MyToggle6', {
    Text = 'Airshot Function',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Airshot Function', -- Information shown when you hover over the toggle
})

LeftGroupBox1:AddToggle('MyToggle7', {
    Text = 'Smoothing',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Smoothing', -- Information shown when you hover over the toggle
})

Toggles.MyToggle:OnChanged(function()
    getgenv().Aiming.Target.Toggle = Toggles.MyToggle.Value
end)

Toggles.MyToggle1:OnChanged(function()
    getgenv().Aiming.Target.AirshotFunc = Toggles.MyToggle1.Value
end)

Toggles.MyToggle2:OnChanged(function()
    getgenv().Show = Toggles.MyToggle2.Value
end)

Toggles.MyToggle3:OnChanged(function()
    getgenv().Aiming.TargetExtras.TeleportToPlayer = Toggles.MyToggle3.Value
end)

Toggles.MyToggle4:OnChanged(function()
    getgenv().Aiming.TargetExtras.SpectatePlayer = Toggles.MyToggle4.Value
end)

Toggles.MyToggle5:OnChanged(function()
    getgenv().Aimbot.Enabled = Toggles.MyToggle5.Value
end)

Toggles.MyToggle6:OnChanged(function()
    getgenv().Aimbot.AirshotFunc = Toggles.MyToggle6.Value
end)


Toggles.MyToggle7:OnChanged(function()
    getgenv().Aimbot.Smoothing = Toggles.MyToggle7.Value
end)

LeftGroupBox:AddInput('MyTextbox', {
    Default = '0.11621',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Edits target prediction velocity', -- Information shown when you hover over the textbox

    Placeholder = '0.11621', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

LeftGroupBox1:AddInput('MyTextbox1', {
    Default = '1.2',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Edits Aimbot prediction velocity', -- Information shown when you hover over the textbox

    Placeholder = '1.2', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})


LeftGroupBox:AddInput('beg', {
    Default = 'c',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Key',
    Tooltip = 'Edits Target Key', -- Information shown when you hover over the textbox

    Placeholder = 'c', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

LeftGroupBox1:AddInput('MyTextbox2', {
    Default = '0.005',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Smoothness',
    Tooltip = 'Edits Aimbot Smoothness Velocity', -- Information shown when you hover over the textbox

    Placeholder = '0.005', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextbox:OnChanged(function()
    getgenv().Aiming.Target.Prediction = Options.MyTextbox.Value
end)

Options.beg:OnChanged(function()
    getgenv().Aiming.Target.Key = Options.beg.Value
end)

Options.MyTextbox1:OnChanged(function()
    getgenv().Aimbot.Predicting = Options.MyTextbox1.Value
end)

Options.MyTextbox2:OnChanged(function()
    getgenv().Aimbot.Smoothness = Options.MyTextbox2.Value
end)

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'Head', 'HumanoidRootPart', 'UpperTorso', 'LowerTorso' },
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'Changes Target Part', -- Information shown when you hover over the textbox
})

LeftGroupBox:AddDropdown('MyDropdown1', {
    Values = { 'Head', 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'RightFoot' },
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Airshot Part',
    Tooltip = 'Changes Target Airshot Part', -- Information shown when you hover over the textbox
})

Options.MyDropdown:OnChanged(function()
    getgenv().Aiming.Target.Part = Options.MyDropdown.Value
end)

Options.MyDropdown1:OnChanged(function()
    getgenv().Aiming.Target.AirshotPart = Options.MyDropdown.Value
end)


getgenv().Saturation = ''
LeftGroupBox4:AddLabel('Ambient'):AddColorPicker('ColorPicker', {
    Default = Color3.fromRGB(255, 255, 255), -- Bright green
    Title = 'Ambient', -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ColorPicker:OnChanged(function()
    game:GetService("Lighting").ColorCorrection.TintColor = Options.ColorPicker.Value
end)

LeftGroupBox4:AddSlider('Saturation', {
    Text = 'Saturation Slider',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

Options.Saturation:OnChanged(function()
    getgenv().Saturation = Options.Saturation.Value
    game:GetService("Lighting").ColorCorrection.Saturation = getgenv().Saturation
end)




LeftGroupBox5:AddToggle('ESP1', {
    Text = 'ESP Boxes',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables ESP Boxes', -- Information shown when you hover over the toggle
})

LeftGroupBox5:AddToggle('ESP2', {
    Text = 'ESP Names',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables ESP Names', -- Information shown when you hover over the toggle
})

LeftGroupBox5:AddToggle('ESP3', {
    Text = 'ESP Tracers',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables ESP Tracers', -- Information shown when you hover over the toggle
})








local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

function AttachChams(parent, face)
	local SurfaceGui = Instance.new("SurfaceGui",parent) 
	SurfaceGui.Parent = parent
	SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SurfaceGui.Face = Enum.NormalId[face]
	SurfaceGui.LightInfluence = 0
	SurfaceGui.ResetOnSpawn = false
	SurfaceGui.Name = "Body"
	SurfaceGui.AlwaysOnTop = true
	local Frame = Instance.new("Frame",SurfaceGui)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.Size = UDim2.new(1,0,1,0)
end

getgenv().PikaESPSettings = {
    Box = false,
    Name = false,
    Tracers = false,
    Chams = false,
    Font = 3,
    Teammates = false,
    VisibleOnly = false,
    UnlockTracers = false,
    TextSize = 16
}

local function PikaESP(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false
    
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1
    
    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = Color3.new(1,1,1)
    Name.Size = 12
    Name.Center = true
    Name.Outline = true
    

    local Gun = Drawing.new("Text")
    Gun.Transparency = 1
    Gun.Visible = false
    Gun.Color = Color3.new(1,1,1)
    Gun.Size = 12
    Gun.Center = true
    Gun.Outline = true

    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0,0.5,0))
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0,3,0))
                
            if PikaESPSettings.Chams and v.Character.Head:FindFirstChild("Body") == nil then
                for i,v in pairs(v.Character:GetChildren()) do
                    if v:IsA("MeshPart") or v.Name == "Head" then
                        AttachChams(v, "Back")
                        AttachChams(v, "Front")
                        AttachChams(v, "Top")
                        AttachChams(v, "Bottom")
                        AttachChams(v, "Right")
                        AttachChams(v, "Left")
                    end
                end
            end

            if onScreen then
                if PikaESPSettings.Box then
                    BoxOutline.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true
    
                    Box.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true
                        
                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true
    
                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 0)
                    HealthBar.Visible = true
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
                if PikaESPSettings.Tracers then
                    if PikaESPSettings.UnlockTracers then
                        Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                    else
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    end
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Visible = true
                else
                    Tracer.Visible = false
                end
                if PikaESPSettings.Name then
                    Name.Text = tostring(v.Name)
                    Name.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                    Name.Visible = true
                    Name.Size = PikaESPSettings.TextSize
                    if PikaESPSettings.Font == "UI" then
                        Name.Font = 0
                        Gun.Font = 0
                    elseif PikaESPSettings.Font == "System" then
                        Name.Font = 1
                        Gun.Font = 1
                    elseif PikaESPSettings.Font == "Plex" then
                        Name.Font = 2
                        Gun.Font = 2
                    elseif PikaESPSettings.Font == "Monospace" then
                        Name.Font = 3
                        Gun.Font = 3
                    end
                    Gun.Size = PikaESPSettings.TextSize
                    Gun.Text = tostring("illusion.lua")
                    Gun.Position = Vector2.new(LegPosition.X, LegPosition.Y + 10)
                    Gun.Visible = true
                else
                    Name.Visible = false
                    Gun.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
                Tracer.Visible = false
                Name.Visible = false
                Gun.Visible = false
            end
        else
            BoxOutline.Visible = false
            Box.Visible = false
            HealthBarOutline.Visible = false
            HealthBar.Visible = false
            Tracer.Visible = false
            Name.Visible = false
            Gun.Visible = false
        end
    end)
end



for i,v in pairs(game.Players:GetChildren()) do
    PikaESP(v)
end

game.Players.PlayerAdded:Connect(function(v)
    PikaESP(v)
end)


LeftGroupBox6:AddToggle('Chams1', {
    Text = 'Gun Chams',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Gun Chams', -- Information shown when you hover over the toggle
})


LeftGroupBox6:AddLabel('Chams Color'):AddColorPicker('Chams2', {
    Default = Color3.fromRGB(255, 255, 255), -- Bright green
    Title = 'Weapon Chams Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})


LeftGroupBox6:AddDropdown('Chams3', {
    Values = { 'ForceField' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Chams Material',
    Tooltip = 'Changes Chams Material', -- Information shown when you hover over the textbox
})


Options.Chams3:OnChanged(function()
    getgenv().Material = Options.Chams3.Value
end)

Toggles.ESP1:OnChanged(function()

    getgenv().PikaESPSettings.Box = Toggles.ESP1.Value
end)

Toggles.ESP2:OnChanged(function()

    getgenv().PikaESPSettings.Name = Toggles.ESP2.Value
end)

Toggles.ESP3:OnChanged(function()

    getgenv().PikaESPSettings.Tracers = Toggles.ESP3.Value
end)

Toggles.Chams1:OnChanged(function()

    getgenv().weaponchams = Toggles.Chams1.Value
end)




Options.Chams2:OnChanged(function()
    getgenv().Color = Options.Chams2.Value
end)




--[[
Illusion.lua
Credits to Specter for Float
]]
















_G.FlyTable = { 
    Enabled = false,
    Normal = true,
    Height = 35,
    MoveOnly = false,
    Amount = 1
}

local LocalPlayer = game.Players.LocalPlayer


game:GetService("RunService").Heartbeat:Connect( 
    function()
        if _G.FlyTable.Enabled and
(not _G.FlyTable.MoveOnly or LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0)
then
if _G.FlyTable.Normal then
    local AngleX, AngleY, AngleZ = LocalPlayer.Character.HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
        LocalPlayer.Character.HumanoidRootPart.CFrame.X,
        _G.FlyTable.Height + 24,
        LocalPlayer.Character.HumanoidRootPart.CFrame.Z
    ) * CFrame.Angles(AngleX, AngleY, AngleZ)
    LocalPlayer.Character.Humanoid:ChangeState("Freefall")
    LocalPlayer.Character:TranslateBy(
        LocalPlayer.Character.Humanoid.MoveDirection * _G.FlyTable.Amount / 1.5
    )
end
end
end)

LeftGroupBox7:AddToggle('beg', {
    Text = 'Float',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Float', -- Information shown when you hover over the toggle
}):AddKeyPicker("boofkeybind543", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Float Keybind' }) 

Toggles.beg:OnChanged(function()
    _G.FlyTable.Enabled = Toggles.beg.Value
end)

LeftGroupBox7:AddSlider('daddyuwu', {
    Text = 'Height',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0,
    Min = 0,
    Max = 35,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

Options.daddyuwu:OnChanged(function()
    _G.FlyTable.Height = Options.daddyuwu.Value
end)

LeftGroupBox7:AddSlider('daddyuwu1', {
    Text = 'Multiplier',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

Options.daddyuwu1:OnChanged(function()
    _G.FlyTable.Amount = Options.daddyuwu1.Value
end)
