--[[ =========== Start:: Coloured Depots ========== --]]

local mod_name = "Coloured_Depots"
local steam_id = "1575253675"
-- local author = "RustyDios"
-- Version = "12"

--[[ =========== Start:: Add Entities ========== --]]

-- list of entities we're going to be adding
local entity_list = {
	"CD_BlackCube",
	"CD_Concrete",
	"CD_Electronics",
	"CD_Food",
	"CD_Fuel",
	"CD_Machine",
	"CD_Metals",
	"CD_Mystery",
	"CD_Polymers",
	"CD_RareMetals",
	"CD_BlackCube_A",
	"CD_Concrete_A",
	"CD_Electronics_A",
	"CD_Food_A",
	"CD_Fuel_A",
	"CD_Machine_A",
	"CD_Metals_A",
	"CD_Mystery_A",
	"CD_Polymers_A",
	"CD_RareMetals_A",
	-- Added support for LukeH extra resources mod
	"CD_LH_CrystalsDepo",
	"CD_LH_CrystalsDepo_A",
	"CD_LH_RadioactiveDepo",
	"CD_LH_RadioactiveDepo_A",
	"CD_LH_BoozeDepo",
	"CD_LH_BoozeDepo_A",
	"CD_LH_MeatDepo",
	"CD_LH_MeatDepo_A",
}
-- getting called a bunch, so make them local
local path_loc_str = CurrentModPath .. "Entities/%s.ent"
local mod = Mods.mod_name
local EntityData = EntityData
local EntityLoadEntities = EntityLoadEntities
local SetEntityFadeDistances = SetEntityFadeDistances

-- minor adjustments to the entity table to assist with adding the above
local EntityDataTableTemplate = {
	category_Building = true,
	entity = {
		fade_category = "Never",
		material_type = "Metal",
	},
}

--actually add the above entities into the game
local function AddEntity(name)
    EntityData[name] = EntityDataTableTemplate
    EntityLoadEntities[#EntityLoadEntities + 1] = {
        mod,
        name,
        path_loc_str:format(name)
    }
    SetEntityFadeDistances(name, -1, -1)
end

for i = 1, #entity_list do
	AddEntity(entity_list[i])
end
--[[ =========== End:: Add Entities ========== --]]

--[[ =========== Start:: Replace Entities & Add Skin System ========== --]]

-- newly built depots gets the entity swapped to the new coloured texture version
-- create a table of references to look at
local Swap_lookup = {
	StorageDepotSmall_01 = "CD_Polymers",
	StorageDepotSmall_02 = "CD_Metals",
	StorageDepotSmall_03 = "CD_Concrete",
	StorageDepotSmall_04 = "CD_Food",
	StorageDepotSmall_05 = "CD_Machine",
	StorageDepotSmall_06 = "CD_Fuel",
	StorageDepotSmall_07 = "CD_RareMetals",
	StorageDepotSmall_08 = "CD_Electronics",
	StorageDepotSmall_09 = "CD_BlackCube",
	StorageDepotSmall_10 = "CD_Mystery",
	WarehouseMetal = "CD_Metals_A",
	WarehousePolymer = "CD_Polymers_A",
	WarehouseRegolith = "CD_Concrete_A",
	WarehouseFood = "CD_Food_A",
	WarehouseMachineParts = "CD_Machine_A",
	WarehouseFuel = "CD_Fuel_A",
	WarehousePreciousMetals = "CD_RareMetals_A",
	WarehouseElectronics = "CD_Electronics_A",
	WarehouseBlackCube = "CD_BlackCube_A",
	WarehouseMystery = "CD_Mystery_A",
	-- Added support for LukeH additional resources mod
	LH_CrystalsDepo = "CD_LH_CrystalsDepo",
	LH_RadioactiveDepo = "CD_LH_RadioactiveDepo",
	LH_BoozeDepo = "CD_LH_BoozeDepo",
	LH_MeatDepo = "CD_LH_MeatDepo",
	LH_CrystalsDepo_A = "CD_LH_CrystalsDepo_A",
	LH_RadioactiveDepo_A = "CD_LH_RadioactiveDepo_A",
	LH_BoozeDepo_A = "CD_LH_BoozeDepo_A",
	LH_MeatDepo_A = "CD_LH_MeatDepo_A",
}

