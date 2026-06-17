local httpService = game:GetService('HttpService')
local ThemeManager = {} do
	ThemeManager.Folder = 'LinoriaLibSettings'
	-- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

	ThemeManager.Library = nil
	
	ThemeManager.DefaultTheme = "Default"
	
	ThemeManager.BuiltInThemes = {
		['Default'] 		= { 1, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"0055ff","BackgroundColor":"141414","OutlineColor":"323232"}') },
		['Sunset Neon'] 	= { 2, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"221a2e","AccentColor":"ff7a18","BackgroundColor":"120b1a","OutlineColor":"3a2a4a"}') },
		['Gold Prestige'] 	= { 3, httpService:JSONDecode('{"FontColor":"f5f0e6","MainColor":"2a2418","AccentColor":"d4af37","BackgroundColor":"14110b","OutlineColor":"3b3426"}') },
		['Ember Slate'] 	= { 4, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3c3c3c","AccentColor":"ff6400","BackgroundColor":"323232","OutlineColor":"464646"}') },
		['Frostbyte'] 		= { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f2a35","AccentColor":"00d4ff","BackgroundColor":"121a22","OutlineColor":"2d3b47"}') },
		['Forest Terminal'] = { 6, httpService:JSONDecode('{"FontColor":"c8facc","MainColor":"1b2b23","AccentColor":"2ecc71","BackgroundColor":"0f1a14","OutlineColor":"2a3d33"}') },
		['BBot'] 			= { 7, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}') },
		['Fatality'] 		= { 8, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}') },
		['Tokyo Night'] 	= { 9, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}') },
		['Black Noir'] 		= { 10, httpService:JSONDecode('{"FontColor":"eaeaea","MainColor":"121212","AccentColor":"ffffff","BackgroundColor":"050505","OutlineColor":"1e1e1e"}') },
		['Cyberpunk 2077'] 	= { 11, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1423","AccentColor":"00f3ff","BackgroundColor":"0f0b17","OutlineColor":"ff00aa"}') },
		['Void Purple'] 	= { 12, httpService:JSONDecode('{"FontColor":"e0d9ff","MainColor":"1c1628","AccentColor":"9b6cff","BackgroundColor":"110d1a","OutlineColor":"3a2e5c"}') },
		['Crimson Edge'] 	= { 13, httpService:JSONDecode('{"FontColor":"fff0f0","MainColor":"2b1a1a","AccentColor":"ff2d55","BackgroundColor":"1a1111","OutlineColor":"4a2a2a"}') },
		['Matrix Rain'] 	= { 14, httpService:JSONDecode('{"FontColor":"00ff9f","MainColor":"0a140f","AccentColor":"00ff41","BackgroundColor":"050a07","OutlineColor":"1a2e22"}') },
		['Solar Flare'] 	= { 15, httpService:JSONDecode('{"FontColor":"fff7e6","MainColor":"2f1f0f","AccentColor":"ff9d00","BackgroundColor":"1c1408","OutlineColor":"4a3a22"}') },
		['Amethyst'] 		= { 16, httpService:JSONDecode('{"FontColor":"f5e6ff","MainColor":"22172f","AccentColor":"b14cff","BackgroundColor":"181022","OutlineColor":"3f2a5c"}') },
		['Obsidian'] 		= { 17, httpService:JSONDecode('{"FontColor":"e8e8e8","MainColor":"0f0f0f","AccentColor":"666666","BackgroundColor":"080808","OutlineColor":"1f1f1f"}') },
		['Neon Synthwave'] 	= { 18, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f0f2b","AccentColor":"ff00ff","BackgroundColor":"14071f","OutlineColor":"6b1e8c"}') },
		['Emerald Core'] 	= { 19, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0f211a","AccentColor":"00cc7a","BackgroundColor":"0a1a14","OutlineColor":"1f3f33"}') },
		['Balti'] 			= { 20, httpService:JSONDecode('{"FontColor":"f2f2ff","MainColor":"1a1826","AccentColor":"7a5cff","BackgroundColor":"0f0d18","OutlineColor":"332f4d"}') },
		['Groovy'] 			= { 21, httpService:JSONDecode('{"FontColor":"f8ffff","MainColor":"1a2a24","AccentColor":"00d98b","BackgroundColor":"101914","OutlineColor":"2f4a3d"}') },
		['Sonic'] 			= { 22, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"10203a","AccentColor":"008cff","BackgroundColor":"09111f","OutlineColor":"245a9c"}') },
		['Vaporwave']       = { 23, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"2a1b4d","AccentColor":"ff69b4","BackgroundColor":"1f1438","OutlineColor":"6b4e9c"}') },
		['Lava Flow']       = { 24, httpService:JSONDecode('{"FontColor":"ffe6cc","MainColor":"3d1f0f","AccentColor":"ff4500","BackgroundColor":"2a1408","OutlineColor":"5c2a1a"}') },
		['Deep Space']      = { 25, httpService:JSONDecode('{"FontColor":"d0f0ff","MainColor":"0a0f1f","AccentColor":"00b3ff","BackgroundColor":"05080f","OutlineColor":"1a2a4d"}') },
		['Candy Pop']       = { 26, httpService:JSONDecode('{"FontColor":"fff0f5","MainColor":"2f1a2f","AccentColor":"ff4dff","BackgroundColor":"1f1421","OutlineColor":"5c2a5c"}') },
		['Samurai']         = { 27, httpService:JSONDecode('{"FontColor":"fff2e6","MainColor":"2b1a1a","AccentColor":"e60000","BackgroundColor":"1f1313","OutlineColor":"4d2a2a"}') },
		['Midnight Galaxy'] = { 28, httpService:JSONDecode('{"FontColor":"e6e0ff","MainColor":"1a1428","AccentColor":"9b7cff","BackgroundColor":"0f0b1a","OutlineColor":"3a2e5c"}') },
		['Toxic Waste']     = { 29, httpService:JSONDecode('{"FontColor":"e0ffcc","MainColor":"1f2a1a","AccentColor":"39ff14","BackgroundColor":"0f1a0f","OutlineColor":"2a4a2a"}') },
		['Royal Velvet']    = { 30, httpService:JSONDecode('{"FontColor":"f5e6ff","MainColor":"2a1a3d","AccentColor":"9b4dff","BackgroundColor":"1f1433","OutlineColor":"4a2a6b"}') },
		['Arctic Ice']      = { 31, httpService:JSONDecode('{"FontColor":"f0faff","MainColor":"1a2a35","AccentColor":"7ed6ff","BackgroundColor":"0f1f2b","OutlineColor":"2a455c"}') },
		['Desert Dusk']     = { 32, httpService:JSONDecode('{"FontColor":"fff7e6","MainColor":"3d2a1f","AccentColor":"ffaa33","BackgroundColor":"2a1f14","OutlineColor":"5c4533"}') },
		['Electric Dream']  = { 33, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f0f2b","AccentColor":"00ffff","BackgroundColor":"14071f","OutlineColor":"4a2a7a"}') },
		['Blood Raven']     = { 34, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"2b1a22","AccentColor":"b30000","BackgroundColor":"1f1419","OutlineColor":"4a2a35"}') },
		['Mint Chocolate']  = { 35, httpService:JSONDecode('{"FontColor":"f0fff0","MainColor":"1f2a24","AccentColor":"3be8a3","BackgroundColor":"141f1a","OutlineColor":"2f4a3f"}') },
		['Phantom']         = { 36, httpService:JSONDecode('{"FontColor":"e8e8ff","MainColor":"1a1a2b","AccentColor":"8888ff","BackgroundColor":"11111f","OutlineColor":"2f2f4d"}') },
		['Coral Reef']      = { 37, httpService:JSONDecode('{"FontColor":"fff0f5","MainColor":"2a1f2b","AccentColor":"ff6b9d","BackgroundColor":"1f1621","OutlineColor":"4a2f45"}') },
		['Neon Jungle']     = { 38, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"1a2b1f","AccentColor":"00ff88","BackgroundColor":"0f1f14","OutlineColor":"2a4a33"}') },
		['Obsidian Flame']  = { 39, httpService:JSONDecode('{"FontColor":"ffe6d9","MainColor":"1f0f0f","AccentColor":"ff4422","BackgroundColor":"140a0a","OutlineColor":"4a2a2a"}') },
		['Holo Prism']      = { 40, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f1a2f","AccentColor":"ff00cc","BackgroundColor":"141022","OutlineColor":"3f2a66"}') },
		['Storm Surge']     = { 41, httpService:JSONDecode('{"FontColor":"e6f0ff","MainColor":"1a2633","AccentColor":"4da6ff","BackgroundColor":"0f1a26","OutlineColor":"2a3f5c"}') },
		['Voidwalker']      = { 42, httpService:JSONDecode('{"FontColor":"e0d9ff","MainColor":"0f0a1f","AccentColor":"7b5cff","BackgroundColor":"0a0614","OutlineColor":"2a1f4a"}') },
	}

	function ThemeManager:ApplyTheme(theme)
		local customThemeData = self:GetCustomTheme(theme)
		local data = customThemeData or self.BuiltInThemes[theme]

		if not data then return end

		-- custom themes are just regular dictionaries instead of an array with { index, dictionary }

		for idx, col in next, (customThemeData or data[2]) do
			self.Library[idx] = Color3.fromHex(col)
			
			if Options and Options[idx] then
    			Options[idx]:SetValueRGB(Color3.fromHex(col))
			end
		end

		self:ThemeUpdate()
	end

	function ThemeManager:ThemeUpdate()
		-- This allows us to force apply themes without loading the themes tab :)
		local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
		for i, field in next, options do
			if Options and Options[field] then
				self.Library[field] = Options[field].Value
			end
		end

		self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
		self.Library:UpdateColorsUsingRegistry()
	end

	function ThemeManager:LoadDefault()		
		local theme = 'Default'
		local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

		local isDefault = true
		if content then
			if self.BuiltInThemes[content] then
				theme = content
			elseif self:GetCustomTheme(content) then
				theme = content
				isDefault = false;
			end
		elseif self.BuiltInThemes[self.DefaultTheme] then
		 	theme = self.DefaultTheme
		end

		self:ApplyTheme(theme)
		if Options and Options.ThemeManager_ThemeList then
    		Options.ThemeManager_ThemeList:SetValue(theme)
		end
	end

	function ThemeManager:SaveDefault(theme)
		writefile(self.Folder .. '/themes/default.txt', theme)
	end

	function ThemeManager:CreateThemeManager(groupbox)
		groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
		groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
		groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
		groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
		groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });

		local ThemesArray = {}
		for Name in next, self.BuiltInThemes do
			table.insert(ThemesArray, Name)
		end

		table.sort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

		groupbox:AddDivider()
		groupbox:AddDropdown('ThemeManager_ThemeList', { Text = 'Theme list', Values = ThemesArray, Default = 1 })

		groupbox:AddButton('Set as default', function()
			self:SaveDefault(Options.ThemeManager_ThemeList.Value)
			self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_ThemeList.Value))
		end)

		Options.ThemeManager_ThemeList:OnChanged(function()
			self:ApplyTheme(Options.ThemeManager_ThemeList.Value)
		end)

		groupbox:AddDivider()
		groupbox:AddInput('ThemeManager_CustomThemeName', { Text = 'Custom theme name' })
		groupbox:AddDropdown('ThemeManager_CustomThemeList', { Text = 'Custom themes', Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 })
		groupbox:AddDivider()
		
		groupbox:AddButton('Save theme', function() 
			self:SaveCustomTheme(Options.ThemeManager_CustomThemeName.Value:gsub("%.json$", ""))

			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end):AddButton('Load theme', function() 
			self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value) 
		end)

		groupbox:AddButton('Refresh list', function()
			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end)

		groupbox:AddButton('Set as default', function()
			if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
				self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)
				self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_CustomThemeList.Value))
			end
		end)

		ThemeManager:LoadDefault()

		local function UpdateTheme()
			self:ThemeUpdate()
		end

		Options.BackgroundColor:OnChanged(UpdateTheme)
		Options.MainColor:OnChanged(UpdateTheme)
		Options.AccentColor:OnChanged(UpdateTheme)
		Options.OutlineColor:OnChanged(UpdateTheme)
		Options.FontColor:OnChanged(UpdateTheme)
	end

	function ThemeManager:GetCustomTheme(file)
		local path = self.Folder .. '/themes/' .. file
		if not isfile(path) then
			return nil
		end

		local data = readfile(path)
		local success, decoded = pcall(httpService.JSONDecode, httpService, data)
		
		if not success then
			return nil
		end

		return decoded
	end

	function ThemeManager:SaveCustomTheme(file)
		file = file:gsub("%s+", "")
		if file == '' then
			return self.Library:Notify('Invalid file name for theme (empty)', 3)
		end

		local theme = {}
		local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

		for _, field in next, fields do
			theme[field] = Options[field].Value:ToHex()
		end

		writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
	end

	function ThemeManager:ReloadCustomThemes()
		local list = listfiles(self.Folder .. '/themes')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:match("%.json$") then
				-- i hate this but it has to be done ...

				local pos = file:find('.json', 1, true)
				local char = file:sub(pos, pos)

				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1))
				end
			end
		end

		return out
	end

	function ThemeManager:SetLibrary(lib)
		self.Library = lib
	end

	function ThemeManager:BuildFolderTree()
		local paths = {}

		-- build the entire tree if a path is like some-hub/phantom-forces
		-- makefolder builds the entire tree on Synapse X but not other exploits

		local parts = self.Folder:split('/')
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, '/', 1, idx)
		end

		table.insert(paths, self.Folder .. '/themes')
		table.insert(paths, self.Folder .. '/settings')

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function ThemeManager:SetFolder(folder)
		self.Folder = folder
		self:BuildFolderTree()
	end

	function ThemeManager:CreateGroupBox(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		return tab:AddLeftGroupbox('Themes')
	end

	function ThemeManager:ApplyToTab(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		local groupbox = self:CreateGroupBox(tab)
		self:CreateThemeManager(groupbox)
	end

	function ThemeManager:ApplyToGroupbox(groupbox)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		self:CreateThemeManager(groupbox)
	end

	ThemeManager:BuildFolderTree()
end

return ThemeManager
