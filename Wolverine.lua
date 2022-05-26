local OriginalKeyUpValue = 0
local LocalPlayer = game:GetService("Players").LocalPlayer

local OldChar = LocalPlayer.Character

function StopAudio()
    OldChar.LowerTorso.BOOMBOXSOUND:Stop()
end

function stop(ID, Key)
    local cor = coroutine.wrap(function()
        wait(OldChar.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
        if OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
            StopAudio()
        end
    end)
    cor()
end


function play(ID, STOP, LMAO)
    if LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
        local Tool = nil
        if OldChar:FindFirstChildOfClass("Tool") and LMAO == true then
            Tool = OldChar:FindFirstChildOfClass("Tool")
            OldChar:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
        end
        LocalPlayer.Backpack["[Boombox]"].Parent =
            OldChar
        game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
        OldChar["[Boombox]"].RequiresHandle = false
        if OldChar["[Boombox]"]:FindFirstChild("Handle") then
            OldChar["[Boombox]"].Handle:Destroy()
        end
        OldChar["[Boombox]"].Parent =
            LocalPlayer.Backpack
        LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
        if Tool ~= true then
            if Tool then
                Tool.Parent = OldChar
            end
        end
        if STOP == true then
            OldChar.LowerTorso:WaitForChild("BOOMBOXSOUND")
            local cor = coroutine.wrap(function()
                repeat wait() until OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OldChar.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
                OriginalKeyUpValue = OriginalKeyUpValue+1
                stop(ID, OriginalKeyUpValue)
            end)
            cor()
        end
    end
end

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Root = Character.HumanoidRootPart 
local ply = game.Players.LocalPlayer
local chr = ply.Character

   
 local Tool = Instance.new('Tool')
 Tool.Parent = game.Players.LocalPlayer.Backpack
 Tool.Name = "Wolverine"
 Tool.RequiresHandle = false
 
    
 local WVHandle = Instance.new('Tool')
 WVHandle.Parent = game.Players.LocalPlayer.Backpack
 WVHandle.Name = "-"
 WVHandle.RequiresHandle = false

 function GetKnives()
    local Target = game.Workspace.Ignored.Shop['[Knife] - $150']
    local Tool = Instance.new('Tool')
    Tool.Parent = game.Players.LocalPlayer.Backpack
    Tool.Name = "Collect Knives"
    Tool.RequiresHandle = false
    
    
    Tool.Activated:Connect(function()
    
    for i,v in pairs(game.Workspace.Ignored.ItemsDrop:GetDescendants()) do
    if v.Name == "[Knife]" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
        break
    end
    end
    end)
end
GetKnives()

plr = game.Players.LocalPlayer
 
hum = plr.Character.HumanoidRootPart
 
mouse = plr:GetMouse()
local loopenabled = false

-- tool here

Tool.Activated:Connect(function() 

    WVHandle.Parent = game.Players.LocalPlayer.Character
    
    wait(0.1)

Tool.Parent = game:GetService('Players').LocalPlayer.Backpack

    play(2769472393, true, true)
    wait(0.1)
    local Char = game.Players.LocalPlayer.Character
    local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
    local Anim = Instance.new("Animation")

wait(1)
local count = 0 
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
  if v.Name == '[Knife]' then
    count = count + 1
    if count == 1 then
        v.GripForward = Vector3.new(-0.999, 0.038, -0.019)
        v.GripPos = Vector3.new(0.134, -0.006, -0.27)
        v.GripRight = Vector3.new(0.021, 0.06, -0.998)
        v.GripUp = Vector3.new(0.037, 0.997, 0.06)
    elseif count == 2 then
        v.GripForward = Vector3.new(-0.999, 0.038, -0.019)
        v.GripPos = Vector3.new(0.128, -0.037, -0.008)
        v.GripRight = Vector3.new(0.021, 0.06, -0.998)
        v.GripUp = Vector3.new(0.037, 0.997, 0.06)
    else
        v.GripForward = Vector3.new(-0.999, 0.038, -0.019)
        v.GripPos = Vector3.new(0.12, -0.072, 0.23)
        v.GripRight = Vector3.new(0.021, 0.06, -0.998)
        v.GripUp = Vector3.new(0.037, 0.997, 0.06)
    end
    v.Parent = game.Players.LocalPlayer.Character
  end
end

local FastSprint = Instance.new("IntValue",ply.Character.BodyEffects.Movement);FastSprint.Name = "FastSprint"
local HulkJump = Instance.new("IntValue",ply.Character.BodyEffects.Movement);HulkJump.Name = "HighJump"
    
    Anim.AnimationId = "rbxassetid://7861306542"
    function WolvAnim()
        local XD = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
        XD:Play()
        XD.TimePosition = 0.40
        XD.Looped = false
        XD:AdjustSpeed(1.8)
    end
    if loopenabled == false then
        loopenabled = true
    while true do
    wait()
if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed"):Destroy() end
if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk"):Destroy() end
if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping"):Destroy() end
if game.Players.LocalPlayer.Character.BodyEffects.Reload.Value == true then game.Players.LocalPlayer.Character.BodyEffects.Reload.Value = false end

if game.Players.LocalPlayer.Backpack:FindFirstChild('-') then
    for i,v in pairs(game.Players.LocalPlayer.Character.BodyEffects.Movement:GetChildren()) do
        if v.Name == "FastSprint" then v:Destroy()
        elseif v.Name == "HighJump" then v:Destroy()
            play(2769472667, true, true)
            end
        end
    end        

        for i,v in next, Hum:GetPlayingAnimationTracks() do
            if v.Animation.AnimationId == "rbxassetid://3033700364" then
                v:Stop();
                wait(.1)
                WolvAnim()
            end
        end
    end
end
end)
