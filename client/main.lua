local cod = {}

cod.Open = function()
    QBCore.Functions.TriggerCallback("nm-copsonduty:getCops", function(result)
        local cops = json.encode(result)
        SendNUIMessage({
            action = "open",
            cops = cops
        })
        SetNuiFocus(true, true)
    end)
end

cod.Close = function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)


RegisterCommand("cod", function(source)
    if isCop() then
        cod.Open()
    else
        QBCore.Functions.Notify("You're not a cop", "error", 3000) 
    end
end, false)
    
function isCop()
    local Player = QBCore.Functions.GetPlayerData()
    local jobName = Player.job.name

    if jobName == "police" then
        return true
    end

    return false
end

