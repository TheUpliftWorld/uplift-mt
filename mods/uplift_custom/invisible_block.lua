
minetest.register_node("uplift_custom:invisible_light_block", {
	description = ("Invisible Light Block"),
    tiles = {"invisible.png","invisible.png","invisible.png","invisible.png","invisible.png","invisible.png"},
	inventory_image = "invisible_light_blocks_icon.png",
	groups = {cracky=3},
	drawtype = "airlike",
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	stack_max = 1,
	light_source = 12,
		selection_box = {
		type = "fixed",
		fixed = {-0.0, -0.0, 7/16, 0.0, 0.0, 0.0}
	},
})

minetest.register_craft({
    type = "shaped",
    output = "uplift_custom:invisible_light_block",
    recipe = {
      {"","",""},
      {"default:glass","default:torch","default:glass"},
      {"","",""},
    },
})


