--Neckgrab Fully
local Grabbed = false
        local Up = false
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local ActivateTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        ActivateTool.RequiresHandle = false 
        ActivateTool.Name = "Activate"
        ActivateTool.Activated:Connect(function()
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', true)
        repeat task.wait(0.1)
        until game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= nil and game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= ''
        if game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= nil and game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= '' then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
        Grabbed = true
        game.Players[target].Character:FindFirstChild('GRABBING_CONSTRAINT').H.Length = 99e99
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
            if Track.Animation.AnimationId == "rbxassetid://11075367458" then
                Track:Stop()
            end
        end 
        spawn(function()
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://3135389157"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(0.2)
        wait(0.8)
        LoadAnimation:AdjustSpeed(0)
        end)
        if game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition") then
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        else
        getfenv().bodypos = Instance.new('BodyPosition', game.Players[target].Character.UpperTorso)
        getfenv().bodypos.D = 200
        getfenv().bodypos.MaxForce = Vector3.new(10000,10000,10000)
        getfenv().bodygyro = Instance.new('BodyGyro', game.Players[target].Character.UpperTorso)
        getfenv().bodygyro.MaxTorque = Vector3.new(10000,10000,10000)
        getfenv().bodygyro.D = 100
        end
        game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.RightHand.Position + Vector3.new(0,-0.7,0)
        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        end)
        else
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        Grabbed = false
        Up = false
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                    Track:Stop()
                end
            end 
        end
        game.Players.LocalPlayer.Character.BodyEffects.Grabbed:GetPropertyChangedSignal('Value'):connect(function()
        if game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value == nil then 
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
                elseif Track.Animation.AnimationId == "rbxassetid://14496531574" then
                Track:Stop()
                elseif Track.Animation.AnimationId == "rbxassetid://3096047107" then
                Track:Stop()
            end
        end 
        end
        end)
        end)
    
    
    
    
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local UpTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        UpTool.RequiresHandle = false 
        UpTool.Name = "Up"
        UpTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
        Up = true
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end
        spawn(function()
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://14496531574"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(1)
        wait(1)
        LoadAnimation:AdjustSpeed(0)
        end)
        spawn(function()
        wait(0.3)
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        wait(0.05)
        game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0,23,0)
        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        end)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
        end)
        else
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
            if Track.Animation.AnimationId == "rbxassetid://14496531574" then
                Track:Stop(1)
            end
        end
        spawn(function()
        wait(0.45)
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://3135389157"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(0.2)
        task.wait(0.8)
        LoadAnimation:AdjustSpeed(0)
        end)
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        Up = false
        game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.RightHand.Position + Vector3.new(0,-0.7,0)
        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        end)
        wait(1)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 200
        end
        end
        end)
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local ThrowTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        ThrowTool.RequiresHandle = false 
        ThrowTool.Name = "Throw"
        ThrowTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
            for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end 
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://3096047107"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(1)
        wait(0.2)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 900
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 150 + Vector3.new(0,5,0)
        wait(0.5)
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
        end
        end
        end)
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local SlamTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        SlamTool.RequiresHandle = false 
        SlamTool.Name = "Floar Slam"
        SlamTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
            for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end 
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://14228857569"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(1)
        wait(0.1)
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        wait(0.01)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 500
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5 + Vector3.new(0,350,0)
        wait(0.59)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 100
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 35 + Vector3.new(0,-100,0)
        wait(0.7)
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
        end
        end
        end)
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local HeavenTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        HeavenTool.RequiresHandle = false 
        HeavenTool.Name = "Heaven Throw"
        HeavenTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
            for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end 
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://14496531574"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(1)
        wait(0.4)
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        wait(0.01)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 200
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3 + Vector3.new(0,3000,0)
        wait(2)
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
        
        end
        end
        end)
        
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local KickTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        KickTool.RequiresHandle = false 
        KickTool.Name = "Kick"
        KickTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
            for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end 
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://14228857569"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        LoadAnimation:AdjustSpeed(0.55)
        wait(0.2)
        wait(0.2)
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        game.Players[target].Character.UpperTorso.BodyPosition.D = 900
        game.Players[target].Character.UpperTorso.BodyPosition.Position =  game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3 + Vector3.new(0,80,0)
        wait(0.4)
        LoadAnimation:Stop(0.5)
        wait(0.3)
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
        wait(0.15)
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://2788306916"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        wait(0.9)
        for i = 1,2 do
        wait()
        game.Players[target].Character.UpperTorso.Velocity = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.X*450,300,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.Z*450)
        end
        wait(1)
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
        end
        end
        end)
        
        
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local PunchTool = Instance.new("Tool",LocalPlayer.Backpack)
        local Mouse = LocalPlayer:GetMouse()
        PunchTool.RequiresHandle = false 
        PunchTool.Name = "Punch"
        PunchTool.Activated:Connect(function()
        if Grabbed == true then
        if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
            for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                Track:Stop()
            end
        end 
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        end)
        game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 9 + Vector3.new(0,1,0)
        wait(3)
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://3354696735"
        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
        LoadAnimation.Priority = Enum.AnimationPriority.Action
        LoadAnimation:Play()
        wait(1)
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
        game:GetService('RunService'):UnbindFromRenderStep("Pos")
        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
        for i = 1,2 do
            wait()
            game.Players[target].Character.UpperTorso.Velocity = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.X*950,-200,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.Z*950)
            end
        end
        end
        wait(1)
        game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
        end)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local RipTool = Instance.new("Tool",LocalPlayer.Backpack)
    local Mouse = LocalPlayer:GetMouse()
    RipTool.RequiresHandle = false 
    RipTool.Name = "Rip In Half"
    RipTool.Activated:Connect(function()
    if Grabbed == true then
    if Up == false then
        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
            if Track.Animation.AnimationId == "rbxassetid://3135389157" then
            Track:Stop()
        end
    end
    local Animation1 = Instance.new("Animation")
    Animation1.AnimationId = "rbxassetid://13850666420"
    local LoadAnimation1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation1)
    LoadAnimation1.Priority = Enum.AnimationPriority.Action
    LoadAnimation1:Play()
    local Animation2 = Instance.new("Animation")
    Animation2.AnimationId = "rbxassetid://13850675130"
    local LoadAnimation2 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation2)
    LoadAnimation2.Priority = Enum.AnimationPriority.Action
    LoadAnimation2:Play()
    game:GetService('RunService'):UnbindFromRenderStep("Pos")
    game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2 + Vector3.new(0,0.2,0)
    end)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("Im gonna rip you in half now.", "All")
    task.wait(2.30)
    task.wait(0.2)
    game.Players[target].Character.LowerTorso.Position = Vector3.new(0,-600,0)
    game:GetService('RunService'):UnbindFromRenderStep("Pos")
    task.wait(0.2)
    game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
    game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
    task.wait(0.1)
    game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*90
    game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
    game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
    task.wait(0.3)
    game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
    task.wait(0.2)
    LoadAnimation1:Stop(0.3)
    LoadAnimation2:Stop(0.3)
    end
    end
    end)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local HellTool = Instance.new("Tool",LocalPlayer.Backpack)
    local Mouse = LocalPlayer:GetMouse()
    HellTool.RequiresHandle = false 
    HellTool.Name = "Go TO HELL"
    HellTool.Activated:Connect(function()
    if Grabbed == true then
    if Up == false then
    local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
    wait(0.9)
    for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
        if Track.Animation.AnimationId == "rbxassetid://3135389157" then
            Track:Stop()
        end
    end
    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
    game:GetService('RunService'):UnbindFromRenderStep("Pos")
    game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    end)
    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 10 + Vector3.new(0,1.4,0)
    local Animation = Instance.new("Animation")
    Animation.AnimationId = "rbxassetid://14774699952"
    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation)
    LoadAnimation.Priority = Enum.AnimationPriority.Action
    LoadAnimation:Play()
    LoadAnimation:AdjustSpeed(0.09)
    wait(9)
    game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
    game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
    for i , v in pairs(game.Players[target].Character:GetChildren()) do
    if v:IsA("MeshPart") then
    v.Position = Vector3.new(0,-600,0)
    end
    end
    wait(0.2)
    game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
    end
    end
    end)




    
    spawn(function()
        getgenv().Bat = false
        getgenv().BatFling = false
        game:GetService("RunService").Heartbeat:Connect(function()
        if getgenv().BatFling == true then 
        local Vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.X*350,340,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.Z*350)
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vel
        end 
        end)
        game.Players.LocalPlayer.Backpack:WaitForChild("[Bat]")
        wait(0.05)
        game.Players.LocalPlayer.Backpack["[Bat]"].Activated:Connect(function()
        if getgenv().Bat == false then
        getgenv().Bat = true
        game.Players.LocalPlayer.Character:FindFirstChild("[Bat]"):Deactivate()
        wait(0.6)
        getgenv().BatFling = true
        wait(1.6)
        getgenv().BatFling = false
        getgenv().Bat = false
        else
        end
        end)
        end)