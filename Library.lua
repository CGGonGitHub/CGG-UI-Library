-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
-- Variables
local UI = require(ReplicatedStorage.UI)
local plr = Players.LocalPlayer


-- Functions
local function Length(Table)
	local counter = 0
	for _, v in pairs(Table) do
		counter = counter + 1
	end
	return counter
end

local Library = {}

-- Functions
local ScreenGui = UI.Create("ScreenGui", {
	Name = "CGG UI Library",
})

function Library:AddWindow(options)
	local Window = {
		Name = "CGG UI Library",
		Type = "Window",
		Title = options.Title or "CGG UI Library",
		Toggled = options.toggled ~= false,
		tabsSlideToggled = options.TabsSlideToggled ~= false,
		Color = options.Color or Color3.fromRGB(0, 255, 0),
		TabsCollection = {}
	}
	-- Window Construction
	Window.Frame = UI.Create("Frame", {
		Name = "Window",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.75,0, 0.5,0),
		Size = UDim2.new(0.225,0, 0.7, 0),
		BackgroundColor3 = Color3.fromRGB(16, 16, 16),
		ClipsDescendants = true,
		Visible = Window.toggled ~= false,

		UI.Create("Frame", {
			Name = "Topbar",
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(34, 34, 34),
			Position = UDim2.new(0.5,0, 0,0),
			Size = UDim2.new(1,0, 0.1,0),

			UI.Create("TextLabel", {
				Name = "Textlabel",
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0, 1,0),
				RichText = true,
				Font = Enum.Font.Ubuntu,
				Text = "<b>"..Window.Title.."</b>",
				TextSize = 22,
				TextColor3 = Window.Color
			})
		}, UDim.new(0, 10)),

		UI.Create("Frame", {
			Name = "Inside",
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			Position = UDim2.new(0.53,0, 0.987,0),
			Size = UDim2.new(0.905,0, 0.875,0)
		}, UDim.new(0, 10)),

		UI.Create("Frame", {
			Name = "TabsSlide",
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			Position = UDim2.new(0,0, 0.1,0),
			Size = UDim2.new(0.35,0, 0.9,0),
			BorderSizePixel = 0,
			ZIndex = 5,


			UI.Create("Frame", {
				Name = "ButtonFrame",
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0, 0.05,0),
				ZIndex = 6,

				UI.Create("TextButton", {
					Name = "Button",
					BackgroundTransparency = 1,
					Position = UDim2.new(0.835,0, 0,0),
					Size = UDim2.new(0.165,0, 1,0),
					Font = Enum.Font.FredokaOne,
					Text = "x",
					TextScaled = true,
					TextColor3 = Color3.fromRGB(124, 124, 124),
					ZIndex = 6,
				}) 
			}),

			UI.Create("Frame", {
				Name = "underButton",
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(39,39,39),
				Position = UDim2.new(0,0, 0.05,0),
				Size = UDim2.new(1,0, 0.011,0),
				ZIndex = 6,
			}),

			UI.Create("ScrollingFrame", {
				Name = "ScrollingFrame",
				BackgroundTransparency = 1,
				Position = UDim2.new(0,0, 0.073,0),
				Size = UDim2.new(1,0, 0.912,0),
				CanvasSize = UDim2.new(0,0, 1.25,0),
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ZIndex = 6,

				UI.Create("UIListLayout", {
					Padding = UDim.new(0,4),
					SortOrder = Enum.SortOrder.LayoutOrder

				})
			}),
		}),

	}, UDim.new(0, 10))

	Window.TabsFolder = UI.Create("Folder", {
		Name = "TabsFolder",
	})

	Window.Frame.TabsSlide.ButtonFrame.Button.Activated:Connect(function()
		Window:ToggleTabsSlide(Window.TabsSlideToggled)
	end)
	-- Toggle Window
	function Window:Toggle(bool)
		self.Toggled = bool
		self.Frame.Visible = bool
	end
	-- Toggle TabsSlide
	local TabsSlideIn = TweenService:Create(Window.Frame.TabsSlide, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {Position = UDim2.new(0,0, 0.1,0)})
	local TabsSlideOut = TweenService:Create(Window.Frame.TabsSlide, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {Position = UDim2.new(-0.29,0, 0.1,0)})
	function Window:ToggleTabsSlide(bool) -- toggle tabs || true = out , false = in  ||
		self.TabsSlideToggled = not bool
		if bool then
			TabsSlideIn:Cancel()
			TabsSlideOut:Play()
		else
			TabsSlideOut:Cancel()
			TabsSlideIn:Play()
		end
	end
	-- End Window

	function Window:AddTab(options)
		local amountOfTabs = Length(Window.TabsCollection)
		local Tab = {
			TabIndex = amountOfTabs + 1,
			Toggled = false,
			Title = options.Title or "Tab",
			BackgroundColor3 = options.BackgroundColor or Color3.fromRGB(74,74,74),
			FontColor = options.FontColor or Color3.fromRGB(255,255,255),
			Sections = {}
		}

		Window.TabsCollection[Tab.TabIndex] = Tab
		Tab.TabButtonFrame = UI.Create("Frame", {
			Name = "TabButtonFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0, 0.08,0),
			ZIndex = 6,


			UI.Create("Frame", {
				Name = "BorderFrame",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(0,0,0),
				Position = UDim2.new(0.5,0, 0.5,0),
				Size = UDim2.new(0.9,0, 1,0),
				ZIndex = 6,

				UI.Create("TextButton", {
					Name = "TabButton",
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Tab.BackgroundColor,
					Position = UDim2.new(0.5,0, 0.5,0),
					Size = UDim2.new(0.96,0, 0.9,0),
					Text = "<b>"..Tab.Title.."</b>",
					TextScaled = true,
					RichText = true,
					Font = Enum.Font.Ubuntu,
					TextColor3 = Tab.FontColor,
					ZIndex = 6,
				}, UDim.new(0,8)),

			}, UDim.new(0,8)),
		})

		Tab.TabFrame = UI.Create("ScrollingFrame", {
			Name = Tab.TabIndex,
			BackgroundColor3 = Color3.fromRGB(30,30,30),
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(0.905,0, 0.875,0),
			ZIndex = 2,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = 0,
		}, UDim.new(0, 8))

		-- Functions
		function Tab:Show()
			Tab.TabFrame.Position = UDim2.new(0.53,0, 0.987,0)
		end

		function Tab:Hide()
			Tab.TabFrame.Position = UDim2.new(5,0,0,0)
		end


		Tab.TabButtonFrame.BorderFrame.TabButton.Activated:Connect(function()
			Tab:Show()
			for i, v in next, Window.TabsCollection do
				if v.TabIndex ~= Tab.TabIndex then
					v:Hide()
				end
			end
		end)
		-- Section
		function Tab:AddSection(options)
			local Section = {
				Title = options.Title or "Section",
				BackgroundColor = options.BackgroundColor or Color3.fromRGB(31,31,31),
				FontColor = options.FontColor or Color3.fromRGB(0,0,0),
				toggled = true,
				height = 45,
				Components = {}
			}

			table.insert(Tab.Sections, Section)

			Section.SectionFill = UI.Create("Frame", {
				Name = "SectionFill",
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.fromRGB(80,80,80),
				Position = UDim2.new(0.5,0, 0,10),
				Size = UDim2.new(0.95,0, 0,200),
				ZIndex = 3,
			}, UDim.new(0,8))

			Section.SectionBorder = UI.Create("Frame", {
				Name = "SectionTextBorder",
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundColor3 = Color3.fromRGB(15, 15, 15),
				Position = UDim2.new(0.5,0, 0,5),
				Size = UDim2.new(0.99,0, 0,40),
				ZIndex = 3,

				UI.Create("TextLabel", {
					Name = "SectionTextLabel",
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Section.BackgroundColor,
					Position = UDim2.new(0.5,0, 0.5,0),
					Size = UDim2.new(0.98,0, 0.8,0),
					Text = Section.Title,
					TextColor3 = Section.FontColor,
					Font = Enum.Font.Ubuntu,
					TextScaled = true,
					ZIndex = 3,

					UI.Create("TextButton", {
						Name = "SectionToggleButton",
						BackgroundTransparency = 1,
						Position = UDim2.new(1,-40, 0,-2),
						Size = UDim2.new(0,40, 1,0),
						Text = "x",
						Font = Enum.Font.FredokaOne,
						TextColor3 = Color3.fromRGB(0,0,0),
						TextScaled = true,
						ZIndex = 3,
					})
				}, UDim.new(0, 15))
			}, UDim.new(0,15))

			Section.SectionBorderLine = UI.Create("Frame", {
				Name = "SectionBorderLine",
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundColor3 = Color3.fromRGB(150, 150, 150),
				Position = UDim2.new(0.5,0, 0,50),
				Size = UDim2.new(1,0, 0,5),
				ZIndex = 3,
			})

			-- Functions

			function Section:GetHeight()
				print(Section.height)
				return Section.height
			end

			-- Toggle Section
			function Section:ToggleSection()
				if Section.toggled then
					for i, v in next, Section.Components do
						v.ButtonBorder.Position = UDim2.new(-999, -999, -999, -999)
					end
					local SectionTweenOut = TweenService:Create(Section.SectionFill, TweenInfo.new(0.5), {Size = UDim2.new(0.95,0, 0,50)})
					Section.SectionBorder.SectionTextLabel.SectionToggleButton.Text = "x"
					SectionTweenOut:Play()
					Section.SectionBorderLine.Transparency = 1
					Section.height = 50
				else
					Section.height += 15
					for i, v in next, Section.Components do
						if v.componentType == "button" then
							v.ButtonBorder.Position = UDim2.new(0.5,0, 0,Section:GetHeight())
							Section.height += 40
						end
					end
					local SectionTweenIn = TweenService:Create(Section.SectionFill, TweenInfo.new(0.5), {Size = UDim2.new(0.95,0, 0, Section:GetHeight() + 10)})
					Section.SectionBorder.SectionTextLabel.SectionToggleButton.Text = "-"
					SectionTweenIn:Play()
					Section.SectionBorderLine.Transparency = 0
				end
				Section.toggled = not Section.toggled
			end

			Section.SectionBorder.SectionTextLabel.SectionToggleButton.Activated:Connect(function()
				Section:ToggleSection()
			end)

			-- Button
			function Section:AddButton(options)
				local Button = {
					Title = options.Title or "Button",
					Image = options.image or nil,
					componentType = "button"

				}

				Button.ButtonBorder = UI.Create("Frame", {
					Name = "ButtonBorder",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(52, 52, 52),
					Position = UDim2.new(0.5,0, 0, Section:GetHeight() + 15),
					Size = UDim2.new(0.95,0, 0,40),
					ZIndex = 3
				}, UDim.new(0, 10))

				if options.Image then
					Button.ButtonImage = UI.Create("ImageLabel", {
						Name = "ButtonImage",
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0,5, 0.5,0),
						Size = UDim2.new(0,35, 0,35),
						ZIndex = 3,
					}, UDim.new(0, 10))
				end

				Button.Button = UI.Create("Frame", {
					Name = "Button",
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(135, 135, 135),
					Position = UDim2.new(0.5,20, 0.5,0),
					Size = UDim2.new(1,-55, 0.8,0),
					ZIndex = 3
				}, UDim.new(0, 10))

				-- Functions
				table.insert(Section.Components, Button)

				Section.height += 40

				-- Parenting
				Button.ButtonBorder.Parent = Section.SectionFill
				if options.Image then
					Button.ButtonImage.Parent = Button.ButtonBorder
				end
				Button.Button.Parent = Button.ButtonBorder
				return Button
			end
			
			function Section:AddToggle(options)
				local Toggle = {
					Title = options.Title or "Title",
					
				}
			end
			
			-- Toggle Circle left: UDim2.new(0,0, 0.5,0)
			-- Toggle Circle right: UDim2.nw(0,50, 0.5,0)
			
			
			Section.SectionFill.Parent = Tab.TabFrame
			Section.SectionBorder.Parent = Section.SectionFill
			Section.SectionBorderLine.Parent = Section.SectionFill
			return Section
		end


		Tab.TabFrame.Parent = Window.TabsFolder
		Tab.TabButtonFrame.Parent = Window.Frame.TabsSlide.ScrollingFrame
		return Tab
	end
	Window.TabsFolder.Parent = Window.Frame
	Window.Frame.Parent = ScreenGui
	return Window
end



ScreenGui.Parent = plr.PlayerGui

return Library
