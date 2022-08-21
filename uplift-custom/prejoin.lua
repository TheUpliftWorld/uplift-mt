minetest.register_on_prejoinplayer(function(name, ip)
    minetest.log("action", "Player " .. name .. " prejoins from " .. ip)
end)
