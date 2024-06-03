

local scale = get_tier_one_scale()
local previous_spider_key = "spidertron"
local stat_factor = 1
local scale_factor = 1

print("get_tier_one_scale: "..get_tier_one_scale())
print("get_tier_scale_factor: "..get_tier_scale_factor())
print("get_tier_scale_addition: "..get_tier_scale_addition())
print("T1 scale: "..scale)

--resize base spidertron
if scale ~= 1 then
	resize_spidertron(data.raw["spider-vehicle"][previous_spider_key], scale, scale_factor)
end
if unhide_resistances() then
	data.raw["spider-vehicle"][previous_spider_key].hide_resistances = false
end

--create mk2+ spiders
for i=2,get_max_tiers(),1 do
	if i == 2 then
		previous_spider_key = "spidertron"
	end
	
	for i=scale_factor, 1, -1 do
		scale = scale * get_tier_scale_factor()
		scale = scale + get_tier_scale_addition()
	end
	print("T"..i.." scale: "..scale)
	
	local previous_spider_entity = data.raw["spider-vehicle"][previous_spider_key]
	local previous_spider_item = data.raw["item-with-entity-data"][previous_spider_key]
	local previous_spider_recipe = data.raw["recipe"][previous_spider_key]
	local previous_spider_grid = data.raw["equipment-grid"][previous_spider_key.."-equipment-grid"]
	
	new_spidertron(i, scale, stat_factor, scale_factor, previous_spider_entity, previous_spider_item, previous_spider_recipe, previous_spider_grid)
	previous_spider_key = "spidertron-tier-"..(i)
	if using_factorial_formula() then
		stat_factor = stat_factor + 1
	end
	if using_factorial_formula_for_size() then
		scale_factor = scale_factor + 1
	end
end