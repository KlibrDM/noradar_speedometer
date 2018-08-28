# noradar_speedometer
## Description
This is a simple speedometer for FiveM with the ability to hide the radar (minimap) if the player is not in a vehicle. Each of these features can be used separately. The speedometer can also change colors based on 5 speed levels.
## Dependencies
It should work on any FiveM CitizenFX server.

Tested on ESX.
## Setup
Just throw it into your resources folder and add the following line to your server.cfg
```
start noradar_speedometer
```
* If you don't want to disable the radar(minimap) when the player is not in a vehicle, you have to set `Config.RadarToggler` to `false` in `config.lua`
* If you want to use only the radar disabler, and you don't want the speedometer, you have to set `Config.SpeedometerToggler` to `false` in `config.lua`

## Screenshots
* **No radar**

![screenshot](https://farm2.staticflickr.com/1898/42517363180_50f4eea198.jpg)
##
* **Speedometer mph**

![screenshot](https://farm2.staticflickr.com/1893/42517362800_75cb5871dd.jpg)
##
* **Speedometer km/h**

![screenshot](https://farm2.staticflickr.com/1879/29389087807_e8f4c6cb8a.jpg)
## Issues
* If you're using the radar disabler, you'll lose the oxygen bar (which shows if you're underwater).
