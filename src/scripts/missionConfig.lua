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
        {sort=3, name="T1-Texaco-1", description="Texaco-1 (KC-135 MPRS)", information="Tacan 60Y\nU290.00 (17)\nZone SUD-OUEST", linked="Escort Texaco-1"}, --Done
        {sort=4, name="T2-Arco-1", description="Arco-1 (KC-135)", information="Tacan 61Y\nU290.10 (18)\nZone OUEST", linked="Escort Arco-1"},  --Done
        {sort=5, name="T3-Shell-1", description="Shell-1 (KC-135)", information="Tacan 62Y\nU290.20 (19)\nZone EST, basse altitude", linked="Escort Shell-1"},  --Done
        {sort=6, name="T4-Texaco-2", description="Texaco-2 (KC-135 MPRS)", information="Tacan 63Y\nU290.30 (20)\nZone NEUTRE", linked="Escort Texaco-2"},  --Done
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
--        cloned (multiple scale and skills) combat mission example
        veafCombatMission.AddMissionsWithSkillAndScale(
 		VeafCombatMission.new()
 		:setSecured(false)
 		:setRadioMenuEnabled(true)
 		:setName("Intercept-Hostiles")
 		:setFriendlyName("Intercept hostiles aircrafts")
 		:setBriefing([[
A Russian CAP patrol of Mig21Bis has been spotted over the upper island, they're seams to be hostile.
You need to intercept them, and kill them is the dont cooperate !
]]
)
 		:addElement(
 			VeafCombatMissionElement.new()
 			:setName("OnDemandeMig21ComingFromNorthEasyGroup2")
             :setGroups({"OnDemandeMig21ComingFromNorthEasyGroup2"})
             :setScalable(true)
 		)
-- 		:addElement(
-- 			VeafCombatMissionElement.new()
-- 			:setName("OnDemand-Intercept-Transport-Krasnodar-Mineral-Escort")
--             :setGroups({"OnDemand-Intercept-Transport-Krasnodar-Mineral-Escort"})
--             :setSkill("Random")
-- 		)
 		:addObjective(
 			VeafCombatMissionObjective.new()
 			:setName("Intercept hostiles")
 			:setDescription("you must intercept hostile and kill them if they dont cooperate")
 			:setMessage("%d hostiles planes destroyed !")
 			:configureAsKillEnemiesObjective() -- TODO               -- Attend quoi, todo ?
 		)
 		:initialize()
 	)

    -- Cap from the east
    veafCombatMission.addCapMission("CAP-From-The-East", "CAP From The East", "A Russian CAP patrol of Mig21Bis has been spotted at the East of our island, they're seams to be hostile.", true, true)
--        cloned (multiple scale and skills) combat mission example
        veafCombatMission.AddMissionsWithSkillAndScale(
        VeafCombatMission.new()
        :setSecured(false)
        :setRadioMenuEnabled(true)
        :setName("Intercept-Hostiles")
        :setFriendlyName("Intercept hostiles aircrafts")
        :setBriefing([[
A Russian CAP patrol of Mig21Bis has been spotted at the East of our island, they're seams to be hostile.
You need to intercept them, and kill them is the dont cooperate !
]]
)
        :addElement(
            VeafCombatMissionElement.new()
            :setName("OnDemandeMig21ComingFromEastGroup")
             :setGroups({"OnDemandeMig21ComingFromEastGroup"})
             :setScalable(true)
        )
--      :addElement(
--          VeafCombatMissionElement.new()
--          :setName("OnDemand-Intercept-Transport-Krasnodar-Mineral-Escort")
--             :setGroups({"OnDemand-Intercept-Transport-Krasnodar-Mineral-Escort"})
--             :setSkill("Random")
--      )
        :addObjective(
            VeafCombatMissionObjective.new()
            :setName("Intercept hostiles")
            :setDescription("you must intercept hostile and kill them if they dont cooperate")
            :setMessage("%d hostiles planes destroyed !")
            :configureAsKillEnemiesObjective() -- TODO               -- Attend quoi, todo ?
        )
        :initialize()
    )

    -- standard combat mission example
