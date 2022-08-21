
local new_players_allowed = true

minetest.register_chatcommand("disallow_new_players", {
    description = "Disallows the joining of new players",
    privs = { staff = true },
    func = function(name)
        new_players_allowed = false
        return true, "Creation of new accounts disabled"
    end
})

minetest.register_chatcommand("allow_new_players", {
    description = "Allows the joining of new players",
    privs = { staff = true },
    func = function(name)
        new_players_allowed = true
        return true, "Creation of new accounts enabled"
    end
})


minetest.register_on_prejoinplayer(function(name, ip)
    if not minetest.player_exists(name) and not new_players_allowed then
        return "Account creation is currently disabled, please try again later"
    end
end)

