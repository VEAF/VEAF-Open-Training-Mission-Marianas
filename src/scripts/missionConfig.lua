-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission configuration file for the VEAF framework
-- see https://github.com/VEAF/VEAF-Mission-Creation-Tools
--
-- This configuration is tailored for the Marianas OpenTraining mission
-- see https://github.com/VEAF/VEAF-Open-Training-Mission
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.config.MISSION_NAME = "OpenTraining_Marianas"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize QRA
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafQraManager then
VeafQRA.ToggleAllSilence(false) --this will set all QRA messages ON if the argument is "true" and all QRA messages to OFF is the argument is "false".

    QRA_upperIsland = VeafQRA:new()
    :setName("QRA_upperIsland")
    :addGroup("QRA_upperIsland")
    :setZoneRadius(152400) --Conversion 500000ft => 152400m

        --NOTE 1 : Remember that only one aircraft group at a time is deployed for each QRA

    --:setQRAcount(QRAcount) --Superior or equal to -1 : Current number of aircraft groups available for deployement. By default this is set to -1 meaning an infinite amount of groups are available, no warehousing is done. -> This is you master arm for the rest of these options.
    --:setQRAmaxCount(maxQRAcount) --Superior or equal to -1 : Maximum number of aircraft groups deployable at any time for the QRA. By default this is set to -1 meaning an infinite amount of aircrafts can be accumulated for deployement. -> Example: a QRA has 2 out of 6 groups ready for deployement, 6 is your maxQRAcount, 2 is your current QRAcount.
    --:setQRAmaxResupplyCount(maxResupplyCount) --Superior or equal to -1 : Total number of aircraft groups which can be resupplied to the QRA. By default this is set to -1 meaning an infinite amount of stock is available. 0 means no stock is available, no resupplies will occur, this is your master arm for resupplies  -> Take the previous example : We are missing 4 groups but only have 3 in stock to resupply the QRA, 3 is your QRAmaxResupplyCount
    --:setQRAminCountforResupply(minCountforResupply) --Equal to -1 or superior to 0 : Number of aircraft groups which the QRA needs to have at all times, otherwise a resupply will be started. By default this is set at -1 which means that a resupply will be started as soon as an aircraft group is lost. -> Take the previous example : This minimum number of deployable groups we desire at all times for our QRA is 1, but we have 2, so no resupply will happen for now. 1 is your minCountforResupply.
    --:setResupplyAmount(resupplyAmount) --Superior or equal to 1 : Number of aircraf groups that will be resupplied to the QRA when a resupply happens. By default it is equal to 1. -> Take the previous example : We just lost both of our groups meaning we only have none left, this will trigger a resupply, a resupply the desired amount of aircraft groups or of however many aircrafts we have in stock if this amount is less. The resupply will also be constrained by the maximum number of groups we can have ready for deployement at once.
    --:setQRAresupplyDelay(resupplyDelay) --Superior or equal to 0 : Time that a resupply will need in order to happen.

        --NOTE 2 : only one resupply can happen at a time, they may be scheduled at every possible occasion but will happen one at a time.
        --NOTE 3 : QRA groups that have just arrived from the supply chain will need to be rearmed (see associated delay and constraints)

    --:setAirportLink(airbase_name) --Unit name of the airbase in between " " : QRA will be linked to this airport and will stop operating if the airport is lost (This can be a FARP (use the FARP's unit name), a Ship (use the ship's unit name), an airfield or a building (oil rigs etc.))
    --:setAirportMinLifePercent(value) --Ranges from 0 to 1 : minimum life percentage of the linked airport for the QRA to operate. Airports (runways) and Ships only should lose life when bombed, this needs manual testing to know what works best. Not currently functional due to a DCS bug.

        --NOTE 1 : QRA that are just being recomissioned after an airbase is retaken will need to be rearmed (see associated delay and constraints)

    --:setDelayBeforeRearming(value) --Delay between the death of a QRA and it being ready for action
    --:setNoNeedToLeaveZoneBeforeRearming() --QRA will be rearmed (and later deployed) even though players are still in the area
    --:setResetWhenLeavingZone() --The QRA will be despawned (and ready-ed up again immediatly) when all players leave the zone. Otherwise the QRA will patrol until they RTB at which point they will despawn on landing and be ready immediatly.
    --:setDelayBeforeActivating(value) --activation delay between units entering the QRA zone and the QRA actually deploying

    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    --:setReactOnHelicopters() --Sets if the QRA reacts to helicopters entering the zone
    --:setSilent() --mutes this QRA only, VeafQRA.AllSilence has to be false for this to have an effect
    :start()

    QRA_veryurgentQRA = VeafQRA:new()
    :setName("veryurgentQRA")
    :addGroup("veryurgentQRA_Mig29S")
    :setZoneRadius(30480) --Conversion 100000ft => 30480m
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :start()

    QRA_lowerisland = VeafQRA:new()
    :setName("QRA_lowerisland")
    :addGroup("QRA_lowerisland")
    :setZoneRadius(60960) --Conversion 200000ft => 60960m
    :setCoalition(coalition.side.BLUE)
    :addEnnemyCoalition(coalition.side.RED)
    :start()

    QRA_Carrier_QRA = VeafQRA:new()
    :setName("Carrier_QRA")
    :addGroup("Carrier_QRA")
    :setZoneRadius(60960) --Conversion 200000ft => 60960m
    :setCoalition(coalition.side.BLUE)
    :addEnnemyCoalition(coalition.side.RED)
    :start()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize all the scripts
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRadio then
    -- the RADIO module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafRadio")
    veafRadio.initialize(true)
