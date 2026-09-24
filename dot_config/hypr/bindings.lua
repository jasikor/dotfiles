-- Master window layout
o.bind("SUPER + m", "Add master window", hl.dsp.layout("addmaster"))
o.bind("SUPER + SHIFT + m", "Remove master window", hl.dsp.layout("removemaster"))

-- Toggle active workspace between master and dwindle layouts
hl.unbind("SUPER + L") -- was: Toggle workspace layout (omarchy default)
local function toggle_layout()
  local ws = hl.get_active_workspace()
  local next_layout = (ws.tiled_layout == "master") and "dwindle" or "master"
  hl.workspace_rule({ workspace = ws.name, layout = next_layout })
end
o.bind("SUPER + L", "Toggle layout master/dwindle", toggle_layout)

-- Unbind defaults
hl.unbind("SUPER + SHIFT + SPACE")
hl.unbind("SUPER + P")
hl.unbind("SUPER + G")
hl.unbind("SUPER + J")
hl.unbind("SUPER + O")
hl.unbind("SUPER + ALT + S")
hl.unbind("SUPER + S")
hl.unbind("SUPER + CTRL + BACKSPACE")
hl.unbind("SUPER + CTRL + Z")

-- Disable Hyprland window groups
hl.unbind("SUPER + ALT + G")
hl.unbind("SUPER + ALT + LEFT")
hl.unbind("SUPER + ALT + RIGHT")
hl.unbind("SUPER + ALT + UP")
hl.unbind("SUPER + ALT + DOWN")
hl.unbind("SUPER + ALT + TAB")
hl.unbind("SUPER + ALT + SHIFT + TAB")
hl.unbind("SUPER + CTRL + LEFT")
hl.unbind("SUPER + CTRL + RIGHT")
hl.unbind("SUPER + ALT + mouse_down")
hl.unbind("SUPER + ALT + mouse_up")
hl.unbind("SUPER + ALT + code:10")
hl.unbind("SUPER + ALT + code:11")
hl.unbind("SUPER + ALT + code:12")
hl.unbind("SUPER + ALT + code:13")
hl.unbind("SUPER + ALT + code:14")
