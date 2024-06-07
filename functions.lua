require "util"

function get_order(tier)
	local s = tostring(tier)
	local order = ""
	if #s < 2 then order = order.."0" end
	local order = order..s
	return order
end

function resize_spidertron(spiderEntity, scale, scale_factor)
	spiderEntity.height = spiderEntity.height * scale
	
	resize_entity_graphics(spiderEntity, scale)

	--Credit to https://github.com/stefanaonx/spidertron-extended/blob/master/prototypes/spidertronmk3.lua for these lines
--	spiderEntity.graphics_set.animation.layers[1].scale = spiderEntity.graphics_set.animation.layers[1].scale * scale
--	spiderEntity.graphics_set.animation.layers[1].hr_version.scale = spiderEntity.graphics_set.animation.layers[1].hr_version.scale * scale
--	spiderEntity.graphics_set.animation.layers[2].scale = spiderEntity.graphics_set.animation.layers[2].scale * scale
--	spiderEntity.graphics_set.animation.layers[2].hr_version.scale = spiderEntity.graphics_set.animation.layers[2].hr_version.scale * scale
--	spiderEntity.graphics_set.base_animation.layers[1].scale = spiderEntity.graphics_set.base_animation.layers[1].scale * scale
--	spiderEntity.graphics_set.base_animation.layers[1].hr_version.scale = spiderEntity.graphics_set.base_animation.layers[1].hr_version.scale * scale
--	spiderEntity.graphics_set.base_animation.layers[2].scale = spiderEntity.graphics_set.base_animation.layers[2].scale * scale
--	spiderEntity.graphics_set.base_animation.layers[2].hr_version.scale = spiderEntity.graphics_set.base_animation.layers[2].hr_version.scale * scale
--	spiderEntity.graphics_set.shadow_animation.scale = spiderEntity.graphics_set.shadow_animation.scale * scale
--	spiderEntity.graphics_set.shadow_animation.hr_version.scale = spiderEntity.graphics_set.shadow_animation.hr_version.scale * scale
--	spiderEntity.graphics_set.shadow_base_animation.scale = spiderEntity.graphics_set.shadow_base_animation.scale * scale
--	spiderEntity.graphics_set.shadow_base_animation.hr_version.scale = spiderEntity.graphics_set.shadow_base_animation.hr_version.scale * scale

	-- Change leg positions
	local engine = spiderEntity.spider_engine
	for _, leg in ipairs(engine.legs) do
		for k,v in pairs(leg.ground_position) do
		  leg.ground_position[k] = v * scale
		end

		for k,v in pairs(leg.mount_position) do
		  leg.mount_position[k] = v * scale
		end
	end
end

function resize_entity_graphics(entity, scale)
	for k,v in pairs(entity.graphics_set) do
		if entity.graphics_set[k] == nil then
			goto continue1
		end
		if type(entity.graphics_set[k]) ~= "table" then
			goto continue1
		end
		if entity.graphics_set[k]["layers"] == nil then
			goto continue1
		end
		if type(entity.graphics_set[k]["layers"]) ~= "table" then
			goto continue1
		end
		print("layers found")
		for k2,v2 in pairs(entity.graphics_set[k].layers) do
			if entity.graphics_set[k].layers[k2].scale ~= nil then
				entity.graphics_set[k].layers[k2].scale = entity.graphics_set[k].layers[k2].scale * scale
			end
			if entity.graphics_set[k].layers[k2].hr_version ~= nil then
				entity.graphics_set[k].layers[k2].hr_version.scale = entity.graphics_set[k].layers[k2].hr_version.scale * scale
			end
		end
		::continue1::
	end
end

