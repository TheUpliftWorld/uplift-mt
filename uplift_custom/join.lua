minetest.register_on_joinplayer(function(player)
    -- current privs
    local privs = minetest.get_player_privs(player:get_player_name())

    -- true if they were changed
    local privs_changed = false

    -- grant default privs on join
    if not privs.tp then
        privs.tp = true
        privs_changed = true
    end

    if not privs.home then
        privs.home = true
        privs_changed = true
    end

    -- revoke settime from non-admins
    if not privs.privs and privs.settime then
        privs["settime"] = nil
        privs_changed = true
    end

    -- apply privs if changed
    if privs_changed then
        minetest.set_player_privs(player:get_player_name(), privs)
    end

end)

