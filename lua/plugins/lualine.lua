    return {
        "nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
        },
	config = function()
		-- Función para hacer transparente Lualine EXCEPTUANDO la sección 'a' (modos)
		local function make_transparent(theme_name)
			local status_ok, theme = pcall(require, "lualine.themes." .. theme_name)
			if not status_ok then
				return nil
			end

			for mode_name, mode in pairs(theme) do
				if type(mode) == "table" then
					for section_name, section in pairs(mode) do
						-- NO borra el fondo si la sección es 'a' (donde va NORMAL, INSERT, etc.)
						if type(section) == "table" and section.bg and section_name ~= "a" then
							section.bg = nil
						end
					end
				end
			end

			-- Definimos colores bien diferenciados para cada modo:
			-- 1. NORMAL: Celeste / Turquesa
			theme.normal.a = { fg = "#1e2326", bg = "#7fbbb3", gui = "bold" }

			-- 2. INSERT: Verde brillante
			theme.insert.a = { fg = "#1e2326", bg = "#a7c080", gui = "bold" }

			-- 3. VISUAL: Rosado / Magenta
			theme.visual.a = { fg = "#1e2326", bg = "#d3939f", gui = "bold" }

			-- 4. REPLACE: Rojo / Coral
			theme.replace.a = { fg = "#1e2326", bg = "#e67e80", gui = "bold" }

			-- 5. COMMAND (:): Amarillo
			if theme.command then
				theme.command.a = { fg = "#1e2326", bg = "#db302", gui = "bold" }
			end

			return theme
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = make_transparent("everforest") or "everforest",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = { "NvimTree" },
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = "#7fbbb3", gui = "bold" },
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", color = { fg = "#9da9a0" } } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "quickfix", "man", "fugitive" },
		})
	end,
}
