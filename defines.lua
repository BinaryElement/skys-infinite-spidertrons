local spidertron_tiers = settings.startup["max-spidertron-tier"].value
local tier_health_factor = settings.startup["spidertron-tier-health-factor"].value
local tier_health_addition = settings.startup["spidertron-tier-health-addition"].value
local tier_inventory_addition = settings.startup["spidertron-tier-inventory-addition"].value
local tier_grid_width_addition = settings.startup["spidertron-tier-grid-width-addition"].value
local tier_grid_height_addition = settings.startup["spidertron-tier-grid-height-addition"].value
local tier_weapon_range_addition = settings.startup["spidertron-tier-weapon-range-addition"].value
local tier_weapon_firing_speed_factor = settings.startup["spidertron-tier-weapon-firing-speed-factor"].value
local tier_one_scale = settings.startup["spidertron-tier-one-scale"].value
local tier_scale_factor = settings.startup["spidertron-tier-scale-factor"].value
local tier_scale_addition = settings.startup["spidertron-tier-scale-addition"].value
local tier_crafting_fusion_cost = settings.startup["spidertron-tier-crafting-fusion-cost"].value
local tier_mk2_research_cost = settings.startup["spidertron-tier-mk2-research-cost"].value
local tier_research_cost_factor = settings.startup["spidertron-tier-research-cost-factor"].value
local tier_research_cost_addition = settings.startup["spidertron-tier-research-cost-addition"].value
local tier_resistance_factor = settings.startup["spidertron-tier-resistance-factor"].value
local use_factorial_formula = settings.startup["spidertron-tier-use-factorial-formula"].value
local use_factorial_formula_for_size = settings.startup["spidertron-tier-use-factorial-formula-for-size"].value
local unhide_resistance = settings.startup["spidertron-unhide-resistances"].value

function get_max_tiers()
	return spidertron_tiers
end
function get_tier_health_factor()
	return tier_health_factor
end
function get_tier_health_addition()
	return tier_health_addition
end
function get_tier_inventory_addition()
	return tier_inventory_addition
end
function get_tier_grid_width_addition()
	return tier_grid_width_addition
end
function get_tier_grid_height_addition()
	return tier_grid_height_addition
end
function get_tier_weapon_range_addition()
	return tier_weapon_range_addition
end
function get_tier_weapon_firing_speed_factor()
	return tier_weapon_firing_speed_factor
end
function get_tier_one_scale()
	return tier_one_scale
end
function get_tier_scale_factor()
	return tier_scale_factor
end
function get_tier_scale_addition()
	return tier_scale_addition
end
function get_tier_crafting_fusion_cost()
	return tier_crafting_fusion_cost
end
function get_tier_mk2_research_cost()
	return tier_mk2_research_cost
end
function get_tier_research_cost_factor()
	return tier_research_cost_factor
end
function get_tier_research_cost_addition()
	return tier_research_cost_addition
end
function get_tier_resistance_factor()
	return tier_resistance_factor
end
function using_factorial_formula()
	return use_factorial_formula
end
function using_factorial_formula_for_size()
	return use_factorial_formula_for_size
end
function unhide_resistances()
	return unhide_resistance
end