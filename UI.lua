local UI = {}

UI.Create = function(class, properties, radius)
	local instance = Instance.new(class)
	
	for i, v in next, properties do
		-- print(i, v)
		if i ~= "Parent" then
			if typeof(v) == "Instance" then
				v.Parent = instance
			else
				instance[i] = v
			end
		end
	end
	
	if radius then
		local uiCorner = Instance.new("UICorner", instance)
		uiCorner.CornerRadius = radius
	end
	
	return instance
end

return UI
