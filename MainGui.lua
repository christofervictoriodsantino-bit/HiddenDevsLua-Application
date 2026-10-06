repeat
    wait(1)
until game:IsLoaded()
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = (v_u_1.Character or v_u_1.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
game:GetService("SocialService")
local v_u_4 = game:GetService("ReplicatedStorage")
game:GetService("MarketplaceService")
game:GetService("SoundService")
local v5 = game:GetService("CollectionService")
game:GetService("UserInputService")
game:GetService("TeleportService")
local v6 = v_u_4:WaitForChild("Modules")
local v_u_7 = require(v6:WaitForChild("Config"))
require(v6:WaitForChild("Gamepass"))
local v_u_8 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_9 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_10 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function v_u_16(p_u_11)
    if p_u_11:IsA("ImageButton") then
        local v_u_12 = p_u_11.Size
        local v_u_13 = UDim2.new(v_u_12.X.Scale * 1.05, v_u_12.X.Offset, v_u_12.Y.Scale * 1.05, v_u_12.Y.Offset)
        p_u_11.MouseEnter:Connect(function()
            v_u_3:Create(p_u_11, v_u_8, {
                ["Size"] = v_u_13
            }):Play()
            local v14 = Instance.new("Sound")
            v14.SoundId = v_u_7.HoverSound
            v14.Volume = 0.1
            v14.PlayOnRemove = true
            v14.Parent = p_u_11
            v14:Destroy()
        end)
        p_u_11.MouseLeave:Connect(function()
            v_u_3:Create(p_u_11, v_u_10, {
                ["Size"] = v_u_12
            }):Play()
        end)
        p_u_11.MouseButton1Click:Connect(function()
            if p_u_11.Name == "Left" then
                return
            elseif p_u_11.Name ~= "Right" then
                local v15 = Instance.new("Sound")
                v15.SoundId = v_u_7.ClickSound
                v15.Volume = 0.5
                v15.PlayOnRemove = true
                v15.Parent = p_u_11
                v15:Destroy()
                v_u_3:Create(p_u_11, v_u_9, {
                    ["Size"] = UDim2.new(v_u_12.X.Scale * 0.95, v_u_12.X.Offset, v_u_12.Y.Scale * 0.95, v_u_12.Y.Offset)
                }):Play()
                task.delay(0.1, function()
                    v_u_3:Create(p_u_11, v_u_9, {
                        ["Size"] = v_u_13
                    }):Play()
                end)
            end
        end)
    end
end
for _, v17 in ipairs(v5:GetTagged("BounceEffect")) do
    v_u_16(v17)
end
v5:GetInstanceAddedSignal("BounceEffect"):Connect(function(p18)
    v_u_16(p18)
end)
local v_u_19 = script.Parent
local v20 = v_u_19.Right
local v21 = v_u_19.Left
local v22 = v_u_19.TopBar
local v_u_23 = v_u_19:WaitForChild("Notification", 5)
local v_u_24 = v22.Left
local v25 = v22.Right
local v_u_26 = v22.Number
local v27 = v22:WaitForChild("Kill")
local v28 = v22:WaitForChild("Skip")
local v29 = v22:WaitForChild("Finish")
local v_u_30 = v_u_19.Shop
local v31 = v21.Gears
local v_u_32 = v_u_30.ScrollingFrame
local v_u_33 = 1
local v_u_34 = v_u_33
local v_u_35 = {}
local v_u_36 = {}
local v_u_37 = 0
local function v_u_42(p38, p39, p40)
    local v41 = v_u_3:Create(p38, TweenInfo.new(p40, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["BackgroundTransparency"] = p39
    })
    v41:Play()
    return v41
end
local function v_u_46(p43)
    for _, v44 in pairs(v_u_32:GetChildren()) do
        if v44:IsA("ImageLabel") and p43[v44.Name] == true then
            local v45 = v44.Purchase
            v45.Container.Price.Text = "Owned"
            v45.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
            v45.Active = false
        end
    end
end
local v_u_47 = false
for _, v48 in ipairs(v_u_23:GetChildren()) do
    if v48:IsA("UIGradient") then
        v_u_35[v48.Name] = v48:Clone()
    end
end
local function v_u_51()
    for v49, v50 in ipairs(v_u_36) do
        v50.Position = UDim2.new(0.5, -v50.Size.X.Offset / 2, 0.85 - (v49 - 1) * 0.06, 0)
    end
end
local function v_u_60(p52, p53)
    if tick() - v_u_37 >= 1 then
        v_u_37 = tick()
        local v_u_54 = v_u_23:Clone()
        v_u_54.Visible = true
        v_u_54.Parent = v_u_23.Parent
        v_u_54.Name = "Notification_" .. tick()
        v_u_54.Text = p52
        v_u_54.TextTransparency = 1
        v_u_54.Position = UDim2.new(0.5, -v_u_54.Size.X.Offset / 2, 1, 0)
        if v_u_54:FindFirstChild("UIStroke") then
            v_u_54.UIStroke.Transparency = 1
        end
        for _, v55 in ipairs(v_u_54:GetChildren()) do
            if v55:IsA("UIGradient") then
                v55:Destroy()
            end
        end
        local v56 = v_u_35[p53]
        if v56 then
            v56.Enabled = true
            v56:Clone().Parent = v_u_54
            local v57 = script:FindFirstChild(p53)
            if v57 then
                v57:Play()
            end
        else
            warn("Gradient not found:", p53)
        end
        local v58 = v_u_36
        table.insert(v58, v_u_54)
        v_u_51()
        v_u_3:Create(v_u_54, TweenInfo.new(0.3), {
            ["TextTransparency"] = 0
        }):Play()
        local v_u_59 = v_u_54:FindFirstChild("UIStroke")
        if v_u_59 then
            v_u_3:Create(v_u_59, TweenInfo.new(0.3), {
                ["Transparency"] = 0
            }):Play()
        end
        task.delay(2.5, function()
            v_u_3:Create(v_u_54, TweenInfo.new(0.4), {
                ["TextTransparency"] = 1
            }):Play()
            if v_u_59 then
                v_u_3:Create(v_u_59, TweenInfo.new(0.4), {
                    ["Transparency"] = 1
                }):Play()
            end
            task.delay(0.5, function()
                table.remove(v_u_36, table.find(v_u_36, v_u_54))
                v_u_54:Destroy()
                v_u_51()
            end)
        end)
    end
end
local v_u_61 = v_u_7.ClickTime
local v_u_62 = false
local v_u_63 = false
v_u_24.MouseButton1Click:Connect(function()
    if not v_u_62 then
        local v_u_64 = "MaxCheckpoint"
        local v65, v66 = pcall(function()
            return v_u_4.Events.RetrieveStats:InvokeServer(v_u_64)
        end)
        if not v65 then
            warn("Failed to retrieve stat: " .. v66)
            v66 = nil
        end
        local v67 = v66 < 1 and 1 or v66
        v_u_34 = v_u_34 - 1
        if v_u_34 < 1 then
            v_u_34 = v67
        end
        local v68 = Instance.new("Sound")
        v68.SoundId = v_u_7.ClickSound
        v68.Volume = 0.5
        v68.PlayOnRemove = true
        v68.Parent = v_u_24
        v68:Destroy()
        local v_u_69 = "MaxCheckpoint"
        local v70, v71 = pcall(function()
            return v_u_4.Events.RetrieveStats:InvokeServer(v_u_69)
        end)
        if not v70 then
            warn("Failed to retrieve stat: " .. v71)
            v71 = nil
        end
        local v72 = v71 <= 0 and 1 or v71
        if v72 < v_u_34 then
            v_u_34 = v72
        elseif v_u_34 < 1 then
            v_u_34 = 1
        end
        local v73 = v_u_34
        v_u_26.Text = tostring(v73)
        local v74 = v_u_34
        local v75 = workspace.Gameplay.CheckPoints:FindFirstChild((tostring(v74)))
        if v75 then
            v_u_2.CFrame = v75.CFrame + Vector3.new(0, 2, 0)
        end
        v_u_62 = true
        task.wait(v_u_61)
        v_u_62 = false
    end
end)
v25.MouseButton1Click:Connect(function()
    if not v_u_63 then
        local v_u_76 = "MaxCheckpoint"
        local v77, v78 = pcall(function()
            return v_u_4.Events.RetrieveStats:InvokeServer(v_u_76)
        end)
        if not v77 then
            warn("Failed to retrieve stat: " .. v78)
            v78 = nil
        end
        local v79 = v78 < 1 and 1 or v78
        v_u_34 = v_u_34 + 1
        if v79 < v_u_34 then
            v_u_34 = 1
        end
        local v80 = Instance.new("Sound")
        v80.SoundId = v_u_7.ClickSound
        v80.Volume = 0.5
        v80.PlayOnRemove = true
        v80.Parent = v_u_24
        v80:Destroy()
        local v_u_81 = "MaxCheckpoint"
        local v82, v83 = pcall(function()
            return v_u_4.Events.RetrieveStats:InvokeServer(v_u_81)
        end)
        if not v82 then
            warn("Failed to retrieve stat: " .. v83)
            v83 = nil
        end
        local v84 = v83 <= 0 and 1 or v83
        if v84 < v_u_34 then
            v_u_34 = v84
        elseif v_u_34 < 1 then
            v_u_34 = 1
        end
        local v85 = v_u_34
        v_u_26.Text = tostring(v85)
        local v86 = v_u_34
        local v87 = workspace.Gameplay.CheckPoints:FindFirstChild((tostring(v86)))
        if v87 then
            v_u_2.CFrame = v87.CFrame + Vector3.new(0, 2, 0)
        end
        v_u_63 = true
        task.wait(v_u_61)
        v_u_63 = false
    end
end)
for _, v88 in pairs(v_u_32:GetChildren()) do
    if v88:IsA("ImageLabel") then
        local v89 = v88.Purchase
        local v_u_90 = v88.Name
        v89.MouseButton1Click:Connect(function()
            v_u_4.Events.MainEvent:FireServer("BuyTool", v_u_90)
        end)
    end
end
v27.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage").Events._promptPass:InvokeServer("KillAll", false)
end)
v28.MouseButton1Click:Connect(function()
    local v_u_91 = "MaxCheckpoint"
    local v92, v93 = pcall(function()
        return v_u_4.Events.RetrieveStats:InvokeServer(v_u_91)
    end)
    if not v92 then
        warn("Failed to retrieve stat: " .. v93)
        v93 = nil
    end
    local v94 = v93 + 1
    if workspace.Gameplay.CheckPoints:FindFirstChild((tostring(v94))) then
        if game:GetService("ReplicatedStorage").Events._promptPass:InvokeServer("Skip", false) then
            local v95 = workspace.Gameplay.CheckPoints:FindFirstChild((tostring(v94)))
            if v95 and (v_u_1.Character and v_u_1.Character:FindFirstChild("HumanoidRootPart")) then
                v_u_1.Character.HumanoidRootPart.CFrame = v95.CFrame + Vector3.new(0, 2, 0)
            end
        end
    else
        warn("No next checkpoint")
    end
end)
v29.MouseButton1Click:Connect(function()
    local v96 = workspace.Gameplay.CheckPoints
    local v97 = 0
    for _, v98 in ipairs(v96:GetChildren()) do
        local v99 = v98.Name
        local v100 = tonumber(v99)
        if v100 and v97 < v100 then
            v97 = v100
        end
    end
    if game:GetService("ReplicatedStorage").Events._promptPass:InvokeServer("Finish", false) then
        local v101 = v96:FindFirstChild((tostring(v97)))
        if v101 and (v_u_1.Character and v_u_1.Character:FindFirstChild("HumanoidRootPart")) then
            v_u_1.Character.HumanoidRootPart.CFrame = v101.CFrame + Vector3.new(0, 2, 0)
        end
    end
end)
v31.MouseButton1Click:Connect(function()
    v_u_47 = not v_u_47
    if v_u_47 then
        v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
            ["FieldOfView"] = 60
        }):Play()
        v_u_30.Visible = true
        local v102 = Instance.new("Sound")
        v102.SoundId = "rbxassetid://111424747937311"
        v102.Volume = 0.1
        v102.PlayOnRemove = true
        v102.Parent = v_u_30
        v102:Destroy()
    else
        v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
            ["FieldOfView"] = 70
        }):Play()
        v_u_30.Visible = false
    end