-- create and add the new colours as skins by template class, so people can toggle
local newskins_lookup = {
	StoragePolymers = {"StorageDepotSmall_01","CD_Polymers"},
	StorageMetals = {"StorageDepotSmall_02","CD_Metals"},
	StorageConcrete = {"StorageDepotSmall_03","CD_Concrete"},
	StorageFood = {"StorageDepotSmall_04","CD_Food"},
	StorageMachineParts = {"StorageDepotSmall_05","CD_Machine"},
	StorageFuel = {"StorageDepotSmall_06","CD_Fuel"},
	StorageRareMetals = {"StorageDepotSmall_07","CD_RareMetals"},
	StorageElectronics = {"StorageDepotSmall_08","CD_Electronics"},
	StorageMysteryResource = {"StorageDepotSmall_10","CD_Mystery"},	
	BlackCubeDump = {"StorageDepotSmall_09","CD_BlackCube"},
	MechanizedDepotMetals = {"WarehouseMetal","CD_Metals_A"},
	MechanizedDepotPolymers = {"WarehousePolymer","CD_Polymers_A"},
	MechanizedDepotConcrete = {"WarehouseRegolith","CD_Concrete_A"},
	MechanizedDepotFood = {"WarehouseFood","CD_Food_A"},
	MechanizedDepotMachineParts = {"WarehouseMachineParts","CD_Machine_A"},
	MechanizedDepotFuel = {"WarehouseFuel","CD_Fuel_A"},
	MechanizedDepotRareMetals = {"WarehousePreciousMetals","CD_RareMetals_A"},
	MechanizedDepotElectronics = {"WarehouseElectronics","CD_Electronics_A"},
	MechanizedDepotMysteryResource = {"WarehouseMystery","CD_Mystery_A"},	
	MechanizedDepotBlackCube = {"WarehouseBlackCube","CD_BlackCube_A"},
	-- Added support for LukeH additional resources mod
	LH_StorageCrystals = {"LH_CrystalsDepo","CD_LH_CrystalsDepo"},
	LH_StorageRadioactive = {"LH_RadioactiveDepo","CD_LH_RadioactiveDepo"},
	LH_StorageBooze = {"LH_BoozeDepo","CD_LH_BoozeDepo"},
	LH_StorageMeat = {"LH_MeatDepo","CD_LH_MeatDepo"},
	LH_MechanizedDepotCrystals = {"LH_CrystalsDepo_A","CD_LH_CrystalsDepo_A"},
	LH_MechanizedDepotRadioactive = {"LH_RadioactiveDepo_A","CD_LH_RadioactiveDepo_A"},
	LH_MechanizedDepotBooze = {"LH_BoozeDepo_A","CD_LH_BoozeDepo_A"},
	LH_MechanizedDepotMeat = {"LH_MeatDepo_A","CD_LH_MeatDepo_A"},
}

-- they don't use palettes, so we'll just return this blank
local fake_palette = { "none","none","none","none" }

--add the new skin groups/system to the depot building classes 
function UniversalStorageDepot:GetSkins()
   local newskins = newskins_lookup[self.template_name]
    if newskins then
        return newskins_lookup[self.template_name], fake_palette
    end
	return Building.GetSkins(self)
end

--define what clicking the button does, needed to keep current storages/attaches intact visually
function UniversalStorageDepot:ChangeSkin(skin,palette)
	self:ChangeEntity(skin)
end

--repeat for automated
function MechanizedDepot:GetSkins()
    local newskins = newskins_lookup[self.template_name]
    if newskins then
       return newskins_lookup[self.template_name], fake_palette
    end
	return Building.GetSkins(self)
end

function MechanizedDepot:ChangeSkin(skin,palette)
	self:ChangeEntity(skin)
end

--repeat for black cubes, mystery comes under UniDepot, even though they are classed MysteryDepot
function BlackCubeDumpSite:GetSkins()
    local newskins = newskins_lookup[self.template_name]
    if newskins then
       return newskins_lookup[self.template_name], fake_palette
    end
	return Building.GetSkins(self)
end

function BlackCubeDumpSite:ChangeSkins(skin,palette)
	self:ChangeEntity(skin)
end

-- check for the original entity and swap it by default when a building has finished building
function OnMsg.BuildingInit(obj)
	local SwapDepots = Swap_lookup[obj.entity]
	if SwapDepots then
		obj:ChangeEntity(SwapDepots)
	end
