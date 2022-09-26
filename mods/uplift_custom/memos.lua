--[[
-- Memo by ShadowNinja
-- License: WTFPL
--]]


local worldpath = minetest.get_worldpath()
local memo = {}
memo.filename = worldpath.."/memos.txt"
memo.memos = {}

function memo:save()
	local file, err = io.open(self.filename, "w")
	if err then
		return err
	end
	file:write(minetest.serialize(self.memos))
	file:close()
end

function memo:load()
	local file, err = io.open(self.filename, "r")
	if err then
		self.memos = self.memos or {}
		return err
	end
	self.memos = minetest.deserialize(file:read("*a"))
	if type(self.memos) ~= "table" then self.memos = {} end
	file:close()
end

memo:load()

minetest.register_on_joinplayer(function(player)
	minetest.after(10, memo.player_print, memo, player:get_player_name())
end)

function memo:player_print(name)
	if not self.memos[name] then
		return
	end
	if #self.memos[name] > 0 then
		minetest.chat_send_player(name, "You have memos!")
		minetest.chat_send_player(name, "Use /memodel to delete them.")
	end
	for i, t in pairs(self.memos[name]) do
		minetest.chat_send_player(name, 
			("Memo %s from %s: %s"):format(i, t.from, t.message))
	end
end

minetest.register_chatcommand("memosend", {
	params = "<player> <message>",
	description = "Send a memo to another player",
	privs = {shout=true},
	func = function(name, params)
		local found, _, toname, msg = params:find("([^%s]+)%s(.+)")
		if not found then
			minetest.chat_send_player(name, "Invalid usage, see /help memosend.")
			return
		end
		if not minetest.auth_table[toname] then
			minetest.chat_send_player(name, "Player does not exist.")
			return
		end
		memo.memos[toname] = memo.memos[toname] or {}
		table.insert(memo.memos[toname], {from=name, message=msg})
		memo:save()
		minetest.chat_send_player(name, "Memo sent!")
	end,
})

minetest.register_chatcommand("memodel", {
	params = "<index>|all",
	description = "Delete your memos",
	privs = {shout=true},
	func = function(name, params)
		local index = tonumber(params)
		if not memo.memos[name] then
			minetest.chat_send_player(name, "You have no memos.")
			return
		end
		if params == "all" then
			memo.memos[name] = nil
			minetest.chat_send_player(name, "All memos deleted.")
			memo:save()
		elseif index then
			if memo.memos[name][index] then
				memo.memos[name][index] = nil
				table.sort(memo.memos[name])
				memo:save()
				minetest.chat_send_player(name, "Memo "..tostring(index).." deleted.")
			else
				minetest.chat_send_player(name,
					"Memo "..tostring(index).." does not exist. (max "
					..tostring(#memo.memos[name])..")")
			end
		else
			minetest.chat_send_player(name, "Invalid usage, see /help memodel.")
		end
	end,
})

minetest.register_chatcommand("memolist", {
	params = "",
	description = "List your memos",
	privs = {shout=true},
	func = function(name, params)
		memo:player_print(name)
	end,
})