end)
v_u_30.Top.Exit.MouseButton1Click:Connect(function()
    v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
        ["FieldOfView"] = 70
    }):Play()
    v_u_30.Visible = false
end)
v_u_4.Events.MainEvent.OnClientEvent:Connect(function(p103, ...)
    local v104 = { ... }
    if p103 == "UpdateCheckPoint" then
        local v105 = v_u_26
        local v106 = v_u_1.CurrentCheckpoint.Value
        v105.Text = tostring(v106)
        return
    elseif p103 == "Win" then
        local v107 = v_u_19.Fade
        v_u_42(v107, 0, 1)
        local v108 = Instance.new("Sound")
        v108.SoundId = "rbxassetid://3043029786"
        v108.Volume = 1
        v108.Parent = v107
        v108:Play()
        wait(2)
        local v109 = Instance.new("Sound")
        v109.SoundId = "rbxassetid://18687686692"
        v109.Volume = 1
        v109.Parent = v107
        v109:Play()
        v_u_42(v107, 1, 1)
        return
    elseif p103 == "Notif" then
        local v110, v111 = unpack(v104)
        v_u_60(v110, v111)
        return
    elseif p103 == "GW" then
        local v112 = unpack(v104)
        local v113 = game:GetService("CollectionService")
        for _, v114 in ipairs(v113:GetTagged("GroupBox")) do
            if v114:IsA("BasePart") then
                v114.CanCollide = v112
            end
        end
        return
    elseif p103 == "Shop" then
        v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
            ["FieldOfView"] = 60
        }):Play()
        v_u_30.Visible = true
        local v115 = Instance.new("Sound")
        v115.SoundId = "rbxassetid://111424747937311"
        v115.Volume = 0.1
        v115.PlayOnRemove = true
        v115.Parent = v_u_30
        v115:Destroy()
        return
    elseif p103 == "UpdateShopUI" then
        v_u_46(v104[1])
    elseif p103 == "PurchaseSuccess" then
        local v116 = v_u_32:FindFirstChild(v104[1])
        if v116 then
            local v117 = v116.Purchase
            v117.Container.Price.Text = "Owned"
            v117.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
            v117.Active = false
            return
        end
    elseif p103 == "Stepped" then
        local v118 = unpack(v104)
        local v119 = game.Workspace.Gameplay.CheckPoints:FindFirstChild((tostring(v118)))
        local v120 = Instance.new("Sound")
        v120.SoundId = v_u_7.CheckpointSound
        v120.Volume = 0.4
        v120.PlayOnRemove = true
        v120.Parent = v_u_19
        v120:Destroy()
        if v119 then
            local v121 = v119.Color
            local v122 = v119.Size
            v119.Color = Color3.fromRGB(167, 255, 152)
            local v123 = game:GetService("TweenService"):Create(v119, TweenInfo.new(0.15), {
                ["Size"] = v122 * 1.35
            })
            local v124 = game:GetService("TweenService"):Create(v119, TweenInfo.new(0.2), {
                ["Size"] = v122
            })
            v123:Play()
            v123.Completed:Wait()
            v124:Play()
            v124.Completed:Wait()
            v119.Color = v121
            return
        end
    elseif p103 == "Chat" then
        local v125, v126 = unpack(v104)
        game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral"):DisplaySystemMessage("<font color=\"" .. (v126 or "#FFFFFF") .. "\">" .. v125 .. "</font>")
    end
