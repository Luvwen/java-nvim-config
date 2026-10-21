return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Función para hacer transparente un tema de lualine (opcional pero recomendado con imágenes de fondo)
		local function make_transparent(theme_name)
			local status_ok, theme = pcall(require, "lualine.themes." .. theme_name)
			if not status_ok then
				return nil
			end

			for _, mode in pairs(theme) do
				if type(mode) == "table" then
					for _, section in pairs(mode) do
						if type(section) == "table" and section.bg then
							section.bg = nil
						end
					end
				end
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
				-- Activamos globalstatus para que se vea más limpio con la imagen de fondo
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
				-- Modificamos filename para cambiarle el color del texto con color_file
				lualine_c = {
					{
						"filename",
						path = 1, -- Muestra ruta relativa (0 = solo nombre, 1 = ruta relativa, 2 = absoluta)
						color = { fg = "#7fbbb3", gui = "bold" }, -- Cambia "#7fbbb3" por el color hexadecimal que quieras que resalte
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
