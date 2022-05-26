pcall(function()
    local deadshot = false
    local MaskOn = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    MaskOn.AnimationId = "rbxassetid://3380627692"
    local MaskOff = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    MaskOff.AnimationId = "rbxassetid://3380629232"
    
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
    
    local OriginalKeyUpValue = 0;
    
    function StopAudio()
        game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND'):Stop();
    end;
    
    function Stop(i, v)
        local w = coroutine.wrap(function()
            wait(game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').TimeLength-0.1)
            if game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').SoundId == 'rbxassetid://'..i and OriginalKeyUpValue == v then
                StopAudio();
            end;
        end);
        w();
    end;
    
    function Play(i, v, w)
        if game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack'):FindFirstChild('[Boombox]') then
            local Tool = nil;
            if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') and w == true then
                Tool = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool')
                game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').Parent = game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack');
            end;
            game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack'):FindFirstChild('[Boombox]').Parent = game:GetService('Players').LocalPlayer.Character;
            game:GetService('ReplicatedStorage'):FindFirstChild('MainEvent'):FireServer('Boombox', i);
            game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]').RequiresHandle = false;
            if game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]'):FindFirstChild('Handle') then
                game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]'):FindFirstChild('Handle'):Destroy();
            end
            game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]').Parent = game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack')
            if game:GetService('Players').LocalPlayer:FindFirstChildOfClass('PlayerGui'):FindFirstChild('MainScreenGui'):FindFirstChild('BoomboxFrame') then
                game:GetService('Players').LocalPlayer:FindFirstChildOfClass('PlayerGui'):FindFirstChild('MainScreenGui'):FindFirstChild('BoomboxFrame').Visible = false;
            end;
            if Tool ~= true then
                if Tool then
                    Tool.Parent = game:GetService('Players').LocalPlayer.Character
                end;
            end;
            if v == true then
                game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):WaitForChild('BOOMBOXSOUND');
                local x = coroutine.wrap(function()
                    repeat wait() until game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').SoundId == 'rbxassetid://'..i and game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').TimeLength > 0.01
                    OriginalKeyUpValue = OriginalKeyUpValue + 1;
                    Stop(i, OriginalKeyUpValue);
                end);
                x();
            end;
        end;
    end;
    
    function Play2(v)
        Play(v, true, true);
    end;
    
    local guiinvis = false
    game:GetService('Players').LocalPlayer.Chatted:Connect(function(v)
        if v == "_DEADSHOT" then
            if deadshot == false then
                deadshot = true
                Play2(7229541025)
                if guiinvis == true then
                    game.Workspace.stpart.left.SurfaceGui.Enabled = true
                    game.Workspace.stpart.right.SurfaceGui.Enabled = true
                    game:GetService("CoreGui").Deadshot.QuadHaze.Visible = true
                end
                game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(MaskOn):Play()
                game:GetObjects("rbxassetid://8075232446")[1].Parent = workspace --// i uploaded the model, so if you use an exploit you can get the model in-game with this line.
                game.Workspace.stpart.Deadshot.Parent = game.CoreGui --// putting the ui (red vignette) in the CoreGui
                local a = true
                local b = true
                game.Workspace.stpart.left.Position = Vector3.new(-6.144, 0.15, -11.227)
                game.Workspace.stpart.right.Position = Vector3.new(-6.124, 0.15, -11.227)
                game["Run Service"].RenderStepped:Connect(function() -- this is a loop for the ui.
                    game.Workspace.stpart:SetPrimaryPartCFrame(game.Workspace.Camera.CFrame) -- putting ui on camera
                end)
                while wait(0.05) do -- shakey loop!
                    if a == true then
                        game.Workspace.stpart.left.Position -= Vector3.new(0.001,0,0)
                        a = false
                    elseif a == false then
                        game.Workspace.stpart.left.Position += Vector3.new(0.001,0,0)
                        a = true
                    end
                    
                    if b == true then
                        game.Workspace.stpart.right.Position -= Vector3.new(0.001,0,0)
                        b = false
                    elseif b == false then
                        game.Workspace.stpart.right.Position += Vector3.new(0.001,0,0)
                        b = true
                    end
                end
            elseif deadshot == true then
                deadshot = false
                Play2(7229541025)
                game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(MaskOff):Play()
                game.Workspace.stpart.left.SurfaceGui.Enabled = false
                game.Workspace.stpart.right.SurfaceGui.Enabled = false
                game:GetService("CoreGui").Deadshot.QuadHaze.Visible = false
                guiinvis = true
            end
        end;
    end);
    end)
