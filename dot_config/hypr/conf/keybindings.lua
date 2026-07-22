-- ~/.config/hypr/conf/keybindings.lua

-- --------------------
-- Variables
-- --------------------
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call "

local terminal = "kitty"
local fileManager = "dolphin"

-- --------------------
-- Keybinds
-- --------------------

-- Standard app & window actions
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind("CONTROL + ALT + DELETE", hl.dsp.exec_cmd("missioncenter"))

-- Media & Brightness (using flags like repeating for smooth hold behavior)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness decrease"),
	{ repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness increase"),
	{ repeating = true }
)

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume increase"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume decrease"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteOutput"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume muteInput"))

-- Screenshots (using Lua raw strings [[ ]] to easily handle nested quotes and pipes)
hl.bind("PRINT", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Noctalia menus
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. "settings toggle"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(ipc .. "launcher clipboard"))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Workspace 0 maps to workspace 10
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Move workspace to another monitor
hl.bind(mainMod .. " + LEFT", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.workspace.move({ monitor = "r" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag / resize threshold config
hl.config({
	binds = {
		drag_threshold = 50,
	},
})

-- Mouse window binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize active window with mainMod + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Workflow binding for note taking & terminal special workspace
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("note"))
hl.bind(mainMod .. " + RETURN", hl.dsp.workspace.toggle_special("terminal"))
