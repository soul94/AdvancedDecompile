spawn(function()
    repeat task.wait() until game:IsLoaded()
    
    local Amplitude = 200
    local RandomValue = {-15,15}
    local RandomTime = {.5, 1.5}
    
    local floor = math.floor
    local cos = math.cos
    local sin = math.sin
    local acos = math.acos
    local pi = math.pi
    
    local Maxima = 0
    
    --Waiting for gcinfo to decrease
    while task.wait() do
        if gcinfo() >= Maxima then
            Maxima = gcinfo()    
        else
            break    
        end    
    end
    
    task.wait(0.30)
    
    local OldGcInfo = gcinfo()+Amplitude
    local tick = 0
    
    --Spoofing gcinfo
    local Old; Old = hookfunction(gcinfo, function(...)
        local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude ) 
        return floor(OldGcInfo + Formula) 
    end)
    local Old2; Old2 = hookfunction(collectgarbage, function(arg, ...)
        if arg == "collect" then
            return gcinfo(...)
        end
        return Old2(arg, ...)
    end)
    
    
    game:GetService("RunService").Stepped:Connect(function()
        local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude ) 
        if Formula > ((acos(cos(pi * (tick)+.01))/pi * (Amplitude * 2)) + -Amplitude ) then
            tick = tick + .07
        else
            tick = tick + 0.01
        end
    end)
    
    local old1 = Amplitude
    for i,v in next, RandomTime do
        RandomTime[i] = v * 10000
    end
    
    local RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000
    
    while wait(RandomTime) do
        Amplitude = math.random(old1+RandomValue[1], old1+RandomValue[2])
        RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000
    end
end)
