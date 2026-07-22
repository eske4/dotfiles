-- ~/.config/hypr/conf/autostart.lua

-- ---------------------------
-- Miscs, Tray & Clipboard
-- ---------------------------
hl.on("hyprland.start", function()
	-- Misc startup services
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("udiskie &")

	-- Tray applications
	hl.exec_cmd("qs -c noctalia-shell")

	-- Clipboard daemon history
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Screen sharing environment synchronization
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- ---------------------------
	-- Workflow apps
	-- ---------------------------
	hl.exec_cmd("[workspace special:note silent] obsidian")
	hl.exec_cmd("[workspace special:note silent] kitty --directory ~/Obsidian")
	hl.exec_cmd("[workspace special:terminal silent] kitty")
end)
