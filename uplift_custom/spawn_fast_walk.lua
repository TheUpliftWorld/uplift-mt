

local spawn_pos = minetest.string_to_pos(minetest.settings:get("static_spawnpoint") or "(0, 0, 0)")
local range = 150

local player_map = {} -- playername => boolean

minetest.register_on_leaveplayer(function(player)
    player_map[player:get_player_name()] = nil
end)

local timer = 0
minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < 1 then
        return
    end

    timer = 0

    for _, player in ipairs(minetest.get_connected_players()) do
        local playername = player:get_player_name()
        local ppos = player:get_pos()

        local is_in_center = vector.distance(spawn_pos, ppos) < range

        if is_in_center and not player_map[playername] then
            -- moved to spawn
            player_monoids.speed:add_change(player, 2, "spawn_fast")
            player_map[playername] = true
        elseif not is_in_center and player_map[playername] then
            -- moved out of spawn
            player_monoids.speed:del_change(player, "spawn_fast")
            player_map[playername] = nil
        end
    end


end)

