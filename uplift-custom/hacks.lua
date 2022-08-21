

-- the pathfinder is highly unreliable and grinds the server to a halt sometimes
-- see: https://github.com/minetest/minetest/issues/8584
-- lobodomizing on this end to make the mobs_* packages updateable again
minetest.find_path = function()
    return nil
end

-- https://github.com/minetest/minetest/pull/9350
-- Workaround for bug https://www.lua.org/bugs.html#5.2.3-1
-- thx HybridDog ;)
local actual_unpack = unpack
function unpack(t, a, b)
    assert(not b or b < 2^30)
    return actual_unpack(t, a, b)
end

-- unregister ip-ban command (use xban instead)
-- there are still problems with the ipv6 range comming in from a single ipv4 ip
-- minetest.unregister_chatcommand("ban")

-- prevent big towers of papyrus and bamboo from being auto-dug
-- https://github.com/pandorabox-io/pandorabox.io/issues/611
function default.dig_up(pos, node, digger)
    if digger == nil then return end
    local np = {x = pos.x, y = pos.y + 1, z = pos.z}
    local nn = minetest.get_node(np)
    if nn.name == node.name then
        local dp = digger:get_pos()
        if (np.y - dp.y) <= 10 then
            minetest.node_dig(np, nn, digger)
        end
    end
end

-- change moreblocks texture used by advtrains_platform to the renamed one
-- https://github.com/minetest-mods/moreblocks/blob/3b97ea5/stairsplus/registrations.lua#L144
if minetest.get_modpath("moreblocks") then
    local texture = "moreblocks_checker_stone_tile.png"
    local sizes = {
        "0510", "0520", "0525", "1010", "1020",
        "1025", "2020", "2025", "2525",
    }
    for _,n in pairs(sizes) do
        local node1 = "advtrains_platform:stone_tile_altpath_track_"..n
        if minetest.registered_nodes[node1] then
            minetest.override_item(node1, {
                tiles = {texture}
            })
        end
        local node2 = "advtrains_platform:stone_tile_altpath_track_narrow_"..n
        if minetest.registered_nodes[node2] then
            minetest.override_item(node2, {
                tiles = {texture}
            })
        end
    end
end

