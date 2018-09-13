Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
	
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		
		if DoesEntityExist(playerVeh) then
			--Shows radar if it was previously hidden
			if Config.RadarToggler == true then
				DisplayRadar(true)
			end

			--This will check if you want to use the speedometer
			if Config.SpeedometerToggler == true then
				--Text from bottom-right that would cover the speedometer when pressing Z
				HideHudComponentThisFrame(7)
				HideHudComponentThisFrame(9)
				
				--Assuming it's using Imperial
				local speedmultiplier = 2.236936
				local measurementtext = 'mph'

				--If it's not imperial then it's metric, duuhh!
				if Config.Measurement == "Metric" or Config.Measurement == "metric" then
					speedmultiplier = 3.6 
					measurementtext = 'km/h'
				end

				local speed = GetEntitySpeed(playerVeh) * speedmultiplier --Here we calculate the speed
				local speedcolor = Config.Level1color --Assuming the basic speed color
				
				--Setting speed colors for various levels
				if speed <= Config.Level1 then
					speedcolor = Config.Level1color
				elseif speed <= Config.Level2 then
					speedcolor = Config.Level2color
				elseif speed <= Config.Level3 then
					speedcolor = Config.Level3color
				elseif speed <= Config.Level4 then
					speedcolor = Config.Level4color
				elseif speed > Config.Level5 then
					speedcolor = Config.Level5color
				end
				
				--Let's draw the speedometer
				DrawRect(0.965, 0.98, 0.140, 0.040, 0, 0, 0, 150) --Background
				drawTxt(1.408, 1.466, 1.0,1.0,0.65, speedcolor .. math.ceil(speed) .. "", 255, 255, 255, 255) --Speed
				drawTxt(1.439, 1.466, 1.0,1.0,0.65, "~b~ "..measurementtext, 255, 255, 255, 255) --Measurement
			end
		else
			--If player is NOT in a car, we can disable the radar, if you want to...
			if Config.RadarToggler == true then
				if not IsPedDeadOrDying(playerPed, 1) then --No health bar for you if you're dead
					local playerHealth = GetEntityHealth(playerPed)-100 --We substract 100 because GTA has a weird system in which the health goes from 100 to 200
					local playerArmour = GetPedArmour(playerPed) --Isn't ARMOR the right word? *Triggering brits*
					local posx = -0.005 --Some variables
					local posy = 0.975	--^
					DisplayRadar(false) --Hide the radar

					--Draw the new health and armor bar... somehow...
					DrawRect(posx+0.04+(100/2531), posy+0.001, 0.123, 0.015, 0, 0, 0, 150)
					DrawRect(posx+0.02+(100/2531), posy+0.001, 0.079, 0.009, 41, 86, 40, 150)
					DrawRect(posx+0.02+(playerHealth/2531), posy+0.001, playerHealth/1265, 0.009, 78, 145, 77, 255)
					DrawRect(posx+0.10+(100/5060), posy+0.001, 0.038, 0.009, 33, 82, 104, 150)
					DrawRect(posx+0.10+(playerArmour/5060), posy+0.001, (playerArmour/2531), 0.009, 62, 129, 164, 255)
				end
			end
		end
    end
end)

--Function to draw text. Don't ask too many questions, I copy & pasted this
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/1.95 + 0.005)
end
