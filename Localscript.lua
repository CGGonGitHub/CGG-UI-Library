-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
-- Variables
local Library = require(ReplicatedStorage.Library)
local plr = Players.LocalPlayer

task.wait(3)

-- Functions

local Window = Library:AddWindow({
	toggled = true,
	Title = "CGG UI Library"
})

-- Tabs
local Tab = Window:AddTab({
	Title = "Tab"
})
local SecondTab = Window:AddTab({
	Title = "Test",
	FontColor = Color3.fromRGB(255,0,0)
})
local ThirdTab = Window:AddTab({
	Title = "Test2",
	BackgroundColor = Color3.fromRGB(255,0,0)
})

-- Tab
local Section = Tab:AddSection({
	Title = "Omg cool section"
})

-- SecondTab
local SecondSection = SecondTab:AddSection({
	Title = "i like cake"
})

-- Button
local Button = Section:AddButton({
	Title = "test button"
})

local Button2 = Section:AddButton({
	Title = "ok"
})
