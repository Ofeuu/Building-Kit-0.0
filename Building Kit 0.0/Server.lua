local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Objects = ReplicatedStorage:WaitForChild("Objects")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local placeEvent = Remotes:WaitForChild("Place")
local warnEvent = Remotes:WaitForChild("Warn")

function Spawning(player, name, cframe)
	local objectExists = Objects:FindFirstChild(name)

	if objectExists then
		local newObject = objectExists:Clone()
		newObject.Parent = workspace.Objects
		newObject.CFrame = cframe
		
		warnEvent:FireClient(player, "Warn", "Sucessfully placed " .. newObject.Name .. "!")
	end
	
end

placeEvent.OnServerEvent:Connect(Spawning)