end
if veafSpawn then
    -- the SPAWN module is mandatory as it is used by many other modules
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
if veafWeather then
    veaf.loggers.get(veaf.Id):info("init - veafWeather")
    veafWeather.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- change some default parameters
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.DEFAULT_GROUND_SPEED_KPH = 25

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize SHORTCUTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafShortcuts then
    -- the SHORTCUTS module is mandatory as it is used by many other modules
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
        {sort=3, name="CSG-71 Roosevelt", description="Roosevelt (CVN-71)", information="Tacan 12X RHR\nICLS 12\nU227 (12)"}, --Done
        {sort=4, name="CSG Kuznetsov", description="Kuznetsov (CV)", information="V121.5"}, --Done

        {sort=5, name="T1-Texaco-1", description="Texaco-1 (KC-135 MPRS)", information="Tacan 60Y\nU290.00 (15)\nZone SUD-OUEST", linked="Escort Texaco-1"}, --Done
        {sort=6, name="T2-Arco-1", description="Arco-1 (KC-135)", information="Tacan 61Y\nU290.10 (16)\nZone OUEST", linked="Escort Arco-1"},  --Done
        {sort=7, name="T3-Shell-1", description="Shell-1 (KC-135)", information="Tacan 62Y\nU290.20 (17)\nZone EST, basse altitude", linked="Escort Shell-1"},  --Done
        {sort=8, name="T4-Texaco-2", description="Texaco-2 (KC-135 MPRS)", information="Tacan 63Y\nU290.30 (18)\nZone NEUTRE", linked="Escort Texaco-2"},  --Done
        {sort=9, name="T5-Petrolsky-1", description="160 (IL-78M, RED)", information="U290 (15)", linked="Escort Petrolsky-1"},  --Done
        {sort=10, name="CVN-74 John C. Stennis S-3B Tanker", description="Arco-3 (S3-B)", information="Tacan 75X\nU290.90\nZone PA"},  --Done
        {sort=11, name="CVN-71 Theodore Roosevelt S-3B Tanker", description="Arco-2 (S3-B)", information="Tacan 76X\nU290.80\nZone PA"},  --Done

        -- {sort=8, name="Bizmuth", description="Colt-1 AFAC Bizmuth (MQ-9)", information="L1688 V118.80 (18)", jtac=1688, freq=118.80, mod="am"}, --ToDo
        {sort=12, name="Agate", description="Dodge-1 AFAC Agate (MQ-9)", information="L1687 U268.90 (19)", jtac=1687, freq=268.90, mod="am"},  --Done

        {sort=12, name="A1-Magic", description="Magic (E-3A)", information="Datalink 315.3 Mhz\nU282.20 (13)", linked="Escort A1-Magic"}, --Done
        {sort=13, name="A2-Overlordsky", description="Overlordsky / 145 (A-50, RED)", information="U282.20 (13)"},  --Done
    }

    veaf.loggers.get(veaf.Id):info("init - veafAssets")
    veafAssets.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure MOVE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafMove then
    veaf.loggers.get(veaf.Id):info("Setting move tanker radio menus")
    -- keeping the veafMove.Tankers table empty will force veafMove.initialize() to browse the units, and find the tankers automatically
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
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_northwestfield")
			:setFriendlyName("NorthWest Field Practice Range")
			:setBriefing([[NorthWest Field is at 300 for 5 from Andersen AFB
Your can use the weapon you want to practice, there are no threat
Your must use your radio with the right frequency to practice there (check the kneeboard)]])
            :setTraining(true)
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_cocosisland")
			:setFriendlyName("Coco's Island")
			:setBriefing([[Nous avons détecté un groupe de criminels non identifié
Ils auraient des substances illégales et extrêmement nocives, l'objectif est de les rapporter à Santa Rita avec une hélicoptère à élingue
Il y aurait possiblement des manpads et de l'infanterie armée, soyez prudent ! (Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_defend_the_platform")
			:setFriendlyName("Defend the Gas Platform")
			:setBriefing([[Un groupe de bateaux criminels se trouve en direction de la plateforme pétrolière à l'ouest de l'île
Ils sont à 35 pour 10nm de la plateforme. Décollez au plus vite et interceptez le avant qu'il ne soit trop tard !(Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)
La plateforme est situé aux coordonnées suivantes : N 13°52'39'' E 144°15'55'']])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_escort_boat_to_east_gp")
			:setFriendlyName("[PVP] Attack the gaz platform")
			:setBriefing([[Escortez les deux navires jusqu'aux plateformes pétrolières ennemies, dans le but de les capturer
Ils sont situés au Sud-Est de l'île, 110 pour 4 de Santa Rita (Cette mission doit être réalisée à l'aide de 3 Huey de chaque côté)
La plateforme est situé aux coordonnées suivantes : N13°15'44'' E145°9'17'']])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_free_rota_island")
			:setFriendlyName("Free Rota Island")
			:setBriefing([[L'île centrale a été capturé par une organisation criminel, votre objectif et des tous les éliminer pour libérer l'île
Attention, elle contient possiblement des défenses anti-aériennes long portée, soyez prudents !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_red_carrier_group")
			:setFriendlyName("Destroy hostile carrier group")
			:setBriefing([[Un groupe de navires hostile a été détecté à l'ouest de nos côte, l'objectif est de l'éliminer !
Attention, ils disposent d'une très long distance de tir et ont possiblement des unitées aériennes en vol, soyez prudent !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_sucrerie_illegal")
			:setFriendlyName("[WIP] Sucreries Illégals")
			:setBriefing([[Un groupe de navires disposent de marchandises illégal et de provenance inconnue est en direction l'île, arrêtez-les, et s'ils ne coopèrent pas,
vous pourrez les éliminer ! Ils sont au 010 pour 11nm de Olf Orote, et sont en mouvement, il pourrait atteindre le port très rapidement ! (hélicoptère uniquement)
<!> Attention, cette mission n'est pas terminé, il est possible qu'elle contient des bugs, si les navires s'arrêtent juste avant le port, vous pouvez estimer que la mission est un échec <!>]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("combatzone_antiship_training_easy")
			:setFriendlyName("Antiship Training Easy")
			:setBriefing([[Entraînement anti navire, un navire avec une distance de tir de 10nm
111 pour 190 du Bullseye]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
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
    -- the NAMED POINTS module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("Loading configuration")

    
    -- here you can add points of interest, that will be added to the default points
    local customPoints = {
    
    }
    veaf.loggers.get(veaf.Id):info("init - veafNamedPoints")
    veafNamedPoints.initialize(customPoints)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure SECURITY
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSecurity then
    -- the SECURITY module is mandatory as it is used by many other modules
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
    function configurationCallback()
        veaf.loggers.get(veaf.Id):info("configuring CTLD for %s", veaf.config.MISSION_NAME)
      end
    ctld.initialize(configurationCallback)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CSAR
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if csar then
    veaf.loggers.get(veaf.Id):info("init - csar")
    function configurationCallback()
        veaf.loggers.get(veaf.Id):info("configuring CSAR for %s", veaf.config.MISSION_NAME)
    end
    csar.initialize(configurationCallback)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the remote interface
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRemote then
    veaf.loggers.get(veaf.Id):info("init - veafRemote")
    veafRemote.initialize()
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
-- initialize the interpreter
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafInterpreter then
    -- the INTERPRETER module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafInterpreter")
    veafInterpreter.initialize()
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
if veafHoundElint and false then -- don't use Hound Elint
    veaf.loggers.get(veaf.Id):info("init - veafHoundElint")
    veafHoundElint.initialize(
        "ELINT", -- prefix
        { -- red
            --global parameters
            markers = true,
            disableBDA = false, --disables notifications that a radar has dropped off scope
            platformPositionErrors = true,
            NATOmessages = false, --provides positions relative to the bullseye
            NATO_SectorCallsigns = false, --uses a different pool for sector callsigns
            ATISinterval = 180,
            preBriefedContacts = {
                --"Stuff",
                --"Thing",
            }, --contains the name of units placed in the ME which will be designated as pre-briefed (exact location) and who's position will be indicated exactly by Hound until the unit moved 100m away
            debug = false, --set this to true to make sure your configuration is correct and working as intended
        },
        { -- blue
            sectors = {
                --Global sector, mandatory inclusion if you want a global ATIS/controller etc., encompasses the whole map so it'll be very crowded in terms of comms
                [veafHoundElint.globalSectorName] = {
                    callsign = "Global Sector", --defines a specific callsign for the sector which will be used by the ATIS etc., if absent or nil Hound will assign it a callsign automatically, NATO format of regular Hound format. If true, callsign will be equal to the sector name
                    atis = {
                        freq = 282.175,
                        speed = 1,
                        --additional params
                        reportEWR = false
                    },
                    controller = {
                        freq = 282.225,
                        --additional params
                        voiceEnabled = true
                    },
                    notifier = {
                        freq = 282.2,
                        --additional params
                    },
                    disableAlerts = false, --disables alerts on the ATIS/Controller when a new radar is detected or destroyed
                    transmitterUnit = nil, --use the Unit/Pilot name to set who the transmitter is for the ATIS etc. This can be a static, and aircraft or a vehicule/ship
                    disableTTS = false,
                },
            },
            --global parameters
            markers = true,
            disableBDA = false, --disables notifications that a radar has dropped off scope
            platformPositionErrors = true,
            NATOmessages= true, --provides positions relative to the bullseye
            NATO_SectorCallsigns = true, --uses a different pool for sector callsigns
            ATISinterval = 180,
            preBriefedContacts = {
                --"Stuff",
                --"Thing",
            }, --contains the name of units or groups placed in the ME which will be designated as pre-briefed (exact location) and who's position will be indicated exactly by Hound until the unit moved 100m away. If multiple radars are within a specified group, they'll all be added as pre-briefed targets
            debug = false, --set this to true to make sure your configuration is correct and working as intended
        }
        -- args = {
        --     freq = 250.000,
        --     modulation = "AM",
        --     volume = "1.0",
        --     speed = <speed> -- number default is 0/1 for controller/atis. range is -10 to +10 on windows TTS. for google it's 0.25 to 4.0
        --     gender = "male"|"female",
        --     culture = "en-US"|"en-UK" -- (any installed on your system)
        --     isGoogle = true/false -- use google TTS (requires additional STTS config)
        --     voiceEnabled = true/false (for the controller only) -- to set if the controllers uses text or TTS
        --     reportEWR = true/false (for ATIS only) -- set to tell the ATIS to report EWRs as threats
        -- }
    )
end

-- Silence ATC on all the airdromes
veaf.silenceAtcOnAllAirbases()
