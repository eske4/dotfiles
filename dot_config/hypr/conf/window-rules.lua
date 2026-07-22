-- ~/.config/hypr/conf/window-rules.lua

-- ======================
-- Floating Window Rules
-- ======================
hl.window_rule({
	match = {
		class = "^(blueman-manager|nm-connection-editor|steam|org.pulseaudio.pavucontrol|io.missioncenter.MissionCenter|nwg-displays|nwg-look|virt-manager)$",
	},
	float = true,
})

-- ======================
-- Window Size Rules
-- ======================
hl.window_rule({
	match = {
		class = "^(org.pulseaudio.pavucontrol|io.missioncenter.MissionCenter|blueman-manager|nm-connection-editor)$",
	},
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
})

hl.window_rule({
	match = { class = "^(virt-manager)$", title = "^(.*Virtual Machine.*)$" },
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
})

-- ======================
-- Center Windows
-- ======================
hl.window_rule({
	match = { class = "^(obsidian|steam)$" },
	center = true,
})

-- ======================
-- Workspace Assignments
-- ======================
hl.window_rule({ match = { class = "^(kitty|Code|vscodium)$" }, workspace = "1" })
hl.window_rule({ match = { class = "^(obsidian)$" }, workspace = "special:note" })
hl.window_rule({ match = { class = "^(firefox|chromium|librewolf)$" }, workspace = "2" })
hl.window_rule({ match = { class = "^(steam|steam_app_.*)$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(discord)$" }, workspace = "4" })
hl.window_rule({ match = { class = "^(com.bitwig.BitwigStudi|krita)$" }, workspace = "5" })
hl.window_rule({ match = { class = "^(virt-manager|VirtualBox|vmware|qemu)$" }, workspace = "6" })

-- ======================
-- Special Behaviors
-- ======================
hl.window_rule({
	match = { class = "^(steam_app)$" },
	immediate = true,
})

-- Ignore maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = { 20, "monitor_h-120" },
	float = true,
})
