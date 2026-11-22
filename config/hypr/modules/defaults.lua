--> Defaults

terminal         = "kitty"
fileManager      = "nautilus"
appPicker        = "rofi -show drun -config application.rasi"

controlPanel     = "qs ipc call controlPanel toggleControlPanel"
logoutMenu       = "wlogout"

volumeUp         = "qs ipc call volumeOSD volumeUp"
volumeDown       = "qs ipc call volumeOSD volumeDown"
volumeMuteToggle = "qs ipc call volumeOSD toggleMute"

brightnessUp     = "qs ipc call brightnessOSD brightnessUp"
brightnessDown   = "qs ipc call brightnessOSD brightnessDown"

kamojiPicker     = "rofimoji --files kaomoji"
emojiPicker      = "rofimoji"
clipboard        = "~/dots/scripts/clipboard.sh"
screenShot       = "hyprshot -m region -o ~/Pictures/Screenshot"
colorPicker      = "hyprpicker | wl-copy"