-- Entity, Item, Recipe
function new_spidertron(tier, scale, stat_factor, scale_factor, previousSpiderEntity, previousSpiderItem, previousSpiderRecipe, previousSpiderGrid)
	local icon_string = "__base__/graphics/icons/spidertron.png"
	local name_string = "spidertron-tier-"..tier
	local icons = {
		{icon = icon_string, icon_size = 64},
        {icon = "__skys-infinite-spidertrons__/graphics/icons/"..(get_order(tier):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-10,0}},
        {icon = "__skys-infinite-spidertrons__/graphics/icons/"..(get_order(tier):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
	}
	
	if previousSpiderEntity == nil then
		error("Previous Spider Entity for tier "..tier.." is nil!")
	end
	if previousSpiderItem == nil then
		error("Previous Spider Item for tier "..tier.." is nil!")
	end
	if previousSpiderRecipe == nil then
		error("Previous Spider Recipe for tier "..tier.." is nil!")
	end

	---@type data.SpiderVehiclePrototype
--	local spiderEntity = util.table.deepcopy(previousSpiderEntity)
	local spiderItem = util.table.deepcopy(previousSpiderItem)
	local spiderRecipe = util.table.deepcopy(previousSpiderRecipe)
	local spiderGrid = util.table.deepcopy(previousSpiderGrid)

	create_spidertron{
		name = name_string,
		scale = scale,
		leg_scale = 1, -- relative to scale
		leg_thickness = 1, -- relative to leg_scale
		leg_movement_speed = 1 / scale
	}

	local spiderEntity = data.raw["spider-vehicle"][name_string]
--	local spiderItem = data.raw["item"][name_string]
--	local spiderRecipe = data.raw["recipe"][name_string]
--	local spiderGrid = data.raw["equipment-grid"][name_string]
	
	spiderGrid.name = name_string.."-equipment-grid"
	for i=stat_factor, 1, -1 do
		spiderGrid.width = spiderGrid.width + get_tier_grid_width_addition()
		spiderGrid.height = spiderGrid.height + get_tier_grid_height_addition()
	end
	
	spiderEntity.name = name_string
	spiderEntity.icon = nil
	spiderEntity.icon_size = nil
	spiderEntity.icon_mipmaps = nil
	spiderEntity.icons = icons
	spiderEntity.minable.result = name_string

	--scaling inventory and health
	spiderEntity.max_health = previousSpiderEntity.max_health
	spiderEntity.inventory_size = previousSpiderEntity.inventory_size
	for i=stat_factor, 1, -1 do
		spiderEntity.max_health = (spiderEntity.max_health * get_tier_health_factor()) + get_tier_health_addition()
		spiderEntity.inventory_size = spiderEntity.inventory_size + get_tier_inventory_addition()
	end
	spiderEntity.equipment_grid = spiderGrid.name

	--resistance scaling
	if get_tier_resistance_factor() ~= 1 then
		spiderEntity.resistances = table.deepcopy(previousSpiderEntity.resistances)
		for i, resistance in pairs(spiderEntity.resistances) do
			if resistance.percent then
				for i=stat_factor, 1, -1 do
					local r = 100 - resistance.percent;
					resistance.percent = resistance.percent + (r * get_tier_resistance_factor())
				end
			end
		end
	end
	if unhide_resistances() then
		spiderEntity.hide_resistances = false
	end

	--TODO weapon

	if scale ~= 1 then
		resize_spidertron(spiderEntity, scale)
	end
	
	spiderItem.name = name_string
	spiderItem.icon = nil
	spiderItem.icon_tintable = nil
	spiderItem.icon_tintable_mask = nil
	spiderItem.icon_size = nil
	spiderItem.icon_mipmaps = nil
	spiderItem.icons = icons
	spiderItem.order = "b[personal-transport]-c[spidertron]-a[spider]"..tier
	spiderItem.place_result = name_string
	
	spiderRecipe.name = name_string
	if tier == 2 then
		spiderRecipe.ingredients = {{"spidertron", get_tier_crafting_fusion_cost()}}
	else 
		spiderRecipe.ingredients = {{"spidertron-tier-"..(tier - 1), get_tier_crafting_fusion_cost()}}
	end
	spiderRecipe.result = name_string
	
	
	data:extend{spiderEntity}
	data:extend{spiderItem}
	data:extend{spiderRecipe}
	data:extend{spiderGrid}
	--return spiderEntity, spiderItem, spiderRecipe
end

function new_technology(tier, previous_tech)
	local spider_key = "spidertron-tier-"..tier
	local tech_ingredients = nil
	if previous_tech == nil then
		error("Previous tech does not exist for Spidertron tier "..tier.."!")
	end
	local tech_time = previous_tech.unit.time
	local tech_count = previous_tech.unit.count
	
	if tier == 2 then
		local mk2_cost_base = get_tier_mk2_research_cost()
		if mk2_cost_base ~= 0 then
			tech_ingredients = { --TODO mod compatible
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1}
			}
			tech_time = previous_tech.unit.time
			tech_count = mk2_cost_base
		end
	end
	if tech_ingredients == nil then
		tech_ingredients = previous_tech.unit.ingredients
		tech_count = tech_count * get_tier_research_cost_factor()
		tech_count = tech_count + get_tier_research_cost_addition()
	end
	
	new_tech = util.table.deepcopy(previous_tech)
	new_tech.name = spider_key
	
	new_tech.unit.ingredients = tech_ingredients
	new_tech.unit.time = tech_time
	new_tech.unit.count = tech_count
	
	new_tech.effects = {
		{ type = "unlock-recipe", recipe = spider_key }
	}
	new_tech.upgrade = true
	new_tech.order = "d-e-g-"..tier
	
	if tier == 2 then
		if get_tier_mk2_research_cost() == 0 then --TODO mod compatible
			new_tech.prerequisites = {"spidertron"}
		else
			new_tech.prerequisites = {"spidertron", "space-science-pack"}
		end
	else 
		new_tech.prerequisites = {"spidertron-tier-"..(tier-1)}
	end
	
	data:extend{new_tech}
end