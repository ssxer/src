--[[
EXTREME FLING

(I will never obsfucate this, as it would make me claim this as my own code, all the code cut is from Infinite Yield and other sources i have forgotten.)

(This is a script taken from MasterMZ and repurposed here. I'm sorry if i dont know the Original owner's name.

Fun Fact : If you wear Layered Clothing near joints of waist to leg.
You will look like an abomination and have people with epilepsy get seizure using SpreadRadius option.

And don't use this with games that has a kill block because you're gonna touch that kill block easier and kill yourself.
--]]

-- Respect to Digitality
-- For creating Leg Resize.

-----
-- INFO ABOUT THINGS
-----

--[[
Noclip : Automatically On
Fly : Automatically On
Fly is mobile supported, which means you can move with fly on

(Mobile users with executors wont be strugglin pressing a fake keyboard)

Only works on games that has collision and games that doesn't kill you instantly because of kill block or tp block

Radius is almost more wider than normal fling due to the extended leg
--]]

TypeOfFling = 1 -- Default

-- 1 is Spread Radius
-- 2 is Focus One Radius
-- Random number is still chosen as 2

-- Meaning of these types

-- SPREAD RADIUS

--[[
This will reduce the effectiveness of flinging more harder but spreads the fling of radius even more.
--]]

-- FOCUS ONE RADIUS

--[[
This will increase effectiveness of flinging more harder but reduces the radius of flinging.
--]]

-- OPTION FOR FLING VELOCITY

--[[
Set your fling velocity, the higher the better, but the more broken it is. (This means you are going to get fling off because of the map parts or either bug out)
--]]

FlingVelocity = 9000 -- default


-- Scripts
-- You might notice some familliar cuts of code

local function Notif(txt)
game.StarterGui:SetCore("SendNotification",{
        Title = "Extreme Fling";
        Text = txt;
         Icon = "rbxassetid7772906436";
         Duration = 5;
    })
end

Notif("Running the script please wait")

local P2 = game:GetService("Players").LocalPlayer
local Noclipping = nil
local Clip = true
local RunService = game:GetService("RunService")
	wait(0.1)
	local function NoclipLoop()
if Clip then
		if P2.Character ~= nil then
			for _, child in pairs(P2.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
	end
end
end
	Noclipping = RunService.Stepped:Connect(NoclipLoop)
wait(0.05)

local Player = game.Players.LocalPlayer

				for i, x in pairs(Player.Character:GetDescendants()) do
					if x:IsA("BasePart") and not x.Anchored then
						x.Anchored = true
					end
				end

local IsFlying = true
local flyv
local flyg
local Speed = 70

local LastSpeed = Speed
local IsRunning = false
local f = 1

				flyv = Instance.new("BodyVelocity")
	
			flyv.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	
				flyg = Instance.new("BodyGyro")
			flyg.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyg.MaxTorque = Vector3.new(9e9,9e9,9e9)
				flyg.P = 1000
				flyg.D = 50
			Player.Character:WaitForChild('Humanoid').PlatformStand = true

spawn(function()
		while true do
			wait()
		if IsFlying then
				flyg.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.new(-math.rad((f+0)*50*Speed),0,0) 
					flyv.Velocity = workspace.CurrentCamera.CoordinateFrame.LookVector * Speed
else
f = 0
		end
if IsRunning then
			Speed = LastSpeed
		else
			if not Speed == 0 then
				LastSpeed = Speed
			end 
			Speed = 0
		end
end
end)

Player.Character.Humanoid.Changed:Connect(function()
		if Player.Character.Humanoid.Health == 0 then
		if IsFlying then
Noclipping:Disconnect()
Clip = false
		flyg:Destroy()
		flyv:Destroy()
		end
		end
	end)

Player.CharacterAdded:Connect(function()
if isFlying then
Noclipping:Disconnect()
Clip = false
flyg:Destroy()
flyv:Destroy()
end
end)
	Player.Character.Humanoid.Changed:Connect(function(Prop)
		
			if Player.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) then
				IsRunning = false
			else
				IsRunning = true
			end	
	end)

wait(1)

local char = Player.Character
function helpmeget(char)
	local c4 = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return c4
end

local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "SpinnerVelocity"
Spin.Parent = helpmeget(Player.Character)
Spin.MaxTorque = Vector3.new(0, math.huge, 0) 
Spin.AngularVelocity = Vector3.new(0,FlingVelocity,0)

wait(1)

Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
if TypeOfFling == 1 then
Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
elseif TypeOfFling == 2 then
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
else
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end

loadstring(game:HttpGet('https://raw.githubusercontent.com/DigitalityScripts/roblox-scripts/main/Leg%20Resize'))()

wait(0.4)

for i, x in pairs(Player.Character:GetDescendants()) do
					if x:IsA("BasePart") and x.Anchored then
						x.Anchored = false
					end
				end

Notif("Finished loading, from Elephant X.")
