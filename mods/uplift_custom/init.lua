
uplift = {}

local MP = minetest.get_modpath("uplift_custom")

-- anticheat stuff
dofile(MP .. "/anti-cheat/inv_move.lua")

-- prejoin log
dofile(MP.."/prejoin.lua")

-- death fix stuff (stolen from https://github.com/BlockySurvival/bls_custom/blob/master/fix_dead_on_login.lua)
dofile(MP.."/fix_dead_on_login.lua")

-- various privileges
dofile(MP.."/privs/common.lua")

-- item/nodes stats
dofile(MP.."/stats.lua")

-- join priv set/revoke
dofile(MP.."/join.lua")

-- general hacks
dofile(MP.."/hacks.lua")

-- account creation control
dofile(MP.."/disallow_new_players.lua")

-- spawn fast walk
if minetest.get_modpath("player_monoids") then
    dofile(MP.."/spawn_fast_walk.lua")
end

-- stamina extras
if minetest.global_exists("stamina") then
    dofile(MP.."/exhaust.lua")
end





