--> Bindings

local mainMod = "SUPER"

--> Global Bindings
-- hl.bind(mainMod .. " + R", hl.dsp.pass({
--     window = "class:^(discord)$"
-- }))
hl.bind(mainMod .. "+ R", hl.dsp.global("discord:discord-push-to-talk"), {
    non_consuming = false
})

-- Main Binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(appPicker))
hl.bind(mainMod .. " + M", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({action = "toggle"}), {description = "Float/Tile"} )
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({"maximize"}), {description = "Fullscreen"} )
hl.bind("ALT + CONTROL + DELETE", hl.dsp.exec_cmd(logoutMenu))

-- Vim Motions Window Focus / Movement
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j",  hl.dsp.window.move({ direction = "down" }))

-- Workspace Movement
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Pinning
hl.bind(mainMod .. " + P", hl.dsp.window.pin({ action = "toggle" }))

-- Scratchy
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Window Resizing / Moving

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Window Resizing
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.resize({ x =  25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = 0, y =  25, relative = true }), { repeating = true})
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true})

-- Window Positioning

hl.bind(mainMod .. " + ALT + h", hl.dsp.window.move({ x = -25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + ALT + l", hl.dsp.window.move({ x =  25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.move({ x = 0, y = -25, relative = true }), { repeating = true})
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.move({ x = 0, y =  25, relative = true }), { repeating = true})

-- Extras
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + SHIFT + EQUAL", hl.dsp.exec_cmd(wsk))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd(emojiPicker))
hl.bind(mainMod .. " + SHIFT + Period", hl.dsp.exec_cmd(kamojiPicker))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(screenShot))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(controlPanel))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(colorPicker))

--> Input Remaps

-- Alt + hjkl for arrow keys
hl.bind("ALT + H", hl.dsp.send_shortcut({ mods = "", key = "left" }))
hl.bind("ALT + J", hl.dsp.send_shortcut({ mods = "", key = "down" }))
hl.bind("ALT + K", hl.dsp.send_shortcut({ mods = "", key = "up" }))
hl.bind("ALT + L", hl.dsp.send_shortcut({ mods = "", key = "right" }))

-- -- Shift + Alt + hjkl to send Shift + Arrow keys (for selection, etc.)
hl.bind("ALT + SHIFT + H", hl.dsp.send_shortcut({ mods = "SHIFT", key = "left" }))
hl.bind("ALT + SHIFT + J", hl.dsp.send_shortcut({ mods = "SHIFT", key = "down" }))
hl.bind("ALT + SHIFT + K", hl.dsp.send_shortcut({ mods = "SHIFT", key = "up" }))
hl.bind("ALT + SHIFT + L", hl.dsp.send_shortcut({ mods = "SHIFT", key = "right" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeUp), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeDown),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(volumeMuteToggle),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(brightnessUp),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(brightnessDown),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--> Window Groups

-- Group Cycling
hl.bind(mainMod .. " + TAB",         hl.dsp.group.next(), { description = "Next group member" })
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev(), { description = "Previous group member" })

-- Direct Member Selection
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.group.active({ index = i }), {
        description = "Select group member " .. i
    })
end

-- Group Management
hl.bind(mainMod .. " + G", hl.dsp.submap("group_management"), {
    description = "Enter group management"
})

local function groupMap(key, action, description)
    hl.bind(key, function()
        hl.dispatch(action)
        hl.dispatch(hl.dsp.submap("reset"))
    end, { description = description })
end

hl.define_submap("group_management", function()

    -- Group Actions
    groupMap("G", hl.dsp.group.toggle(), "Toggle window group")
    groupMap("T", hl.dsp.group.lock(), "Lock/unlock active group")

    -- Join Neighbouring Groups
    groupMap("H", hl.dsp.window.move({ into_group = "l" }), "Join group to the left")
    groupMap("J", hl.dsp.window.move({ into_group = "d" }), "Join group below")
    groupMap("K", hl.dsp.window.move({ into_group = "u" }), "Join group above")
    groupMap("L", hl.dsp.window.move({ into_group = "r" }), "Join group to the right")

    -- Member Management
    groupMap("E", hl.dsp.window.move({ out_of_group = true }), "Eject window from group")
    groupMap("F", hl.dsp.group.move_window(), "Move member forward")
    groupMap("B", hl.dsp.group.move_window({ forward = false }), "Move member backward")

    -- Exit
    hl.bind("Escape", hl.dsp.submap("reset"), {
        description = "Exit group management"
    })
end)
