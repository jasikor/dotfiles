-- Application bindings
o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new')
o.bind("SUPER + RETURN", "Terminal", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"')
o.bind("SUPER + SHIFT + RETURN", "Browser", "omarchy-launch-browser")
o.bind("SUPER + SHIFT + F", "File manager", "uwsm-app -- nautilus --new-window")
o.bind(
	"SUPER + ALT + SHIFT + F",
	"File manager (cwd)",
	'uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"'
)
o.bind("SUPER + SHIFT + B", "Browser", "omarchy-launch-browser")
o.bind("SUPER + ALT + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")
o.bind("SUPER + SHIFT + N", "Editor", "omarchy-launch-editor")
o.bind("SUPER + SHIFT + T", "Activity", "omarchy-launch-tui btop")
o.bind("SUPER + SHIFT + D", "Docker", "omarchy-launch-tui lazydocker")
o.bind("SUPER + SHIFT + O", "Obsidian", 'omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"')
o.bind("SUPER + SHIFT + W", "Typora", "uwsm-app -- typora --enable-wayland-ime")
o.bind("SUPER + SHIFT + SLASH", "Passwords", "uwsm-app -- 1password")

-- Web apps
o.bind("SUPER + SHIFT + A", "ChatGPT", 'omarchy-launch-webapp "https://chatgpt.com"')
o.bind("SUPER + ALT + SHIFT + A", "Grok", 'omarchy-launch-webapp "https://grok.com"')
-- o.bind("SUPER + SHIFT + C", "Calendar", "omarchy-launch-webapp \"https://app.hey.com/calendar/weeks/\"")
o.bind("SUPER + SHIFT + E", "Email", 'omarchy-launch-webapp "https://app.hey.com"')
o.bind("SUPER + SHIFT + Y", "YouTube", 'omarchy-launch-webapp "https://youtube.com/"')
o.bind("SUPER + ALT + SHIFT + G", "WhatsApp", 'omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"')
o.bind(
	"SUPER + CTRL + SHIFT + G",
	"Google Messages",
	'omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"'
)
o.bind(
	"SUPER + SHIFT + P",
	"Google Photos",
	'omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"'
)
o.bind("SUPER + SHIFT + X", "X", 'omarchy-launch-webapp "https://x.com/"')
o.bind("SUPER + ALT + SHIFT + X", "X Post", 'omarchy-launch-webapp "https://x.com/compose/post"')

-- Master window layout
o.bind("SUPER + m", "Add master window", hl.dsp.layout("addmaster"))
o.bind("SUPER + SHIFT + m", "Remove master window", hl.dsp.layout("removemaster")) --

-- Unbind defaults
hl.unbind("SUPER + L")
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
