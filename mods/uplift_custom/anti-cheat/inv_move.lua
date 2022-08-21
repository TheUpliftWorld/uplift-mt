minetest.register_allow_player_inventory_action(function(player, action, inventory, inventory_info)
  local inventory_location = inventory:get_location()
  if inventory_location.type == "player" and inventory_location.name ~= player:get_player_name() then
    return 0
  end
end)
