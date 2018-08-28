Config = {}

Config.Measurement = "Imperial" --"Imperial" (mph) or "Metric" (km/h), if you write anything else, it will be considered imperial.

--Speed levels (keep them all at an insanely high number if you don't want the speedometer to change colors based on vehicle speed)
Config.Level1 = 10              --Very slow speed
Config.Level2 = 30              --City speed limit
Config.Level3 = 50              --Outside city speed limit
Config.Level4 = 70              --Highway speed limit
Config.Level5 = Config.Level4   --Over the highway speed limit || DO NOT CHANGE
                                --Use the speeds in the measurement type of your choice.

Config.Level1color = "~w~"      --Colors:   ~r~ = Red || ~b~ = Blue || ~g~ = Green || ~y~ = Yellow || ~p~ = Purple || ~o~ = Orange || ~c~ = Grey || ~m~ = Darker Grey || ~u~ = Black || ~s~ = Default White || ~w~ = White
Config.Level2color = "~g~"
Config.Level3color = "~y~"
Config.Level4color = "~o~"
Config.Level5color = "~r~"

Config.RadarToggler = true          --This will disable the radar (minimap) if the player is NOT in a vehicle. Because of the way the radar is made, a new health and shield bar has to be drawn and it doesn't show the air capacity if the player is under water.
Config.SpeedometerToggler = true    --This will disable the speedometer. You can disable it in case you want to use ONLY the hidden radar part of the script
--Fun fact, if you set both of the variables from above to false, the script does absolutely nothing, so don't.