end

-- replace existing ones (that haven't been replaced yet)
local function ChangeEntityLabel(label,cls,new)
	for i = 1, #(label or "") do
		if label[i].entity ~= new and label[i]:IsKindOf(cls) then
			label[i]:ChangeEntity(new)
		end
	end
end

local function StartupCode()
	-- this way it'll only fire once per savegame instead of every load
	if not UICity.RD_RCDepots_Exchange then
		local l = UICity.labels
		ChangeEntityLabel(l.StorageFuel,"UniversalStorageDepot","CD_Fuel")
		ChangeEntityLabel(l.StorageMachineParts,"UniversalStorageDepot","CD_Machine")

		ChangeEntityLabel(l.StorageMetals,"UniversalStorageDepot","CD_Metals")
		ChangeEntityLabel(l.StoragePolymers,"UniversalStorageDepot","CD_Polymers")

		ChangeEntityLabel(l.StorageFood,"UniversalStorageDepot","CD_Food")
		ChangeEntityLabel(l.StorageConcrete,"UniversalStorageDepot","CD_Concrete")

		ChangeEntityLabel(l.StorageElectronics,"UniversalStorageDepot","CD_Electronics")
		ChangeEntityLabel(l.StorageRareMetals,"UniversalStorageDepot","CD_RareMetals")

		ChangeEntityLabel(l.StorageBlackCube,"UniversalStorageDepot","CD_BlackCube")
		ChangeEntityLabel(l.StorageMystery,"UniversalStorageDepot","CD_Mystery")

		ChangeEntityLabel(l.WarehouseFuel,"MechanizedDepot","CD_Fuel_A")
		ChangeEntityLabel(l.WarehouseMachineParts,"MechanizedDepot","CD_Machine_A")

		ChangeEntityLabel(l.WarehouseMetal,"MechanizedDepot","CD_Metals_A")
		ChangeEntityLabel(l.WarehousePolymer,"MechanizedDepot","CD_Polymers_A")

		ChangeEntityLabel(l.WarehouseFood,"MechanizedDepot","CD_Food_A")
		ChangeEntityLabel(l.WarehouseRegolith,"MechanizedDepot","CD_Concrete_A")

		ChangeEntityLabel(l.WarehouseElectronics,"MechanizedDepot","CD_Electronics_A")
		ChangeEntityLabel(l.WarehousePreciousMetals,"MechanizedDepot","CD_RareMetals_A")

		ChangeEntityLabel(l.WarehouseMystery,"MechanizedDepot","CD_Mystery_A")
		ChangeEntityLabel(l.WarehouseBlackCube,"MechanizedDepot","CD_BlackCube_A")

		-- Added support for LukeH resources mod
		ChangeEntityLabel(l.LH_StorageCrystals,"UniversalStorageDepot","CD_LH_CrystalsDepo")
		ChangeEntityLabel(l.LH_StorageRadioactive,"UniversalStorageDepot","CD_LH_RadioactiveDepo")
		ChangeEntityLabel(l.LH_StorageMeat,"UniversalStorageDepot","CD_LH_MeatDepo")
		ChangeEntityLabel(l.LH_StorageBooze,"UniversalStorageDepot","CD_LH_BoozeDepo")

		ChangeEntityLabel(l.LH_MechanizedDepotCrystals,"MechanizedDepot","CD_LH_CrystalsDepo_A")
		ChangeEntityLabel(l.LH_MechanizedDepotRadioactive,"MechanizedDepot","CD_LH_RadioactiveDepo_A")
		ChangeEntityLabel(l.LH_MechanizedDepotMeat,"MechanizedDepot","CD_LH_MeatDepo_A")
		ChangeEntityLabel(l.LH_MechanizedDepotBooze,"MechanizedDepot","CD_LH_BoozeDepo_A")
	
		UICity.RD_RCDepots_Exchange = true
	end
end

--replace entities on start of a new map
function OnMsg.CityStart()
	StartupCode()
end

--replace entities on load of a map >= savegame compatable
function OnMsg.LoadGame()
	StartupCode()
end

--[[ =========== End:: Replace Entities & Add Skin System ========== --]]

--[[ =========== End ::Coloured Depots ========== --]]
