 function batteryInfo(adapter)
     spacer = " "
     local fcur = io.open("/sys/class/power_supply/"..adapter.."/energy_now")    
     local fcap = io.open("/sys/class/power_supply/"..adapter.."/energy_full")
     local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
     local cur = fcur:read()
     local cap = fcap:read()
     local sta = fsta:read()
     local battery = math.floor(cur * 100 / cap)
     if sta:match("Charging") then
         dir = "^"
         battery = "A/C ("..battery..")"
     elseif sta:match("Discharging") then
         dir = "v"
         if tonumber(battery) > 25 and tonumber(battery) < 75 then
             battery = battery
         elseif tonumber(battery) < 25 then
             if tonumber(battery) < 10 then
                 naughty.notify({ title      = "Battery Warning"
                                , text       = "Battery low!"..spacer..battery.."%"..spacer.."left!"
                                , timeout    = 5
                                , position   = "top_right"
                                , fg         = beautiful.fg_focus
                                , bg         = beautiful.bg_focus
                                })
             end
             battery = battery
         else
             battery = battery
         end
     else
         dir = "="
         battery = "A/C"
     end
     batterywidget.text = spacer.."Bat:"..spacer..dir..battery..dir..spacer
     fcur:close()
     fcap:close()
     fsta:close()
 end
