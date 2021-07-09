-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission configuration file for the VEAF framework
-- see https://github.com/VEAF/VEAF-Mission-Creation-Tools
--
-- This configuration is tailored for the Marianas OpenTraining mission
-- see https://github.com/VEAF/VEAF-Open-Training-Mission
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.config.MISSION_NAME = "OpenTraining_Marianas"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder

-- play the radio beacons (for the public OT mission)
veafBeacons = false

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize QRA
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veaf then
    VeafQRA.new()
    :setName("QRA_upperIsland")
    :addGroup("QRA_upperIsland")
    :setRadius(152400) --Conversion 500000ft => 152400m
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :start()

    VeafQRA.new()
    :setName("veryurgentQRA")
    :addGroup("veryurgentQRA_Mig29S")
    :setRadius(30480) --Conversion 100000ft => 30480m
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :start()

    VeafQRA.new()
    :setName("QRA_lowerisland")
    :addGroup("QRA_lowerisland")
    :setRadius(60960) --Conversion 200000ft => 60960m
    :setCoalition(coalition.side.BLUE)
    :addEnnemyCoalition(coalition.side.RED)
    :start()

    VeafQRA.new()
    :setName("Carrier_QRA")
    :addGroup("Carrier_QRA")
    :setRadius(60960) --Conversion 200000ft => 60960m
    :setCoalition(coalition.side.BLUE)
    :addEnnemyCoalition(coalition.side.RED)
    :start()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize all the scripts
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRadio then
    veaf.loggers.get(veaf.Id):info("init - veafRadio")
    veafRadio.initialize(true)
end
if veafSpawn then
    veaf.loggers.get(veaf.Id):info("init - veafSpawn")
    veafSpawn.initialize()
end
if veafGrass then
    veaf.loggers.get(veaf.Id):info("init - veafGrass")
    veafGrass.initialize()
end
if veafCasMission then
    veaf.loggers.get(veaf.Id):info("init - veafCasMission")
    veafCasMission.initialize()
