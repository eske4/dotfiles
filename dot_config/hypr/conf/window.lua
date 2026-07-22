-- ~/.config/hypr/conf/layout.lua (or a separate general.lua / layout configuration file)

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = true,

		layout = "scrolling",
	},
})

-- Layer rules configuration
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
