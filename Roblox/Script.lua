local P1000ToggleKey = "x" -- Change that to whatever keybind: "t"

--// Services
checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()


--// Toggles
local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Fe Touch Fling")

local Tab1 = Window_1:NewSection("Fling")


Tab1:CreateToggle("Fling", function(value)
    PastedSources = value
end)

--// Desync_Source
function RandomNumberRange(a)
	return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
	return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local DesyncTypes = {}
BruhXD.Heartbeat:Connect(function()
	if PastedSources == true then
		DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
		DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

		local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

		SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
		SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))

		LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis

		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * 16384

		BruhXD.RenderStepped:Wait()

		LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
	end
end)


--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
	if PastedSources == true then
		if not checkcaller() then
			if key == "CFrame" and PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
				if self == LocalPlayer.Character.HumanoidRootPart then
					return DesyncTypes[1] or CFrame.new()
				elseif self == LocalPlayer.Character.Head then
					return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
				end
			end
		end
	end
	return XDDDDDD(self, key)
end))
