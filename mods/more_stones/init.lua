-- Please leave a review on Content Data Base
minetest.register_node("more_stones:dense_stone", {
	description = ("Dense Stone"), 
	tiles = {"dense_stone.png"},
	drop = {"default:stone"},
	groups = {cracky = 3, stone = 1, level = 2}, 
	sounds = default.node_sound_stone_defaults(),
})
	
minetest.register_craft({
	output = "more_stones:dense_stone 4",
	recipe = {
		{"default:stone_block", "default:stone"},
		{"default:stone", "default:stone_block"}, 
	}
})

minetest.register_node("more_stones:marble", {
	description = ("Marble"),
	tiles = {"marble.png"},
	drop = {"more_stones:marble_rock"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "more_stones:marble",
	recipe = {
		{"more_stones:marble_rock", "more_stones:marble_rock"},
		{"more_stones:marble_rock", "more_stones:marble_rock"},
	}
})

minetest.register_craftitem("more_stones:marble_rock", {
	description = "Marble Rock",
	inventory_image = "marble_rock.png"
})

minetest.register_node("more_stones:polished_marble", {
	description = ("Polished Marble"),
	tiles = {"polished_marble.png"},
	drop = {"more_stones:polished_marble"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "more_stones:polished_marble",
	recipe = {
		{"more_stones:marble", "more_stones:marble_rock"},
		{"more_stones:marble_rock", "more_stones:marble"},
	}
})

minetest.register_node("more_stones:sedimentary_rock", {
	description = ("Sedimentary Rock"),
	tiles = {"sedimentary_rock.png"},
	groups = {cracky = 2, crumbly = 1, not_in_creative_inventory = 1}, --blocks without a recipe are for learning purpouses. Use as examples of what certain types of rocks look like
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("more_stones:igneous_rock", {
	description = ("Igneous Rock"),
	tiles = {"igneous_rock.png"},
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("more_stones:metamorphic_rock", {
	description = ("Metamorphic Rock"),
	tiles = {"metamorphic_rock.png"},
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("more_stones:shell", {
	description = "Shells",
	inventory_image = "shell.png",
})

minetest.register_node("more_stones:coquina", {
	description = ("Coquina"),
	tiles = {"coquina.png"},
	groups = {cracky = 2, crumbly = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "more_stones:coquina",
	type = "shapeless",
	recipe = {
		"more_stones:shell",
		"more_stones:shell",
		"more_stones:shell",
		"more_stones:shell",
	},
})

minetest.register_node("more_stones:lime_stone", {
	description = ("Limestone"),
	tiles = {"limestone.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craftitem("more_stones:bone", {
	description = "Bone",
	inventory_image = "bone.png",
})

