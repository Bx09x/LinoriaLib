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
		['Paper Light'] 	= { 4, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"f8f8f8","AccentColor":"3b82f6","BackgroundColor":"f2f2f2","OutlineColor":"d0d0d0"}') },
		['Ember Slate'] 	= { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3c3c3c","AccentColor":"ff6400","BackgroundColor":"323232","OutlineColor":"464646"}') },
		['Frostbyte']	 	= { 6, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f2a35","AccentColor":"00d4ff","BackgroundColor":"121a22","OutlineColor":"2d3b47"}') },
		['Ice Minimal'] 	= { 7, httpService:JSONDecode('{"FontColor":"eaf6ff","MainColor":"202a33","AccentColor":"4fc3f7","BackgroundColor":"0f141a","OutlineColor":"2a3642"}') },
		['Forest Terminal'] = { 8, httpService:JSONDecode('{"FontColor":"c8facc","MainColor":"1b2b23","AccentColor":"2ecc71","BackgroundColor":"0f1a14","OutlineColor":"2a3d33"}') },
		['BBot'] 			= { 9, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}') },
		['Fatality']		= { 10, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}') },
		['Jester'] 			= { 11, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
		['Mint'] 			= { 12, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
		['Black Noir'] 		= { 13, httpService:JSONDecode('{"FontColor":"eaeaea","MainColor":"121212","AccentColor":"ffffff","BackgroundColor":"050505","OutlineColor":"1e1e1e"}') },
		['Tokyo Night'] 	= { 14, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}') },
		['Ubuntu'] 			= { 15, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}') },
		['Quartz'] 			= { 16, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}') },
		['Cyberpunk 2077'] 	= { 17, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1a1423","AccentColor":"00f3ff","BackgroundColor":"0f0b17","OutlineColor":"ff00aa"}') },
    	['Void Purple'] 	= { 18, httpService:JSONDecode('{"FontColor":"e0d9ff","MainColor":"1c1628","AccentColor":"9b6cff","BackgroundColor":"110d1a","OutlineColor":"3a2e5c"}') },
    	['Crimson Edge'] 	= { 19, httpService:JSONDecode('{"FontColor":"fff0f0","MainColor":"2b1a1a","AccentColor":"ff2d55","BackgroundColor":"1a1111","OutlineColor":"4a2a2a"}') },
    	['Ocean Depths'] 	= { 20, httpService:JSONDecode('{"FontColor":"c8f0ff","MainColor":"0f1f2e","AccentColor":"00b4ff","BackgroundColor":"0a1824","OutlineColor":"1e3a5c"}') },
    	['Matrix Rain'] 	= { 21, httpService:JSONDecode('{"FontColor":"00ff9f","MainColor":"0a140f","AccentColor":"00ff41","BackgroundColor":"050a07","OutlineColor":"1a2e22"}') },
    	['Solar Flare'] 	= { 22, httpService:JSONDecode('{"FontColor":"fff7e6","MainColor":"2f1f0f","AccentColor":"ff9d00","BackgroundColor":"1c1408","OutlineColor":"4a3a22"}') },
    	['Arctic Aurora'] 	= { 23, httpService:JSONDecode('{"FontColor":"e0f8ff","MainColor":"0f1f2b","AccentColor":"00e6c8","BackgroundColor":"0a1620","OutlineColor":"23485c"}') },
    	['Amethyst'] 		= { 24, httpService:JSONDecode('{"FontColor":"f5e6ff","MainColor":"22172f","AccentColor":"b14cff","BackgroundColor":"181022","OutlineColor":"3f2a5c"}') },
    	['Blood Moon'] 		= { 25, httpService:JSONDecode('{"FontColor":"ffe6e6","MainColor":"2b1a22","AccentColor":"c41e3a","BackgroundColor":"1a1216","OutlineColor":"4a2a35"}') },
    	['Electric Lime'] 	= { 26, httpService:JSONDecode('{"FontColor":"f0ffe6","MainColor":"1f2a1a","AccentColor":"bfff00","BackgroundColor":"141f12","OutlineColor":"3a4a2a"}') },
    	['Rose Quartz'] 	= { 27, httpService:JSONDecode('{"FontColor":"fff0f5","MainColor":"2f1f28","AccentColor":"ff69b4","BackgroundColor":"1f1620","OutlineColor":"4a2f3f"}') },
    	['Stealth Gray'] 	= { 28, httpService:JSONDecode('{"FontColor":"e0e0e0","MainColor":"1c1c1c","AccentColor":"a0a0a0","BackgroundColor":"111111","OutlineColor":"333333"}') },
    	['Neon Synthwave'] 	= { 29, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1f0f2b","AccentColor":"ff00ff","BackgroundColor":"14071f","OutlineColor":"6b1e8c"}') },
    	['Emerald Core'] 	= { 30, httpService:JSONDecode('{"FontColor":"e6ffe6","MainColor":"0f211a","AccentColor":"00cc7a","BackgroundColor":"0a1a14","OutlineColor":"1f3f33"}') },
    	['Obsidian'] 		= { 31, httpService:JSONDecode('{"FontColor":"e8e8e8","MainColor":"0f0f0f","AccentColor":"666666","BackgroundColor":"080808","OutlineColor":"1f1f1f"}') },
		['Balti'] 			= { 32, httpService:JSONDecode('{"FontColor":"f2f2ff","MainColor":"1a1826","AccentColor":"7a5cff","BackgroundColor":"0f0d18","OutlineColor":"332f4d"}') },
		['Groovy'] 			= { 33, httpService:JSONDecode('{"FontColor":"f8ffff","MainColor":"1a2a24","AccentColor":"00d98b","BackgroundColor":"101914","OutlineColor":"2f4a3d"}') },
		['Sonic'] 			= { 34, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"10203a","AccentColor":"008cff","BackgroundColor":"09111f","OutlineColor":"245a9c"}') },
		['Soviet Spyware'] 	= { 35, httpService:JSONDecode('{"FontColor":"ffd9d9","MainColor":"2b1111","AccentColor":"cc0000","BackgroundColor":"140808","OutlineColor":"5a1f1f"}') },
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
