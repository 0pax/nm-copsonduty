QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('nm-copsonduty:getCops', function(source, cb) -- WORKS
  local cops = {}
  for k, v in pairs(QBCore.Functions.GetPlayers()) do
      local ped = QBCore.Functions.GetPlayer(v)

      local t = ped.PlayerData.job.name == "police" and ped.PlayerData.job.onduty

      if t then 
        table.insert(cops, {
            name = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname,
            citizenid = ped.PlayerData.citizenid,
            phone = ped.PlayerData.charinfo.phone,
            grade = ped.PlayerData.job.grade.name
        })
      end
  end
  cb(cops)
end)