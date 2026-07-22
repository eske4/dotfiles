-- ~/.config/hypr/hyprland.lua

-- -----------------------------------------------------
-- Load pywal color file & modular configuration
-- -----------------------------------------------------

-- If your pywal file generates a Lua module, or you use require:
--require("noctalia/noctalia-colors")

-- Environment & Autostart
require("conf/environment")
require("conf/autostart")

-- Plugins
-- require("conf/plugin_settings")

-- Keyboard and bindings
require("conf/keybindings")
require("conf/keyboard")

-- Monitor configuration
require("monitors")
require("workspaces")

-- Hyprland UI config
require("conf/window")
require("conf/decorations")
require("conf/animations")
require("conf/layout")
require("conf/window-rules")
require("conf/misc")
