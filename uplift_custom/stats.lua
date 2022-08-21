-- https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
local function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

minetest.after(5, function()
    print("Registered nodes: " .. tablelength(minetest.registered_nodes))
    print("Registered items: " .. tablelength(minetest.registered_items))
    print("Registered entities: " .. tablelength(minetest.registered_entities))
end)
