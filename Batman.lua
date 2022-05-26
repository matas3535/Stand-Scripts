assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)

--// main functions
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

-- // main tools create
local Batarang = Instance.new('Tool')
Batarang.Parent = game.Players.LocalPlayer.Backpack
Batarang.Name = "Batarang"
Batarang.RequiresHandle = false

--// Batman Outfit We use a model due to the part and stuff
local MaskOn = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
MaskOn.AnimationId = "rbxassetid://3380627692"
local MaskOff = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
MaskOff.AnimationId = "rbxassetid://3380629232"
local old2 = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Shirt').ShirtTemplate
local old3 = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Pants').PantsTemplate  
game:GetObjects("rbxassetid://8083348193")[1].Parent = game.Players.LocalPlayer.Backpack 
local BatManOutFitTool = game.Players.LocalPlayer.Backpack.BatmanOutfit
local OutFitOn = false
BatManOutFitTool.Activated:Connect(function()
    if OutFitOn == false then
        OutFitOn = true
        local lp = game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(MaskOn):Play()
        game.Players.LocalPlayer.Character.BatmanOutfit.Handle.Transparency = 1
        game.Players.LocalPlayer.Character.BatmanOutfit.Handle.Decal.Transparency = 1
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass('ShirtGraphic') then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('ShirtGraphic'):Destroy()
        end
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Shirt') then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Shirt').ShirtTemplate = 'rbxassetid://164114181';
        else
            local Shirt = Instance.new('Shirt');
            Shirt.Parent = game.Players.LocalPlayer.Character;
            Shirt.ShirtTemplate = 'rbxassetid://164114181';
        end
        if game.Players.LocalPlayer.Character:FindFirstChild('Pants') then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Pants').PantsTemplate = 'rbxassetid://164114198';
        else
            local Pants = Instance.new('Pants');
            Pants.Parent = game.Players.LocalPlayer.Character;
            Pants.PantsTemplate = 'rbxassetid://164114198';
        end;
    else
        OutFitOn = false
        game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(MaskOff):Play()
        game.Players.LocalPlayer.Character.BatmanOutfit.Handle.Transparency = 0
        game.Players.LocalPlayer.Character.BatmanOutfit.Handle.Decal.Transparency = 0
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Shirt').ShirtTemplate = old2
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Pants').PantsTemplate = old3
    end
end)

game:GetObjects("rbxassetid://8083438374")[1].Parent = game.Players.LocalPlayer.Backpack 
local GlideTool = game.Players.LocalPlayer.Backpack.Glide
local GlideAnim = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
GlideAnim.AnimationId = "rbxassetid://3136090876"
local Gliding = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GlideAnim)
function GlideToolActive()
    local player = game.Players.LocalPlayer
    repeat wait() until player.Character
    local humanoid = player.Character:WaitForChild('Humanoid')
    local bodyvelocity = game.Players.LocalPlayer.Backpack.Glide.Handle:WaitForChild("BodyVelocity")
    local jumpover = true
    function jump()
        jumpover = false
        wait(.3)
        jumpover = true
        local currenstate = humanoid:GetState()
        if currenstate == Enum.HumanoidStateType.Freefall and game.Players.LocalPlayer.Character:FindFirstChild("Glide") then
            bodyvelocity.MaxForce = Vector3.new(0,100000,0)
            play(1462718291, true, true)
            while wait() and game.Players.LocalPlayer.Character:FindFirstChild("Glide") and Enum.HumanoidStateType.Freefall do
                Gliding:Play()
            end
        end
    end
    humanoid.StateChanged:Connect(function(oldState, newState)
        if jumpover == true then
            if newState == Enum.HumanoidStateType.Jumping then
                bodyvelocity.MaxForce = Vector3.new(0,0,0)
                jump()
            elseif newState == Enum.HumanoidStateType.Freefall then
                bodyvelocity.MaxForce = Vector3.new(0,300000,0)
                play(1462718291, true, true)
                while wait() and game.Players.LocalPlayer.Character:FindFirstChild("Glide") and Enum.HumanoidStateType.Freefall do
                    Gliding:Play()
                end
            else
                Gliding:Stop()
                if game.Players.LocalPlayer.Character:FindFirstChild("Glide") then
                Gliding:Stop()
                play(2952274135, true, true)
            end 
                Gliding:Stop()
                if game.Players.LocalPlayer.Character:FindFirstChild("Glide") then
                    Gliding:Stop()
                    play(2952274135, true, true)
                end
                bodyvelocity.MaxForce = Vector3.new(0,0,0)
            end
        end
    end)
end

GlideTool.Equipped:Connect(GlideToolActive())

local GrappleHook = Instance.new('Tool')
GrappleHook.Parent = game.Players.LocalPlayer.Backpack
GrappleHook.Name = "GrappleHook"
GrappleHook.RequiresHandle = false
