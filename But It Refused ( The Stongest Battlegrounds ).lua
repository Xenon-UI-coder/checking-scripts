local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local rootPart = char:WaitForChild("HumanoidRootPart")

local enabledInt = Instance.new("BoolValue", plr)
enabledInt.Name = "EnableRefuse"
enabledInt.Value = true

local UI = Instance.new("ScreenGui", plr.PlayerGui)
UI.Name = "RefusedScript"
UI.IgnoreGuiInset = true
UI.ResetOnSpawn = false

local frame = Instance.new("Frame", UI)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Visible = false

local heart = Instance.new("ImageLabel", frame)
heart.BackgroundTransparency = 1
heart.Position = UDim2.new(0.439, 0, 0.449, 0)
heart.Size = UDim2.new(0.122, 0, 0.246, 0)
heart.Image = "rbxassetid://92754779587286"
heart.ImageColor3 = Color3.fromRGB(255, 0, 0)
heart.ScaleType = Enum.ScaleType.Crop

local text = Instance.new("TextLabel", frame)
text.Name = "RefusedText"
text.BackgroundTransparency = 1
text.Position = UDim2.new(0.371, 0, 0.266, 0)
text.Size = UDim2.new(0.257, 0, 0.041, 0)
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Font = Enum.Font.Code
text.Text = "* But it refused."
text.TextScaled = true
text.TextStrokeTransparency = 0.85
text.Visible = false


local cred = Instance.new("TextLabel", UI)
cred.BackgroundTransparency = 1
cred.Position = UDim2.new(0.725, 0, 0.016, 0)
cred.Size = UDim2.new(0.257, 0, 0.041, 0)
cred.Font = Enum.Font.Code
cred.FontFace.Style = Enum.FontStyle.Italic
cred.FontFace.Weight = Enum.FontWeight.Bold
cred.Text = '"But it refused" - Made by OSGC'
cred.TextColor3 = Color3.fromRGB(255, 255, 255)
cred.TextScaled = true
cred.TextStrokeTransparency = 0.85


local toggle = Instance.new("TextButton", UI)
toggle.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
toggle.BackgroundTransparency = 0.75
toggle.Position = UDim2.new(0.78, 0, 0.069, 0)
toggle.Size = UDim2.new(0.148, 0, 0.028, 0)
toggle.Font = Enum.Font.Code
toggle.Text = 'On'
toggle.RichText = true
toggle.TextScaled = true

local uiCorner = Instance.new("UICorner", toggle)
local uiStroke = Instance.new("UIStroke", toggle)
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Color = Color3.fromRGB(0,0,0)
uiStroke.Thickness = 1.5

toggle.MouseButton1Click:Connect(function()
	if toggle.Text == 'On' then
		toggle.Text = 'Off'
		toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		enabledInt.Value = false
	else
		toggle.Text = 'On'
		toggle.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
		enabledInt.Value = true
	end
end)

local ts = game:GetService("TweenService")

local function fadeUI(FadeFrame)
	local wrap

	wrap = task.spawn(function()
		local function hasProperty(object, prop)
			local t = object[prop]
		end
		
		local fadedObjs = {}

		for i, v in pairs(FadeFrame:GetChildren()) do
			local success = pcall(function() hasProperty(v, "Visible") end)

			if success then
				if v.Visible == true and v.Name ~= "RefusedText" then
					v.Visible = false
					table.insert(fadedObjs, v)
				end
			end
		end

		local prevTransparency = FadeFrame.BackgroundTransparency

		local Framefade = ts:Create(FadeFrame, TweenInfo.new(1), {BackgroundTransparency = 1})
		Framefade:Play()
		Framefade.Completed:Wait()
		FadeFrame.Visible = false

		FadeFrame.BackgroundTransparency = prevTransparency

		for i, v in pairs(fadedObjs) do
			local success = pcall(function() hasProperty(v, "Visible") end)

			if success then
				v.Visible = true
			end
		end
		coroutine.yield()
		coroutine.close(wrap)
	end)
end

local respawning = false

