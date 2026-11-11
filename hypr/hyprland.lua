-----------------------------------------------------------------------------------------
-- HYPRLAND LUA CONFIGURATION (Hyprland v0.57+)
-- Optimisée pour développement web mobile & multi-moniteur (AZERTY FR)
-- Basée sur la configuration initiale hyprland.conf (v0.53.3) adaptée pour Hyprland 0.57+
-----------------------------------------------------------------------------------------

------------------
---- MONITORS ----
------------------

-- Écran principal (PC portable) - 1600x900 à gauche
hl.monitor({
    output   = "eDP-1",
    mode     = "1600x900@60",
    position = "0x0",
    scale    = "1",
})

-- Second écran (externe) - 1920x1080 à droite
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "1600x0",
    scale    = "1",
})

-- Fallback pour configuration automatique / tout écran externe additionnel
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun -config ~/.config/rofi/config.rasi"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("/usr/lib/kdeconnectd &")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("swayidle -w timeout 600 'hyprlock' timeout 900 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'")
    
    -- Configuration multi-moniteur automatique
    hl.exec_cmd("sleep 2 && ~/.config/hypr/monitor-setup.sh")

    -- Workspace 1 — Navigation & Notes (écran laptop)
    hl.exec_cmd("[workspace 1 silent] brave --restore-last-session")
    hl.exec_cmd("[workspace 1 silent] brave --incognito --new-window \"https://aistudio.google.com/app/apps/drive/1VHH-pkegs_QMyUy8PHAHFys75cpQp-r1?showPreview=true&showAssistant=true\"")
    hl.exec_cmd("sleep 2 && hyprctl dispatch exec \"[workspace 1 silent] obsidian\"")

    -- Workspace 2 — Développement (écran externe)
    hl.exec_cmd("sleep 3 && hyprctl dispatch exec \"[workspace 2 silent] antigravity\"")

    -- Workspace 3 — Terminaux (écran externe)
    hl.exec_cmd("sleep 1 && hyprctl dispatch exec \"[workspace 3 silent] kitty btop\"")
    hl.exec_cmd("sleep 1 && hyprctl dispatch exec \"[workspace 3 silent] kitty fish -C fastfetch\"")
    hl.exec_cmd("sleep 1 && hyprctl dispatch exec \"[workspace 3 silent] kitty fish -C 'yay -Syu --noconfirm && sudo pacman -Sc --noconfirm && sudo rm -rf /var/cache/pacman/pkg/download-*'\"")

    -- Workspace 4 — Communication (écran externe)
    hl.exec_cmd("sleep 4 && hyprctl dispatch exec \"[workspace 4 silent] kdeconnect-app\"")
    hl.exec_cmd("sleep 1 && hyprctl dispatch exec \"[workspace 4 silent] kitty yazi\"")

    -- Scratchpad
    hl.exec_cmd("sleep 4 && hyprctl dispatch exec \"[workspace special:scratchpad silent] kitty\"")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("EDITOR", "code")
