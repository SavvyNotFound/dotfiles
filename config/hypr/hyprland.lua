--> Hyprland Config

hl.on("hyprland.start", function () 
  hl.exec_cmd("~/dots/scripts/autoStart.sh")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
hl.bind("SUPER + SHIFT + CTRL + R", hl.dsp.exec_cmd("~/dots/scripts/autoStart.sh"))

require("modules.defaults")

require("modules.binds")
require("modules.looks")
require("modules.io")
require("modules.env-vars")
require("modules.windowing")
require("modules.misc")
