ProfessionFramework.addProfession('BeatrixKiddo', {
    name = 'Beatrix "The Bride" Kiddo',
    icon = "profession_BeatrixKiddo",
    cost = 0,
    xp = {
        [Perks.LongBlade] = 5,
        [Perks.Strength] = 1,
        [Perks.Fitness] = 1,
    },
    clothing = {
        -- not working with the current version of the Profession Framework on steam. as date 02-JAN-2022
    },
    traits = {
        "BulletInTheHead",
        "Brave2",
        "Resilient2",
        "Katana"
    },
    inventory = {
        "Base.Katana"
    },
    spawns = {
        ["Muldraugh, KY"] = {
            { worldX = 35, worldY = 32, posX = 225, posY = 113 }, -- chapel
            { worldX = 35, worldY = 33, posX = 286, posY = 271 }, -- church
        },
        ["Riverside, KY"] = {
            { worldX = 21, worldY = 17, posX = 279, posY = 272 }, -- church
        },
        ["Rosewood, KY"] = {
            { worldX = 27, worldY = 38, posX = 24, posY = 140 }, -- church
        },
        ["West Point, KY"] = {
            { worldX = 39, worldY = 23, posX = 263, posY = 97 }, -- church
        }
    }
})

ClothingSelectionDefinitions = ClothingSelectionDefinitions or {};

ClothingSelectionDefinitions.BeatrixKiddo = {
	Female = {
        Hat = {
            items = {"Base.Hat_WeddingVeil"}
        },
        Socks = {
            items = {"Base.Socks_Ankle"}
        },
        Shoes = {
			items = {"Base.Shoes_Random"},
		},
        UnderwearTop = {
            items = {"Base.Bra_Straps_White"}
        },
        UnderwearBottom = {
            items = {"Base.Underpants_White"}
        },
        FullSuit = {
            items = {"WeddingDress"}
        }
	}
}

-- [[CharacterCreationMain.lua]] --

-- only female characters
local vanilla_initClothing = CharacterCreationMain.initClothing
function CharacterCreationMain:initClothing(...) 
    local desc = MainScreen.instance.desc
    if desc:getProfession() == "BeatrixKiddo" then
        desc:setFemale(true) -- set gender always to female
        local forename = 'Beatrix'
        desc:setForename(forename);
        MainScreen.instance.charCreationHeader.forenameEntry:setText(forename);
        local surname = 'Kiddo'
        desc:setSurname(surname);
        MainScreen.instance.charCreationHeader.surnameEntry:setText(surname);
        CharacterCreationHeader.instance.avatarPanel:setSurvivorDesc(desc)
    end
    vanilla_initClothing(self, ...)
end

ProfessionFramework.addTrait('BulletInTheHead', {
    name = "Bullet In The Head",
    description = "Bill left a bullet in your head",
    cost = 0,
    profession = true,
    OnNewGame = function(player, square)
        if not player:HasTrait("BulletInTheHead") then
            return
        end

        local Head = player:getBodyDamage():getBodyPart(BodyPartType.Head)
        Head:setHaveBullet(true, 0)
        -- Add blood
        player:addBlood(BloodBodyPartType.Head, true, true, false);
        player:addBlood(BloodBodyPartType.Torso_Upper, true, true, false);
		player:addBlood(BloodBodyPartType.Torso_Upper, true, true, false);
		player:addBlood(BloodBodyPartType.Torso_Upper, true, true, false);
		player:addBlood(BloodBodyPartType.UpperLeg_L, true, true, false);
		player:addBlood(BloodBodyPartType.UpperLeg_L, true, true, false);
		player:addBlood(BloodBodyPartType.LowerLeg_R, true, true, false);
		player:addBlood(BloodBodyPartType.LowerLeg_R, true, true, false);
		player:addBlood(BloodBodyPartType.UpperLeg_R, true, true, false);
		player:addBlood(BloodBodyPartType.UpperLeg_R, true, true, false);
		player:addBlood(BloodBodyPartType.Groin, true, true, false);
		player:addBlood(BloodBodyPartType.ForeArm_L, true, true, false);
		player:addBlood(BloodBodyPartType.UpperArm_R, true, true, false);
		-- holes
		player:addHole(BloodBodyPartType.Torso_Lower);
		player:addHole(BloodBodyPartType.LowerLeg_R);
		player:addHole(BloodBodyPartType.ForeArm_R);

        local weapon = player:getInventory():AddItem("Base.Katana")
        player:setAttachedItem("Big Weapon On Back", weapon);
        weapon:setAttachedSlot(1);
    end
})

ProfessionFramework.addTrait('Katana', {
    name = "Katana",
    description = "You start with a Katana",
    cost = 0,
    profession = true,
    OnNewGame = function(player, square)
        if not player:HasTrait("Katana") then
            return
        end

        local weapon = player:getInventory():AddItem("Base.Katana")
        player:setAttachedItem("Big Weapon On Back", weapon);
        weapon:setAttachedSlot(1);
    end
})
