
AddEventHandler('playerConnecting', function(name, setCallback, deferrals)

    local steamid  = false
    local license  = false
    local discord  = false
    local xbl      = false
    local liveid   = false
    local ip       = false

  for k,v in pairs(GetPlayerIdentifiers(source))do
        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steamid = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        xbl  = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("live:")) == "live:" then
        liveid = v
      end
    
  end

  if Config.Lang == "it" then

    print("\n^2Connessione Player\nNome: " .. GetPlayerName(source) .. "\nSteam: " .. steamid .. "\nLicense: " .. license .. "\nDiscord: " .. discord .. "\nIP: " .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. "\n^7")

    local log = ' \n **Nome:** ' .. GetPlayerName(source) .. ' \n **Licenza:** ' .. license .. '\n **Steam: **' .. steamid .. '\n **Discord:** ' .. discord .. '\n **IP:** ' .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. '\n\n **Ora & Data:\n Ora:** '..os.date("%H:%M:%S")..'\n **Data:** '..os.date("%d/%m/%Y")

    log_entrate(log)
  elseif Config.Lang == "en" then

    print("\n^2Player Connection\nName: " .. GetPlayerName(source) .. "\nSteam: " .. steamid .. "\nLicense: " .. license .. "\nDiscord: " .. discord .. "\nIP: " .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. "\n^7")

    local log = ' \n **Name:** ' .. GetPlayerName(source) .. ' \n **License:** ' .. license .. '\n **Steam: **' .. steamid .. '\n **Discord:** ' .. discord .. '\n **IP:** ' .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. '\n\n **Time & Date:\n Time:** '..os.date("%H:%M:%S")..'\n **Date:** '..os.date("%d/%m/%Y")

    log_entrate(log)

  end


end)

AddEventHandler('playerDropped', function(reason)

    local steamid  = false
    local license  = false
    local discord  = false
    local xbl      = false
    local liveid   = false
    local ip       = false

  for k,v in pairs(GetPlayerIdentifiers(source))do
        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steamid = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        xbl  = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("live:")) == "live:" then
        liveid = v
      end
    
  end


  if Config.Lang == "it" then
    if reason == "Exiting" then
      reason = "Disconnessione"
    end

    print("\n^1Disconnessione Player\nNome: " .. GetPlayerName(source) .. "\nSteam: " .. steamid .. "\nLicense: " .. license .. "\nDiscord: " .. discord .. "\nIP: " .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. "\nMotivo: " .. reason .. "\n^7")

    local log = ' \n **Nome:** ' .. GetPlayerName(source) .. ' \n **Licenza:** ' .. license .. '\n **Steam: **' .. steamid .. '\n **Discord:** ' .. discord .. '\n **IP:** ' .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. '\n **Motivo: **' .. reason .. '\n\n **Ora & Data:\n Ora:** '..os.date("%H:%M:%S")..'\n **Data:** '..os.date("%d/%m/%Y")

    log_uscite(log)

  elseif Config.Lang == "en" then

    print("\n^1Player Disconnection\nName: " .. GetPlayerName(source) .. "\nSteam: " .. steamid .. "\nLicense: " .. license .. "\nDiscord: " .. discord .. "\nIP: " .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. "\nReason: " .. reason .. "\n^7")

    local log = ' \n **Name:** ' .. GetPlayerName(source) .. ' \n **License:** ' .. license .. '\n **Steam: **' .. steamid .. '\n **Discord:** ' .. discord .. '\n **IP:** ' .. string.match(ip, "ip:(%d+%.%d+%.%d+%.%d+)") .. '\n **Reason: **' .. reason .. '\n\n **Time & Date:\n Time:** '..os.date("%H:%M:%S")..'\n **Date:** '..os.date("%d/%m/%Y")

    log_uscite(log)

  end


end)

-- Entrate || Join Server

function log_entrate(message)
    local embed = {
        ["color"] = Config.Colore_Embed,
        ["title"] = Config.Entrate_Titolo,
        ["description"] = message,
        ["footer"] = {
            ["text"] = "Developing by NotManuTv",
            ["icon_url"] = Config.Immagine
        }
    }
    PerformHttpRequest(Config.Entrate_Weebhook, function(err, text, headers) end, 'POST', json.encode({ ["embeds"] = {embed} }), { ['Content-Type'] = 'application/json' })
end

-- Uscite || Leave Server

function log_uscite(message)

    local embed = {
        ["color"] = Config.Colore_Embed,
        ["title"] = Config.Uscite_Titolo,
        ["description"] = message,
        ["footer"] = {
            ["text"] = "Developing by NotManuTv",
            ["icon_url"] = Config.Immagine
        }
    }
    PerformHttpRequest(Config.Uscite_Weebhook, function(err, text, headers) end, 'POST', json.encode({ ["embeds"] = {embed} }), { ['Content-Type'] = 'application/json' })

end