end)
v_u_1:GetAttributeChangedSignal("JumpMultiplier"):Connect(function()
    local v127 = v_u_19.Jump.Count
    local v128 = 1 + v_u_1:GetAttribute("JumpMultiplier")
    v127.Text = tostring(v128) .. "x Jump"
end)
v_u_1:GetAttributeChangedSignal("LuckyBlockTime"):Connect(function()
    local v129 = v_u_1:GetAttribute("LuckyBlockTime")
    if v129 then
        if v129 > 0 then
            local v130 = v_u_19.Playtime.Timer
            local v131 = math.max(0, v129)
            local v132 = v131 / 60
            local v133 = math.floor(v132)
            local v134 = v131 % 60
            v130.Text = string.format("%02d:%02d", v133, v134)
        else
            v_u_19.Playtime.Timer.Text = "Claimed!"
            task.delay(5, function()
                v_u_19.Playtime.Visible = false
            end)
        end
    else
        return
    end
end)
local v_u_135 = "CurrentCheckpoint"
local v136, v137 = pcall(function()
    return v_u_4.Events.RetrieveStats:InvokeServer(v_u_135)
end)
if not v136 then
    warn("Failed to retrieve stat: " .. v137)
    v137 = nil
end
local v138 = v137 < 1 and 1 or v137
v_u_33 = v138
v_u_26.Text = tostring(v138)
local v139 = v22.Number
local v140 = v_u_1.CurrentCheckpoint.Value
v139.Text = tostring(v140)
local v141 = v_u_19.Jump.Count
local v142 = 1 + v_u_1:GetAttribute("JumpMultiplier")
v141.Text = tostring(v142) .. "x Jump"
v_u_1.CurrentCheckpoint.Changed:Connect(function()
    v_u_33 = v_u_1.CurrentCheckpoint.Value
    local v_u_143 = "MaxCheckpoint"
    local v144, v145 = pcall(function()
        return v_u_4.Events.RetrieveStats:InvokeServer(v_u_143)
    end)
    if not v144 then
        warn("Failed to retrieve stat: " .. v145)
        v145 = nil
    end
    local v146 = v145 <= 0 and 1 or v145
    if v146 < v_u_33 then
        v_u_33 = v146
    elseif v_u_33 < 1 then
        v_u_33 = 1
    end
    local v147 = v_u_33
    v_u_26.Text = tostring(v147)
end)
local v148 = v20:WaitForChild("Fly")
local v_u_149 = v_u_4:WaitForChild("Events")
v148.MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Fly", false)
end)
v20:WaitForChild("Speed").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Speed", false)
end)
v20:WaitForChild("Gravity").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Gravity", false)
end)
v20:WaitForChild("Grapple").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Grapple", false)
end)
v20:WaitForChild("Ban").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Ban", false)
end)
v20:WaitForChild("Trowel").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Trowel", false)
end)
v20:WaitForChild("Laser").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Laser Gun", false)
end)
v20:WaitForChild("Invisible").MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Invisible", false)
end)
v_u_19.Jump.MouseButton1Click:Connect(function()
    v_u_149._promptPass:InvokeServer("Jump", false)
end)
local v_u_150 = {
    v20.Fly,
    v20.Speed,
    v20.Grapple,
    v20.Gravity
}
local v_u_151 = {
    v20.Ban,
    v20.Trowel,
    v20.Invisible,
    v20.Laser
}
task.spawn(function()
    while true do
        local v152 = v_u_150
        for _, v153 in ipairs(v152) do
            v153.Visible = true
        end
        local v154 = v_u_151
        for _, v155 in ipairs(v154) do
            v155.Visible = false
        end
        task.wait(10)
        local v156 = v_u_150
        for _, v157 in ipairs(v156) do
            v157.Visible = false
        end
        local v158 = v_u_151
        for _, v159 in ipairs(v158) do
            v159.Visible = true
        end
        task.wait(10)
    end
end)
while task.wait(1) do
    local v160 = v21:WaitForChild("Cash", 5):WaitForChild("Amount", 5)
    local v161 = v_u_1.leaderstats.Cash.Value
    local v162
    if v161 >= 1000000000 then
        local v163 = v161 / 1000000000
        v162 = math.floor(v163) .. "b"
    elseif v161 >= 1000000 then
        local v164 = v161 / 1000000
        v162 = math.floor(v164) .. "m"
    elseif v161 >= 1000 then
        local v165 = v161 / 1000
        v162 = math.floor(v165) .. "k"
    else
        v162 = tostring(v161)
    end
    v160.Text = v162
    v21:WaitForChild("Wins", 5):WaitForChild("Amount", 5).Text = v_u_1:WaitForChild("leaderstats").Wins.Value
end