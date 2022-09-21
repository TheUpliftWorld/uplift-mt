
mobs:register_mob("uplift_custom:banzai", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 1,
	hp_max = 4,
	armor = 500,
	collisionbox = {-0.268, -0.5, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "mobs_banzai.b3d",
	drawtype = "front",
	textures = {
		{"mobs_banzai_grey.png"},
		{"mobs_banzai_brown.png"},
		{"mobs_banzai_white.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	runaway_from = {"mobs_animal:pumba", "player"},
	jump = true,
	jump_height = 6,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 15,
		stand_start = 1,
		stand_end = 15,
		walk_start = 16,
		walk_end = 24,
		punch_start = 16,
		punch_end = 24,
	},
	follow = {"farming:carrot", "farming_plus:carrot_item", "default:grass_1"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)

		-- feed or tame does not reproduce !!
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end

		-- Monty Python tribute
		local item = clicker:get_wielded_item()

		if item:get_name() == "mobs:lava_orb" then

			if not mobs.is_creative(clicker:get_player_name()) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			self.object:set_properties({
				textures = {"mobs_banzai_evil.png"},
			})

			self.type = "monster"
			self.health = 20
			self.passive = false

			return
		end
	end,
	on_spawn = function(self)

		local pos = self.object:get_pos() ; pos.y = pos.y - 1

		-- white snowy banzai
		if minetest.find_node_near(pos, 1,
				{"default:snow", "default:snowblock", "default:dirt_with_snow"}) then
			self.base_texture = {"mobs_banzai_white.png"}
			self.object:set_properties({textures = self.base_texture})
		-- brown desert banzai
		elseif minetest.find_node_near(pos, 1,
				{"default:desert_sand", "default:desert_stone"}) then
			self.base_texture = {"mobs_banzai_brown.png"}
			self.object:set_properties({textures = self.base_texture})
		-- grey stone banzai
		elseif minetest.find_node_near(pos, 1,
				{"default:stone", "default:gravel"}) then
			self.base_texture = {"mobs_banzai_grey.png"}
			self.object:set_properties({textures = self.base_texture})
		end

		return true -- run only once, false/nil runs every activation
	end,
	attack_type = "dogfight",
	damage = 5,
})