--     veafCombatMission.AddMission(
-- 		VeafCombatMission.new()
--         :setSecured(true)
--         :setRadioMenuEnabled(false)
-- 		:setName("Red-attack-Gudauta")
-- 		:setFriendlyName("Red attack On Gudauta")
-- 		:setBriefing([[
-- Alert ! This is not a drill !
-- Tactical and strategic bombers have been detected at the russian border, to the north of Gudauta.
-- Their course will lead them to the Gudauta airbase, which is probably their mission.
-- Destroy all the bombers before they hit the base !
-- ]]
-- )
-- 		:addElement(
-- 			VeafCombatMissionElement.new()
-- 			:setName("SEAD")
-- 			:setGroups({
-- 				"Red Attack On Gudauta - Wave 1-1",
-- 				"Red Attack On Gudauta - Wave 1-2",
-- 				"Red Attack On Gudauta - Wave 1-3",
-- 				"Red Attack On Gudauta - Wave 1-4" })
-- 			:setSkill("Random")
-- 		)
-- 		:addElement(
-- 			VeafCombatMissionElement.new()
-- 			:setName("Bombers")
-- 			:setGroups({
-- 				"Red Attack On Gudauta - Wave 2-1",
--                 "Red Attack On Gudauta - Wave 2-2",
--                 "Red Attack On Gudauta - Wave 2-3" })
-- 			:setSkill("Random")
-- 		)
-- 		:addObjective(
-- 			VeafCombatMissionObjective.new()
-- 			:setName("HVT Gudauta")
-- 			:setDescription("the mission will be failed if any of the HVT on Gudauta are destroyed")
-- 			:setMessage("HVT target(s) destroyed : %s !")
-- 			:configureAsPreventDestructionOfSceneryObjectsInZone(
-- 				{
-- 					"Gudauta - Tower",
-- 					"Gudauta - Kerosen",
-- 					"Gudauta - Mess"},
-- 				{
-- 					[156696667] = "Gudauta Tower",
-- 					[156735615] = "Gudauta Kerosen tankers",
-- 					[156729386] = "Gudauta mess"
-- 				}
-- 			)
-- 		)
-- 		:addObjective(
-- 			VeafCombatMissionObjective.new()
-- 			:setName("Kill all the bombers")
-- 			:setDescription("you must kill all of the bombers")
-- 			:setMessage("%d bombers destroyed !")
-- 			:configureAsKillEnemiesObjective()
-- 		)
-- 		:initialize()
-- 	)

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
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_cocosisland")
			:setFriendlyName("Coco's Island")
			:setBriefing([[Nous avons détecté un groupe de criminels non identifié
Ils auraient des substances illégales et extrêmement nosifs, l'objectif est de les rappoter à Santa Rita avec une hélicoptère à élingue
Il y aurait possiblement des manpads et de l'infanterie armée, soyez prudent ! (Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_defend_the_platform")
			:setFriendlyName("Defend the Gas Platform")
			:setBriefing([[Un groupe de bateaux criminels se trouve en direction de la plateforme pétrolière à l'ouest de l'île
Ils sont à 35 pour 10nm de la platforme. Décollez au plus vite et interceptez le avant qu'il ne soit trop tard !(Cette mission doit être réalisé à l'aide d'hélicoptère uniquement)]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_escort_boat_to_east_gp")
			:setFriendlyName("[PVP] Attack the gaz platform")
			:setBriefing([[Escortez les deux navires jusqu'au platforme pétrolière ennemie, dans le but de les capturer
Ils sont situés au Sud-Est de l'île, 110 pour 4 de Santa Rita (Cette mission doit être réalisé à l'aide de 3 huey de chaque côté)]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_free_rota_island")
			:setFriendlyName("Free Rota Island")
			:setBriefing([[L'île centrale a été capturé par une organisation criminel, votre objectif et des tous les éliminer pour libérer l'île
Attention, elle contient possiblement des défences anti-aérienne long porté, soyez prudent !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_red_carrier_group")
			:setFriendlyName("Destroy an hostile carrier group")
			:setBriefing([[Un groupe de navires hostile a été détecté à l'ouest de nos côte, l'objectif est de l'éliminer !
Attention, ils disposent d'une très long distance de tir et ont possiblement des unitées aériennes en vol, soyez prudent !]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_sucrerie_illegal")
			:setFriendlyName("[WIP] Sucreries Illégals")
			:setBriefing([[Un groupe de navires disposent de marchandises illégal et de provenance inconnue est en direction l'île, arrêtez les, et s'il ne coopère par,
vous pourez les éliminer ! Ils sont à 10 pour 11 de Olf Orote, et sont en mouvement, il pourrait atteindre le port très rapidement ! (hélicoptère uniquement)
<!> Attention, cette mission n'est pas terminé, il est possible qu'elle contient des bugs, si les navires s'arrêtent juste avant le port, vous pouvez esitimer que la mission est un échec <!>]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_antiship_training_easy")
			:setFriendlyName("Antiship Training Easy")
			:setBriefing([[Entrainement anti navire, un navire avec un distance de tir de 40nm
111 pour 190 du Bullseye]])
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatzone_antiship_training_hard")
			:setFriendlyName("Antiship Training Hard")
			:setBriefing([[Entrainement anti navire, un navire avec un distance de tir de 100nm
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
		{name="AIRBASE Andersen AFB",  point={x=-10688,y=0,z=00014822, atc=true, tower="V126.2, U250.1", tacan="", runways={{name="06", hdg=66, ils="110.30"}, {name="24", hdg=246}}}},
		{name="AIRBASE Antonio B. Won Pat Intl", point={x=-000068,y=0,z=000109, atc=true, tower="V118.1, U340.2", runways={ {name="6", hdg=65, ils="110.50"}, {name="24", hdg=245}}}},
		{name="AIRBASE Kobuleti",point={x=-318000,y=0,z=636620, atc=true, tower="V133, U262", tacan="67X KBL", runways={ {name="07", hdg=69, ils="111.50"}}}},
		{name="AIRBASE Kutaisi", point={x=-284860,y=0,z=683839, atc=true, tower="V134, U264", tacan="44X KTS", runways={ {name="08", hdg=74, ils="109.75"}, {name="26", hdg=254}}}},
		{name="AIRBASE Senaki",  point={x=-281903,y=0,z=648379, atc=true, tower="V132, U261", tacan="31X TSK", runways={ {name="09", hdg=94, ils="108.90"}, {name="27", hdg=274}}}},
		{name="AIRBASE Sukhumi", point={x=-221382,y=0,z=565909, atc=true, tower="V129, U258", runways={{name="12", hdg=116}, {name="30", hdg=296}}}},
		{name="AIRBASE Tbilisi", point={x=-314926,y=0,z=895724, atc=true, tower="V138, U267", tacan="25X GTB", runways={{name="13", hdg=127, ils="110.30"},{name="31", hdg=307, ils="108.90"}}}},
		{name="AIRBASE Vaziani", point={x=-319000,y=0,z=903271, atc=true, tower="V140, U269", tacan="22X VAS", runways={ {name="13", hdg=135, ils="108.75"}, {name="31", hdg=315, ils="108.75"}}}},

		-- airbases in Russia
        --[[
		{name="AIRBASE Anapa - Vityazevo",   point={x=-004448,y=0,z=244022, atc=true, tower="V121, U250" , runways={ {name="22", hdg=220}, {name="04", hdg=40}}}},
		{name="AIRBASE Beslan",              point={x=-000068,y=0,z=000109, atc=true, tower="V118.1, U340.2", runways={ {name="6", hdg=93, ils="110.50"}, {name="24", hdg=273}}}},
		{name="AIRBASE Krymsk",              point={x=-007349,y=0,z=293712, atc=true, tower="V124, U253", runways={ {name="04", hdg=39}, {name="22", hdg=219}}}},
		{name="AIRBASE Krasnodar-Pashkovsky",point={x=-008707,y=0,z=388986, atc=true, tower="V128, U257", runways={ {name="23", hdg=227}, {name="05", hdg=47}}}},
		{name="AIRBASE Krasnodar-Center",    point={x=-011653,y=0,z=366766, atc=true, tower="V122, U251", runways={ {name="09", hdg=86}, {name="27", hdg=266}}}},
		{name="AIRBASE Gelendzhik",          point={x=-050996,y=0,z=297849, atc=true, tower="V126, U255", runways={ {hdg=40}, {hdg=220}}}},
		{name="AIRBASE Maykop",              point={x=-027626,y=0,z=457048, atc=true, tower="V125, U254", runways={ {name="04", hdg=40}, {name="22", hdg=220}}}},
		{name="AIRBASE Mineralnye Vody",     point={x=-052090,y=0,z=707418, atc=true, tower="V135, U264", runways={ {name="12", hdg=115, ils="111.70"}, {name="30", hdg=295, ils="109.30"}}}},
		{name="AIRBASE Mozdok",              point={x=-083330,y=0,z=835635, atc=true, tower="V137, U266", runways={ {name="08", hdg=82}, {name="26", hdg=262}}}},
		{name="AIRBASE Nalchik",             point={x=-125500,y=0,z=759543, atc=true, tower="V136, U265", runways={ {name="06", hdg=55}, {name="24", hdg=235, ils="110.50"}}}},
		{name="AIRBASE Novorossiysk",        point={x=-040299,y=0,z=279854, atc=true, tower="V123, U252", runways={ {name="04", hdg=40}, {name="22", hdg=220}}}},
		{name="AIRBASE Sochi",               point={x=-165163,y=0,z=460902, atc=true, tower="V127, U256", runways={ {name="06", hdg=62, ils="111.10"}, {name="24", hdg=242}}}},
        ]]
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
    ctld.pickupZones = {
        { "pickzone1", "none", -1, "yes", 0 },
        { "pickzone2", "none", -1, "yes", 0 },
        { "pickzone3", "none", -1, "yes", 0 },
        { "pickzone4", "none", -1, "yes", 0 },
        { "pickzone5", "none", -1, "yes", 0 },
        { "pickzone6", "none", -1, "yes", 0 },
        { "pickzone7", "none", -1, "yes", 0 },
        { "pickzone8", "none", -1, "yes", 0 },
        { "pickzone9", "none", -1, "yes", 0 },
        { "pickzone10", "none", -1, "yes", 0 },
        { "pickzone11", "none", -1, "yes", 0 },
        { "pickzone12", "none", -1, "yes", 0 },
        { "pickzone13", "none", -1, "yes", 0 },
        { "pickzone14", "none", -1, "yes", 0 },
        { "pickzone15", "none", -1, "yes", 0 },
        { "pickzone16", "none", -1, "yes", 0 },
        { "pickzone17", "none", -1, "yes", 0 },
        { "pickzone18", "none", -1, "yes", 0 },
        { "pickzone19", "none", 5, "yes", 0 },
        { "pickzone20", "none", 10, "yes", 0, 1000 }, -- optional extra flag number to store the current number of groups available in

        { "CVN-74 Stennis", "none", 10, "yes", 0, 1001 }, -- instead of a Zone Name you can also use the UNIT NAME of a ship
        { "LHA-1 Tarawa", "none", 10, "yes", 0, 1002 }, -- instead of a Zone Name you can also use the UNIT NAME of a ship
    }

    -- ******************** Transports names **********************

    -- Use any of the predefined names or set your own ones
    ctld.transportPilotNames = {}

    for i = 1, 24 do
        table.insert(ctld.transportPilotNames, string.format("yak #%03d",i))
    end

    for i = 1, 10 do
        table.insert(ctld.transportPilotNames, string.format("transport #%03d",i))
    end

    for i = 1, 79 do
        table.insert(ctld.transportPilotNames, string.format("helicargo #%03d",i))
    end

    -- ************** Logistics UNITS FOR CRATE SPAWNING ******************

    -- Use any of the predefined names or set your own ones
    -- When a logistic unit is destroyed, you will no longer be able to spawn crates

    ctld.logisticUnits = {
        "logistic #001",
        "logistic #002",
        "logistic #003",
        "logistic #004",
        "logistic #005",
        "logistic #006",
        "logistic #007",
        "logistic #008",
        "logistic #009",
        "logistic #010",
        "logistic #011",
        "logistic #012",
        "logistic #013",
        "logistic #014",
        "logistic #015",
        "logistic #016",
        "logistic #017",
        "logistic #018",
        "logistic #019",
        "logistic #020",
    }

    if veafTransportMission then

        -- automatically add all the human-manned transport helicopters to ctld.transportPilotNames
        veafTransportMission.initializeAllHelosInCTLD()

        -- automatically add all the carriers and FARPs to ctld.logisticUnits
        veafTransportMission.initializeAllLogisticInCTLD()
    end

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
