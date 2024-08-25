-- MUST USE SETTINGS, OR IT WILL NOT WORK
getgenv().Configuration = ({
	["MIMIC_SPEED"] = 80,
	["STUDS_FROM"] = -15,
	["MIMIC_COLOR"] = "Black",
	["MIMIC_IDLE"] = "Custom", -- Animation ID
	["MIMIC_RUN"] = "Custom", -- Animation ID
	["CustomMimicModel"] = 17352896252, -- Model ID [White: 17352898583 | Black: 17352896252]

	["Information"] = {
		["Credits"] = "Icxy",
		["Discord"] = "https://discord.gg/novagui",
		["Version"] = 3.01, -- This does nothing in the script it just shows which version you are on, and if it is outdated you will need to join discord and get the newer version
	},
})

local NovaSoundModule = loadstring(game:HttpGet('https://icxy.xyz/scripts/dahood/NovaSoundModule.lua', true))()
local Mimic = loadstring(game:HttpGet('https://icxy.xyz/scripts/dahood/DaMimic/script.lua', true))()


-- Reminder of what the current keybinds are (these are the default keys)
warn([[
	
	-- [</>] ---------------------------------------------------- [<\>] --
	
   	- Keybinds:
    X - Go Invisible
    B - Jumpscare
    C - Scary music
    H - TP to mouse
    T - Speed In direction
    
    -- [</>] ---------------------------------------------------- [<\>] --
]])

-- Variables: 
local LocalPlayer = game.Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local TS = game:GetService("TweenService")

function Highlight(state)
	if state then
		local Highlight = Instance.new("Highlight", LocalPlayer.Character);
		Highlight.Name = "Mimic_Highlight"
		Highlight.OutlineTransparency = 0.8
		Highlight.OutlineColor =Color3.new(1, 1, 1)
		Highlight.FillTransparency = 0.999
		Highlight.FillColor = Color3.new(1, 1, 1)
	else
		if LocalPlayer.Character:FindFirstChild("Mimic_Highlight") then
			LocalPlayer.Character:FindFirstChild("Mimic_Highlight"):Destroy();
		end;
	end;
end;

-- INVIS KEYBIND
Mimic:CreateKeybind(Enum.KeyCode.X, function() -- MAIN FUNCTION APPEAR/DISAPPEAR
	Mimic:FAKECHAR();
	if shared.InMimic then
		Highlight(true);
	else
		Highlight(false);
	end;
end);

-- JUMPSCARING KEYBIND
local RandomScare = {8280196339, 7588947168}
Mimic:CreateKeybind(Enum.KeyCode.B, function()
	if shared.InMimic then
		Mimic:FAKECHAR();
		NovaSoundModule:PhonePlay(RandomScare[math.random(1,#RandomScare)], true); -- Plays a random sound from the `RandomScare` table
		task.wait(.5) -- Time appeared while jumpscaring
		if not shared.InMimic then
			Mimic:FAKECHAR();
		end
	end;
end);

-- Goto Mouse with scary sound
Mimic:CreateKeybind(Enum.KeyCode.H, function()
	if shared.InMimic then
		shared.StopTP = true
		NovaSoundModule:PhonePlay(1, true);
		task.wait()
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y+5, Mouse.Hit.Z)
		task.wait(.34)
		shared.StopTP = false
	end;
end);

-- Speed forwards
Mimic:CreateKeybind(Enum.KeyCode.T, function()
	if shared.InMimic then
		NovaSoundModule:PhonePlay(6073433216, true); -- Plays a random sound in the `RandomScare` table
		task.wait(.12)
		shared.StopTP = true
		local FakeChar_HRP = workspace:FindFirstChild(LocalPlayer.Name.."_FAKECHAR"):FindFirstChild("Mimic"):FindFirstChild("HumanoidRootPart")
		LocalPlayer.Character.HumanoidRootPart.CFrame = FakeChar_HRP.CFrame
		TS:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = FakeChar_HRP.CFrame * CFrame.new(0, -4, -40)}):Play()
		task.wait(.32)
		shared.StopTP = false
	end;
end);

Mimic:CreateKeybind(Enum.KeyCode.C, function()
	NovaSoundModule:PhonePlay(1836166976, true); -- You can change this to Mimic:BoomboxPlay(1836166976, true, true)
end);
