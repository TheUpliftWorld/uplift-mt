local exhaust_tick = 1000*1000  -- 1 second

local timestamp = {}

stamina.register_on_exhaust_player(function(player, change, reason)
    if type(player) ~= "userdata" or reason == "punch" or change < stamina.settings.exhaust_craft then return end
    local now = minetest.get_us_time()
    local name = player:get_player_name()
    if timestamp[name] then
        if now - timestamp[name] >= exhaust_tick then
            if (stamina.get_saturation(player) or 0) < stamina.settings.starve_lvl then
                timestamp[name] = now
                player:set_hp(player:get_hp() - 1, "exhaust")
            end
        end
    else
        timestamp[name] = now
    end
end)