hum.Died:Connect(function()
	if respawning == false then
		respawning = true
		local enabled = plr:WaitForChild("EnableRefuse")

		if enabled.Value == true then
			frame.Visible = true
			
			local music = Instance.new("Sound", workspace)
			music.Name = "RevivalMusic"
			music.SoundId = "rbxassetid://96300753876311"		
			music.Volume = 0.75
			music.TimePosition = 20
			music:Play()

			local sound = Instance.new("Sound", workspace)
			sound.SoundId = "rbxassetid://5193339590"		
			sound.Volume = 1
			sound:Play()
			task.wait(2.5)

			sound.Ended:Connect(function()
				sound:Destroy()
			end)

			local sound2 = Instance.new("Sound", workspace)
			sound2.SoundId = "rbxassetid://7148330411"	
			sound2.Volume = 1
			sound2:Play()

			sound2.Ended:Connect(function()
				sound2:Destroy()
			end)

			text.Visible = true
			heart.Image = "rbxassetid://9632333669"
		end
	end
end)

hum:GetPropertyChangedSignal("Health"):Connect(function()
	local enabled = plr:WaitForChild("EnableRefuse")

	if enabled.Value == true then
		if not plr:FindFirstChild("DeathPos") then
			local int = Instance.new("CFrameValue", plr)
			int.Name = "DeathPos"

			if hum.FloorMaterial ~= Enum.Material.Air then
				int.Value = rootPart.CFrame
			end
		else
			local int = plr.DeathPos


			if hum.FloorMaterial ~= Enum.Material.Air then
				int.Value = rootPart.CFrame
			end
		end
	end
end)

plr.CharacterAdded:Connect(function(char)
	hum = char:WaitForChild("Humanoid")
	rootPart = char:WaitForChild("HumanoidRootPart")

	local enabled = plr:WaitForChild("EnableRefuse")
	
	if enabled.Value == true then
		if plr:FindFirstChild("DeathPos") then
			rootPart.CFrame = plr.DeathPos.Value * CFrame.new(0, 3, 0)
			fadeUI(frame)
			
			if workspace:FindFirstChild("RevivalMusic") then
				local tween = ts:Create(workspace.RevivalMusic, TweenInfo.new(0.5), {Volume = 0})
				tween:Play()
				
				tween.Completed:Connect(function()
					workspace.RevivalMusic:Destroy()
				end)
			end
			
			text.Visible = false
			heart.Image = "rbxassetid://92754779587286"

			game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "* But it refused.", Font = Enum.Font.Code})

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://14611931363"
			anim.Name = "Revival"

			hum.Animator:LoadAnimation(anim):Play()
			
			hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
				if hum.MoveDirection.Magnitude > 0 then
					for i, v in pairs(hum:GetPlayingAnimationTracks()) do
						if v.Name == "Revival" then
							v:Stop()
						end
					end
				end
			end)
		end
	end
	
	respawning = false
	
	hum.Died:Connect(function()
		if respawning == false then
			respawning = true
			local enabled = plr:WaitForChild("EnableRefuse")

			if enabled.Value == true then
				frame.Visible = true
				
				local music = Instance.new("Sound", workspace)
				music.Name = "RevivalMusic"
				music.SoundId = "rbxassetid://96300753876311"		
				music.Volume = 0.75
				music.TimePosition = 20
				music:Play()
				
				local sound = Instance.new("Sound", workspace)
				sound.SoundId = "rbxassetid://5193339590"		
				sound.Volume = 1
				sound:Play()
				task.wait(2.5)
				
				sound.Ended:Connect(function()
					sound:Destroy()
				end)
				
				local sound2 = Instance.new("Sound", workspace)
				sound2.SoundId = "rbxassetid://7148330411"	
				sound2.Volume = 1
				sound2:Play()
				
				sound2.Ended:Connect(function()
					sound2:Destroy()
				end)
				
				text.Visible = true
				heart.Image = "rbxassetid://9632333669"
			end
		end
	end)
	
	hum:GetPropertyChangedSignal("Health"):Connect(function()
		local enabled = plr:WaitForChild("EnableRefuse")
		
		if enabled.Value == true then
			if not plr:FindFirstChild("DeathPos") then
				local int = Instance.new("CFrameValue", plr)
				int.Name = "DeathPos"
				
				if hum.FloorMaterial ~= Enum.Material.Air then
					int.Value = rootPart.CFrame
				end
			else
				local int = plr.DeathPos
				
				if hum.FloorMaterial ~= Enum.Material.Air then
					int.Value = rootPart.CFrame
				end
			end
		end
	end)
end)