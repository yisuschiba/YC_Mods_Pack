require "Definitions/AttachedWeaponDefinitions"

if AttachedWeaponDefinitions then
    AttachedWeaponDefinitions.YCNaginataStomach = {
         chance = 1, -- chance is total, we'll get the chance of every definition and take one from there
         weaponLocation = {"Stomach"}, -- defined in AttachedLocations.lua
         bloodLocations = {"Torso_Lower","Back"}, -- we add blood & hole on this part
         addHoles = true, -- if true, you need at least one bloodLocation
         daySurvived = 60, -- needed day of survival before seeing this one
         weapons = { -- list of possible weapons, we'll take one randomly from there
             "KatanaLegacy.YCNaginata",
         },
    }
    if AttachedWeaponDefinitions.spearStomach then
        AttachedWeaponDefinitions.spearStomach = {
            chance = 5, -- chance is total, we'll get the chance of every definition and take one from there
            weaponLocation = {"Stomach"}, -- defined in AttachedLocations.lua
            bloodLocations = {"Torso_Lower","Back"}, -- we add blood & hole on this part
            addHoles = true, -- if true, you need at least one bloodLocation
            daySurvived = 30, -- needed day of survival before seeing this one
            weapons = { -- list of possible weapons, we'll take one randomly from there
                "KatanaLegacy.YCSpearTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.katanaStomach then
        AttachedWeaponDefinitions.katanaStomach = {
            chance = 1,
            weaponLocation = {"Stomach"},
            bloodLocations = {"Torso_Lower","Back"},
            addHoles = true,
            daySurvived = 60,
            weapons = {
                "KatanaLegacy.YCKatana",
                "KatanaLegacy.YCNodachi",
                "KatanaLegacy.YCNagamaki",
                "KatanaLegacy.YCWakizashi",
                "KatanaLegacy.YCOdachi",
                "KatanaLegacy.YCTachi",                
            },
        }
    end
    if AttachedWeaponDefinitions.huntingKnifeBack then
        AttachedWeaponDefinitions.huntingKnifeBack = {
            chance = 5,
            weaponLocation = {"Knife in Back"},
            bloodLocations = {"Back"},
            addHoles = false,
            daySurvived = 10,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.huntingKnifeLeftLeg then
        AttachedWeaponDefinitions.huntingKnifeLeftLeg = {
            chance = 5,
            weaponLocation = {"Knife Left Leg"},
            bloodLocations = {"UpperLeg_L"},
            addHoles = false,
            daySurvived = 10,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.huntingKnifeRightLeg then
        AttachedWeaponDefinitions.huntingKnifeRightLeg = {
            chance = 5,
            weaponLocation = {"Knife Right Leg"},
            bloodLocations = {"UpperRight_L"},
            addHoles = false,
            daySurvived = 10,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.huntingKnifeShoulder then
        AttachedWeaponDefinitions.huntingKnifeShoulder = {
            chance = 5,
            weaponLocation = {"Knife Shoulder"},
            bloodLocations = {"UpperArm_L", "Torso_Upper"},
            addHoles = false,
            daySurvived = 10,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.huntingKnifeStomach then
        AttachedWeaponDefinitions.huntingKnifeStomach = {
            chance = 5,
            weaponLocation = {"Knife Stomach"},
            bloodLocations = {"Torso_Lower", "Back"},
            addHoles = false,
            daySurvived = 10,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
    if AttachedWeaponDefinitions.knivesBelt then
        AttachedWeaponDefinitions.knivesBelt = {
            chance = 80,
            outfit = {"Bandit"},
            weaponLocation = {"Belt Right Upside"},
            bloodLocations = nil,
            addHoles = false,
            daySurvived = 0,
            weapons = {
                "KatanaLegacy.YCTanto",
            },
        }
    end
end