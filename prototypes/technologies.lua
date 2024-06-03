for i=2,get_max_tiers(),1 do
	if data.raw.technology["spidertron-tier-"..i] == nil then
		local previous_tech = nil
		if i == 2 then
			previous_tech = data.raw.technology["spidertron"]
		else
			previous_tech = data.raw.technology["spidertron-tier-"..(i-1)]
		end
		new_technology(i, previous_tech)
	end
end