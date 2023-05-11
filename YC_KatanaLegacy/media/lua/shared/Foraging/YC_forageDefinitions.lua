require "Foraging/forageDefinitions"

local function generateYCKLCustomDefs()
	local junkItems = {
        rare = {
			chance = 15,
			xp = 10,
			items = {
				KatanaCleaningKit   = "KatanaLegacy.KatanaCleaningKit",
			},
		},
        legendary = {
            chance = 1,
            xp = 25,
            items = {
                YCKatana        = "KatanaLegacy.YCKatana",
                YCNaginata      = "KatanaLegacy.YCNaginata",
                YCNodachi       = "KatanaLegacy.YCNodachi",
                YCNagamaki      = "KatanaLegacy.YCNagamaki",
                YCWakizashi     = "KatanaLegacy.YCWakizashi",
                YCTanto         = "KatanaLegacy.YCTanto",
                YCOdachi        = "KatanaLegacy.YCOdachi",
                YCTachi         = "KatanaLegacy.YCTachi",
            },
        },
	};
    for _, spawnTable in pairs(junkItems) do
        for itemName, itemFullName in pairs(spawnTable.items) do
            forageDefs[itemName] = {
                type = itemFullName,
                skill = 6,
                xp = spawnTable.xp,
                categories = { "Junk" },
                zones = {
                    Forest      = spawnTable.chance,
                    DeepForest  = spawnTable.chance,
                    Vegitation  = spawnTable.chance,
                    FarmLand    = spawnTable.chance,
                    Farm        = spawnTable.chance,
                    TrailerPark = spawnTable.chance,
                    TownZone    = spawnTable.chance,
                    Nav         = spawnTable.chance,
                },
                spawnFuncs = nil,
                forceOutside = false,
                canBeAboveFloor = true,
            };
        end;
    end;
end

generateYCKLCustomDefs();