end
if veafTransportMission then
    veaf.loggers.get(veaf.Id):info("init - veafTransportMission")
    veafTransportMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- change some default parameters
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.DEFAULT_GROUND_SPEED_KPH = 25

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize SHORTCUTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafShortcuts then
    veaf.loggers.get(veaf.Id):info("init - veafShortcuts")
    veafShortcuts.initialize()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure ASSETS
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafAssets then
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veafAssets.Assets = {
        -- list the assets common to all missions below
        {sort=1, name="CSG-01 Tarawa", description="Tarawa (LHA)", information="Tacan 10X TAA\nU225 (10)"},  --Done
        {sort=2, name="CSG-74 Stennis", description="Stennis (CVN)", information="Tacan 11X STS\nICLS 11\nU226 (11)"},  --Done
        {sort=2, name="CSG-71 Roosevelt", description="Roosevelt (CVN-71)", information="Tacan 12X RHR\nICLS 12\nU227 (12)"}, --Done
        {sort=3, name="T1-Texaco-1", description="Texaco-1 (KC-135 MPRS)", information="Tacan 60Y\nU290.00 (15)\nZone SUD-OUEST", linked="Escort Texaco-1"}, --Done
        {sort=4, name="T2-Arco-1", description="Arco-1 (KC-135)", information="Tacan 61Y\nU290.10 (16)\nZone OUEST", linked="Escort Arco-1"},  --Done
        {sort=5, name="T3-Shell-1", description="Shell-1 (KC-135)", information="Tacan 62Y\nU290.20 (17)\nZone EST, basse altitude", linked="Escort Shell-1"},  --Done
        {sort=6, name="T4-Texaco-2", description="Texaco-2 (KC-135 MPRS)", information="Tacan 63Y\nU290.30 (18)\nZone NEUTRE", linked="Escort Texaco-2"},  --Done
        {sort=6, name="T5-Petrolsky-1", description="160 (IL-78M, RED)", information="U267", linked="Escort Petrolsky-1"},  --Done
        {sort=7, name="CVN-74 John C. Stennis S-3B Tanker", description="Arco-3 (S3-B)", information="Tacan 75X\nU290.90\nZone PA"},  --Done
        {sort=7, name="CVN-71 Theodore Roosevelt S-3B Tanker", description="Arco-2 (S3-B)", information="Tacan 76X\nU290.80\nZone PA"},  --Done
        -- {sort=8, name="Bizmuth", description="Colt-1 AFAC Bizmuth (MQ-9)", information="L1688 V118.80 (18)", jtac=1688, freq=118.80, mod="am"}, --ToDo
        {sort=9, name="Agate", description="Dodge-1 AFAC Agate (MQ-9)", information="L1687 U268.90 (19)", jtac=1687, freq=268.90, mod="am"},  --Done
        {sort=10, name="A1-Magic", description="Magic (E-3A)", information="Datalink 315.3 Mhz\nU282.20 (13)", linked="Escort A1-Magic"}, --Done
        {sort=11, name="A2-Overlordsky", description="Overlordsky / 145 (A-50, RED)", information="U242.12"},  --Done
    }

    veaf.loggers.get(veaf.Id):info("init - veafAssets")
    veafAssets.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure MOVE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafMove then
    veaf.loggers.get(veaf.Id):info("Setting move tanker radio menus")
    -- keeping the veafMove.Tankers table empty will force veafMove.initialize() to browse the units, and find the tankers
    veaf.loggers.get(veaf.Id):info("init - veafMove")
    veafMove.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT MISSION
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafCombatMission then
    veaf.loggers.get(veaf.Id):info("Loading configuration")

    -- CAP from the North
    veafCombatMission.addCapMission("CAP-From-The-North", "CAP From The North", "A Russian CAP patrol of Mig21Bis has been spotted over the upper island, they're seams to be hostile.", true, true)

    -- Cap from the east
    veafCombatMission.addCapMission("CAP-From-The-East", "CAP From The East", "A Russian CAP patrol of Mig21Bis has been spotted at the East of our island, they're seams to be hostile.", true, true)

    veaf.loggers.get(veaf.Id):info("init - veafCombatMission")
    veafCombatMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT ZONE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCombatZone then
    veaf.loggers.get(veaf.Id):info("Loading configuration")

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_northwestfield")
			:setFriendlyName("NorthWest Field Practice Range")
			:setBriefing([[NorthWest Field is at 300 for 5 from Andersen AFB
Your can use the weapon you want to practice, there are no threat
Your must use your radio with the right frequency to practice there (check the kneeboard)]])
            :setTraining(true)
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_cocosisland")
			:setFriendlyName("Coco's Island")
			:setBriefing([[Nous avons détecté un groupe de criminels non identifié
Ils auraient des substances illégales et extrêmement nocives, l'objectif est de les rapporter à Santa Rita avec une hélicoptère à élingue
Il y aurait possiblement des manpads et de l'infanterie armée, soyez prudent ! (Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_defend_the_platform")
			:setFriendlyName("Defend the Gas Platform")
			:setBriefing([[Un groupe de bateaux criminels se trouve en direction de la plateforme pétrolière à l'ouest de l'île
Ils sont à 35 pour 10nm de la plateforme. Décollez au plus vite et interceptez le avant qu'il ne soit trop tard !(Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)
La plateforme est situé aux coordonnées suivantes : N 13°52'39'' E 144°15'55'']])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_escort_boat_to_east_gp")
			:setFriendlyName("[PVP] Attack the gaz platform")
			:setBriefing([[Escortez les deux navires jusqu'aux plateformes pétrolières ennemies, dans le but de les capturer
Ils sont situés au Sud-Est de l'île, 110 pour 4 de Santa Rita (Cette mission doit être réalisée à l'aide de 3 Huey de chaque côté)
La plateforme est situé aux coordonnées suivantes : N13°15'44'' E145°9'17'']])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_free_rota_island")
			:setFriendlyName("Free Rota Island")
			:setBriefing([[L'île centrale a été capturé par une organisation criminel, votre objectif et des tous les éliminer pour libérer l'île
Attention, elle contient possiblement des défenses anti-aériennes long portée, soyez prudents !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_red_carrier_group")
			:setFriendlyName("Destroy hostile carrier group")
			:setBriefing([[Un groupe de navires hostile a été détecté à l'ouest de nos côte, l'objectif est de l'éliminer !
Attention, ils disposent d'une très long distance de tir et ont possiblement des unitées aériennes en vol, soyez prudent !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_sucrerie_illegal")
			:setFriendlyName("[WIP] Sucreries Illégals")
			:setBriefing([[Un groupe de navires disposent de marchandises illégal et de provenance inconnue est en direction l'île, arrêtez-les, et s'ils ne coopèrent pas,
vous pourrez les éliminer ! Ils sont au 010 pour 11nm de Olf Orote, et sont en mouvement, il pourrait atteindre le port très rapidement ! (hélicoptère uniquement)
<!> Attention, cette mission n'est pas terminé, il est possible qu'elle contient des bugs, si les navires s'arrêtent juste avant le port, vous pouvez estimer que la mission est un échec <!>]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_antiship_training_easy")
			:setFriendlyName("Antiship Training Easy")
			:setBriefing([[Entraînement anti navire, un navire avec une distance de tir de 10nm
111 pour 190 du Bullseye]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_antiship_training_hard")
			:setFriendlyName("Antiship Training Hard")
			:setBriefing([[Entraînement anti navire, un navire avec une distance de tir de 40nm
110 pour 200 du Bullseye]])
	)

    veaf.loggers.get(veaf.Id):info("init - veafCombatZone")
	veafCombatZone.initialize()

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure WW2 settings based on loaded theatre
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local theatre = string.lower(env.mission.theatre)
veaf.loggers.get(veaf.Id):info(string.format("theatre is %s", theatre))
veaf.config.ww2 = false
if theatre == "thechannel" then
    veaf.config.ww2 = true
elseif theatre == "normandy" then
    veaf.config.ww2 = true
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure NAMEDPOINTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafNamedPoints then

	veafNamedPoints.Points = {
		-- airbases in Blue Island
		{name="AIRBASE Andersen AFB",  point={x=-010688,y=0,z=014822, atc=true, tower="V126.2, U250.1", tacan="54X", runways={{name="06", hdg=66}, {name="24", hdg=246}}}},
		{name="AIRBASE Antonio B. Won Pat Intl", point={x=-000068,y=0,z=-000109, atc=true, tower="V118.1, U340.2", runways={ {name="6", hdg=65, ils="110.30"}, {name="24", hdg=245}}}},
		{name="AIRBASE Olf Orote",point={x=-005047,y=0,z=-016913, atc=false}},
		{name="AIRBASE Santa Rita",point={x=-013576,y=0,z=-009925, atc=false}},
		
		-- airbases in Neutral Island
		{name="AIRBASE Rota Intl", point={x=-075886,y=0,z=048612, atc=true, tower="V123.6, U250", tacan="44X KTS", runways={ {name="09", hdg=92, ils="109.75"}, {name="27", hdg=272}}}},
		
		-- airbases in Red Island
		{name="AIRBASE Tinian Intl",  point={x=-166865,y=0,z=090027, atc=true, tower="V123.65, U250.05", tacan="31X TSK", runways={ {name="0", hdg=94, ils="108.90"}, {name="27", hdg=274}}}},
		{name="AIRBASE Saipan Intl", point={x=180074,y=0,z=101921, atc=true, tower="V125.7, U256.9", runways={{name="07", hdg=68, ils="109.90"}, {name="25", hdg=248}}}},
	}

    veaf.loggers.get(veaf.Id):info("Loading configuration")

    veaf.loggers.get(veaf.Id):info("init - veafNamedPoints")
    veafNamedPoints.initialize()
    if theatre == "syria" then
        veafNamedPoints.addAllSyriaCities()
    elseif theatre == "caucasus" then
        veafNamedPoints.addAllCaucasusCities()
    elseif theatre == "persiangulf" then
        veafNamedPoints.addAllPersianGulfCities()
    elseif theatre == "thechannel" then
        veafNamedPoints.addAllTheChannelCities()
    elseif theatre == "marianaislands" then
        veafNamedPoints.addAllMarianasIslandsCities()
    else
        veaf.loggers.get(veaf.Id):warn(string.format("theatre %s is not yet supported by veafNamedPoints", theatre))
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure SECURITY
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSecurity then
    veafSecurity.password_L9["6ade6629f9219d87a011e7b8fbf8ef9584f2786d"] = true -- set the L9 password (the lowest possible security)
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veaf.loggers.get(veaf.Id):info("init - veafSecurity")
    veafSecurity.initialize()

    -- force security in order to test it when dynamic loading is in place (change to TRUE)
    if (false) then
        veaf.SecurityDisabled = false
        veafSecurity.authenticated = false
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CARRIER OPERATIONS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCarrierOperations then
    veaf.loggers.get(veaf.Id):info("init - veafCarrierOperations")
    veafCarrierOperations.initialize(true)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CTLD
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if ctld then
    veaf.loggers.get(veaf.Id):info("init - ctld")
    ctld.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the remote interface
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRemote then
    veaf.loggers.get(veaf.Id):info("init - veafRemote")
    veafRemote.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the interpreter
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafInterpreter then
    veaf.loggers.get(veaf.Id):info("init - veafInterpreter")
    veafInterpreter.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Skynet-IADS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSkynet then
    veaf.loggers.get(veaf.Id):info("init - veafSkynet")
    veafSkynet.initialize(
        false, --includeRedInRadio=true
        false, --debugRed
        false, --includeBlueInRadio
        false --debugBlue
    )
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize veafSanctuary
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSanctuary then
    veaf.loggers.get(veaf.Id):info("init - veafSanctuary")
    veafSanctuary.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Hound Elint
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafHoundElint then
    veaf.loggers.get(veaf.Id):info("init - veafHoundElint")
    veafHoundElint.initialize(
        "ELINT", -- prefix
        { -- red
            admin = false,
            markers = true,
            atis = false,
            controller = false
        },
        { -- blue
            admin = false,
            markers = true,
            atis = {
                freq = 282.125,
                interval = 15,
                speed = 1,
                reportEWR = false
            },
            controller = {
                freq = 282.225,
                voiceEnabled = true
            }
        }
    )
end
