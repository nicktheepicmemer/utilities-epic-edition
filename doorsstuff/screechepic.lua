local v3 = game:GetService("TweenService")
local v6 = script:FindFirstAncestor("MainUI")
local v8 = game.Players
local v9 = v8.LocalPlayer
v8 = 0
return function(p1, p2, p3)
    local v12 = game.ReplicatedStorage.Entities
    local v14 = v12.Screech:Clone()
    local v17 = math.random(-1, 1)
    local v220 = v17 * 2
    local v221 = p1.dead
    if not v221 then
        return 
    end
    v221 = 0
    if v221 > v220 then
        v220 = -1.1
    end
    v221 = v8
    v221 = v221 + 1
    v8 = v221
    local v222 = v8
    local v29 = p1.finalCamCFrame.LookVector * Vector3.new(-1, 0, -1) + Vector3.new(0, v220, 0).unit
    local v227 = p1.finalCamCFrame.p
    local v33 = CFrame.new(v227 + v29 * 4, v227)
    v14:SetPrimaryPartCFrame(v33 * CFrame.new(0, 0.5, 0))
    local v40 = p1.cam
    v14.Parent = v40
    local v229 = {}
    local v42, v43, v33 = pairs(v14.Animations:GetChildren())
    for v38, v46 in v42, v43, v33 do
        local v47 = v46:IsA("Animation")
        if not v47 then
            v47 = v46.Name
            v40[v47] = v14.AnimationController:LoadAnimation(v46)
        end
    end
    v42 = tick
    local v51 = v42()
    v43 = v229.Idle
    v43:Play()
    v46 = 1
    v47 = 5
    v33 = math.random(v46, v47) / 6
    delay(v33, function()
        v14.Root.Sound:Play()
    end)
    v50 = 1
    local v62 = math.random(v50, 10)
    local v63 = v62 / 5
    local v64 = 6.5 + v63
    local v235 = v14.PrimaryPart.CFrame
    local v236 = true
    local v65 = false
    local v66 = false
    local v67 = false
    local v68 = 0
    local v70 = v9.Character
    local v71 = v70.Humanoid
    v70 = v9.Character.PrimaryPart
    local v102 = (game:GetService("RunService")):BindToRenderStep("screechStuff" .. v222, 100, function(p4)
        local v78 = v66
        if v78 then
            v78 = v14.PrimaryPart
            v78.CFrame = v63
        else
            v78 = game
            (v78:GetService("RunService")):UnbindFromRenderStep("screechStuff" .. v17)
        end
        local v85 = v62
        if not v85 then
            v82 = p1
            v79 = v82.finalCamCFrame.LookVector
            v85 = v79.unit
            v83 = v29
            v82 = v85 - v83
            v79 = v82.Magnitude * 100
            v83 = math.clamp
            local v90 = v83(50 - v79, 0, 50)
            v82 = v90 / 50
            v12.Brightness = v82
            local v99 = 35
            if v99 > v79 then
                v99 = v68
                v99 = v99 + p4
                v68 = v99
            end
            local v100 = v68
            v82 = 0.1
            if v82 < v100 then
                v82 = v71
                v100 = v82.Parent
                v90 = "Hiding"
                local v91 = v100:GetAttribute(v90)
                if not v91 then
                    v91 = true
                    v65 = v91
                end
                v82 = game.ReplicatedStorage.GameData.EntityDisableScreech
                local v101 = v82.Value
                if v101 then
                    v82 = v70
                    v101 = v82.Anchored
                    if v101 then
                        v82 = v71
                        v101 = v82.Health
                        v82 = 1
                        if v82 > v101 then
                            v101 = true
                            v67 = v101
                            v101 = false
                            v65 = v101
                            v101 = 0
                            v64 = v101
                        end
                        return 
                    end
                end
            end
        end
    end)
    p1.camShaker:ShakeOnce(0.5, 12, 3, 1)
    local v107 = 1
    local v108 = 1000000
    local v109 = 1
    for v107 = v107, v108, v109 do
        task.wait()
        local v112 = p1.finalCamCFrame.p
        v63 = CFrame.new(v112 + v29 * 3.5, v112) * CFrame.new(0, 0.5, 0)
        if tick() + v64 <= tick() then
            break
        end
        if v65 then
            break
        end
    end
    v108 = tick
    local v123 = v108()
    v107 = v14.PrimaryPart
    v109 = v107.CFrame
    if v67 then
        v107 = p1.tool
        if not v107 then
            v112 = p1.tool
            v107 = v112.Name
        end
        v107 = v71.Health
        v112 = 1
        if v112 > v107 then
            v107 = CFrame.new
            v111 = 0
            v122 = 0
            v121 = 0
            v112 = Vector3.new
            local v127, v128, v129 = (v107(v112(v111, v122, v121), v29)):ToOrientation()
            local v135 = math.abs(p1.ax - math.deg(v128))
            local v136 = 180
            if v135 > v136 then
                v135 = p1.ax_t
                v135 = v135 - 360
                p1.ax_t = v135
            end
            v136 = v128
            p1.ax_t = math.deg(v136)
            p1.ay_t = math.deg(v127)
            wait(0.2)
            game.Players.LocalPlayer.Character.Humanoid.Health -= 40
        else
            v134 = game
            v129 = v134.ReplicatedStorage
            v128 = v129.EntityInfo
            v127 = v128.Screech
            v129 = v65
            v127:FireServer(v129)
            if not v65 then
                v229.Caught:Play()
                v128 = script
                v128.Caught:Play()
                v134 = 42
                p1.camShaker:ShakeOnce(6, v134, 0, 1)
            else
                v229.Attack:Play()
                v128 = script
                v128.Attack:Play()
                p1.camShaker:ShakeOnce(8, 42, 0, 1)
            end
            v128 = v14.Root
            v128.Sound:Stop()
            v14.Base.Attachment.PointLight.Brightness = 1
            v128 = Vector3.new
            local v167, v168, v169 = (CFrame.new(v128(0, 0, 0), v29)):ToOrientation()
            local v175 = math.abs(p1.ax - math.deg(v168))
            local v176 = 180
            if v175 > v176 then
                v175 = p1.ax_t
                v175 = v175 - 360
                p1.ax_t = v175
            end
            v176 = v168
            p1.ax_t = math.deg(v176)
            p1.ay_t = math.deg(v167)
            v236 = false
            local v180 = 1
            local v258 = 1000000
            local v181 = 1
            for v180 = v180, v258, v181 do
                v141 = task.wait
                v141()
                local v183 = p1.finalCamCFrame.p
                v63 = v109:Lerp(CFrame.new(v183 + v29 * 3.5, v183) * CFrame.new(0, 0.5, 0), v3:GetValue(tick() - v123 / 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In))
                if v123 + 0.1 <= tick() then
                    break
                end
            end
            v258 = tick
            v183 = 1
            v181 = 1000000
            v180 = 1
            for v183 = v183, v181, v180 do
                v182 = task.wait
                v182()
                v197 = CFrame.new
                v202 = p1.finalCamCFrame.Position
                v201 = v202 + p1.finalCamCFrame.LookVector * 3
                v202 = p1.finalCamCFrame.Position
                v63 = v197(v201, v202) * CFrame.new(0, 0.5, 0)
                if v258() + 2 <= tick() then
                    break
                end
            end
        end
        v66 = true
        v14:Destroy()
        v169 = "RunService"
        v174 = "screechStuff"
        v203 = v222
        (game:GetService(v169)):UnbindFromRenderStep(v174 .. v203)
        return 
    end
end