hl.env("BROWSER", "brave")
hl.env("TERMINAL", "kitty")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("NODE_OPTIONS", "--max-old-space-size=4096")
hl.env("CHROME_EXECUTABLE", "/usr/bin/brave")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in           = 4,
        gaps_out          = 5,
        gaps_workspaces   = 50,
        border_size       = 1,
        col = {
            active_border   = { colors = {"rgba(74c7ecee)", "rgba(89b4faee)"}, angle = 45 },
            inactive_border = "rgba(45475aaa)",
        },
        resize_on_border  = true,
        no_focus_fallback = true,
        allow_tearing     = true,
        layout            = "dwindle",
        snap = {
            enabled      = true,
            window_gap   = 4,
            monitor_gap  = 5,
            respect_gaps = true,
        },
    },

    decoration = {
        rounding         = 12,
        rounding_power   = 2.0,
        active_opacity   = 1.0,
        inactive_opacity = 0.95,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
        dim_inactive = true,
        dim_strength = 0.05,
        dim_special  = 0.07,
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        force_split    = 2,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
        vrr                     = 1,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms  = true,
        disable_autoreload      = false,
        focus_on_activate       = true,
        enable_swallow          = true,
        swallow_regex           = "^(kitty|Alacritty|antigravity)$",
    },

    debug = {
        vfr = true,
    },

    input = {
        kb_layout          = "fr",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "",
        kb_rules           = "",
        follow_mouse       = 1,
        sensitivity        = 0,
        numlock_by_default = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.curve("myBezier", { 
    type = "bezier", 
    points = { {0.05, 0.9}, {0.1, 1.05} } 
})

hl.animation({ leaf = "windows",     enabled = true,  speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true,  speed = 3, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true,  speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "borderangle", enabled = true,  speed = 4, bezier = "myBezier" })
hl.animation({ leaf = "fade",        enabled = true,  speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "workspaces",  enabled = true,  speed = 3, bezier = "myBezier" })

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- ── Applications principales ───────────────────────────────────────────────
hl.bind(mainMod .. " + Return",        hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + A",             hl.dsp.exec_cmd("brave --new-window"))
hl.bind(mainMod .. " + SHIFT + A",     hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + S",             hl.dsp.exec_cmd("antigravity"))
hl.bind(mainMod .. " + SHIFT + S",     hl.dsp.exec_cmd("antigravity ~/.config"))
hl.bind(mainMod .. " + D",             hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F",             hl.dsp.window.fullscreen({ action = "toggle" }))

-- ── Gestion des fenêtres & Workflow développement ──────────────────────────
hl.bind(mainMod .. " + Q",             hl.dsp.window.close())
hl.bind(mainMod .. " + W",             hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + W",     hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd("brave --app=https://github.com"))
hl.bind(mainMod .. " + SHIFT + E",     hl.dsp.exec_cmd("kitty --hold -e lazygit"))
hl.bind(mainMod .. " + R",             hl.dsp.reload_config())
hl.bind(mainMod .. " + T",             hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + V",             hl.dsp.window.pseudo())
hl.bind(mainMod .. " + semicolon",     hl.dsp.layout("togglesplit"))

-- ── Outils & Actions fréquentes ────────────────────────────────────────────
hl.bind(mainMod .. " + G",             hl.dsp.exec_cmd("hyprpicker -a -f hex"))
hl.bind(mainMod .. " + SHIFT + G",     hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + C",             hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + Z",             hl.dsp.exec_cmd("docker-desktop"))
hl.bind(mainMod .. " + X",             hl.dsp.exec_cmd("brave --app=https://www.figma.com"))
hl.bind(mainMod .. " + B",             hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + SHIFT + B",     hl.dsp.exec_cmd("brave --incognito"))
hl.bind(mainMod .. " + N",             hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + M",             hl.dsp.exit())
hl.bind(mainMod .. " + slash",         hl.dsp.exec_cmd("hyprlock"))

-- ── Navigation des fenêtres Vim-style (H, J, K, L) ─────────────────────────
hl.bind(mainMod .. " + H",             hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",             hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",             hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",             hl.dsp.focus({ direction = "right" }))

-- Flèches alternatives de focus
hl.bind(mainMod .. " + left",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up",            hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right",         hl.dsp.focus({ direction = "right" }))

-- ── Déplacement des fenêtres Vim-style (Shift + H, J, K, L) ────────────────
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))

-- Flèches alternatives pour déplacer fenêtre
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))

-- ── Redimensionnement actif (Ctrl + H, J, K, L) ────────────────────────────
hl.bind(mainMod .. " + CTRL + H",      hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + L",      hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K",      hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
hl.bind(mainMod .. " + CTRL + J",      hl.dsp.window.resize({ x = 0, y = 40, relative = true }))

-- ── Navigation des workspaces ──────────────────────────────────────────────
hl.bind(mainMod .. " + TAB",           hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + TAB",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + comma",         hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + period",        hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + Page_Up",       hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + Page_Down",     hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_down",    hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",      hl.dsp.focus({ workspace = "e-1" }))

-- ── Workspaces numériques 1 à 10 (Clavier AZERTY FR & Keycodes) ───────────
local azertyWorkspaces = {
    { sym = "ampersand",  code = "code:10", ws = 1 },
    { sym = "eacute",     code = "code:11", ws = 2 },
    { sym = "quotedbl",   code = "code:12", ws = 3 },
    { sym = "apostrophe", code = "code:13", ws = 4 },
    { sym = "parenleft",  code = "code:14", ws = 5 },
    { sym = "section",    code = "code:15", ws = 6 },
    { sym = "egrave",     code = "code:16", ws = 7 },
    { sym = "exclam",     code = "code:17", ws = 8 },
    { sym = "ccedilla",   code = "code:18", ws = 9 },
    { sym = "agrave",     code = "code:19", ws = 10 },
}

for _, item in ipairs(azertyWorkspaces) do
    -- Aller au workspace (Super + symbole & Super + code)
    hl.bind(mainMod .. " + " .. item.sym,          hl.dsp.focus({ workspace = item.ws }))
    hl.bind(mainMod .. " + " .. item.code,         hl.dsp.focus({ workspace = item.ws }))

    -- Déplacer vers workspace (Super + Shift + symbole & code)
    hl.bind(mainMod .. " + SHIFT + " .. item.sym,  hl.dsp.window.move({ workspace = item.ws }))
    hl.bind(mainMod .. " + SHIFT + " .. item.code, hl.dsp.window.move({ workspace = item.ws }))

    -- Déplacer silencieusement vers workspace (Super + Alt + symbole & code)
    hl.bind(mainMod .. " + ALT + " .. item.sym,    hl.dsp.window.move({ workspace = item.ws, silent = true }))
    hl.bind(mainMod .. " + ALT + " .. item.code,   hl.dsp.window.move({ workspace = item.ws, silent = true }))
end

-- ── Workspaces spéciaux (Scratchpads) ──────────────────────────────────────
hl.bind(mainMod .. " + U",             hl.dsp.workspace.toggle_special("dev-tools"))
hl.bind(mainMod .. " + SHIFT + U",     hl.dsp.window.move({ workspace = "special:dev-tools" }))

hl.bind(mainMod .. " + Y",             hl.dsp.workspace.toggle_special("notes"))
hl.bind(mainMod .. " + SHIFT + Y",     hl.dsp.window.move({ workspace = "special:notes" }))

hl.bind(mainMod .. " + I",             hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + I",     hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + Return",  hl.dsp.window.move({ workspace = "special:scratchpad" }))

-- ── Gestion multi-moniteur ─────────────────────────────────────────────────
hl.bind(mainMod .. " + SHIFT + O",     hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + P",     hl.dsp.window.move({ monitor = "-1" }))
hl.bind(mainMod .. " + CTRL + O",      hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + CTRL + P",      hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(mainMod .. " + CTRL + M",      hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + CTRL + B",      hl.dsp.exec_cmd("killall waybar; waybar &"))

-- ── Souris (drag & resize) ─────────────────────────────────────────────────
hl.bind(mainMod .. " + mouse:272",     hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",     hl.dsp.window.resize(), { mouse = true })

-- ── Touches multimédia ─────────────────────────────────────────────────────
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ── Screenshots & Capture ──────────────────────────────────────────────────
hl.bind("Print",                 hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + Print",   hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- ── Volume et luminosité (sans touches Fn) ─────────────────────────────────
hl.bind(mainMod .. " + equal",         hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind(mainMod .. " + minus",         hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { repeating = true })
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd("brightnessctl set 5%+"),                          { repeating = true })
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd("brightnessctl set 5%-"),                          { repeating = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Workspaces réguliers (Écran portable WS1, Écran externe WS2 à WS10)
hl.workspace_rule({ workspace = "1",  monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2",  monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "3",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "7",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })

-- Workspaces spéciaux
hl.workspace_rule({ workspace = "special:dev-tools", gaps_out = 20, gaps_in = 10 })
hl.workspace_rule({ workspace = "special:notes",     gaps_out = 20, gaps_in = 10 })
hl.workspace_rule({ workspace = "special:magic",     gaps_out = 20, gaps_in = 10 })
hl.workspace_rule({ workspace = "special:scratchpad", gaps_out = 20, gaps_in = 10 })

-- Règles pour fenêtres
hl.window_rule({
    name      = "antigravity-workspace-2",
    match     = { class = "^(antigravity)$" },
    workspace = "2 silent",
})

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
