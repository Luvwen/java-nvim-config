local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Set a vim motion to <Shift>m to mark a file with harpoon
		vim.keymap.set(
			"n",
			"<s-m>",
			"<cmd>lua require('plugins.harpoon').mark_file()<cr>",
			{ desc = "Harpoon Mark File" }
		)
		-- Set a vim motion to the tab key to open the harpoon menu to easily navigate frequented files
		vim.keymap.set(
			"n",
			"<s-u>",
			"<cmd>lua require('plugins.harpoon').unmark_file()<cr>",
			{ desc = "Harpoon Unmark File" }
		)
		vim.keymap.set(
			"n",
			"<TAB>",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Harpoon Toggle Menu" }
		)
	end,
}

function M.mark_file()
	require("harpoon.mark").add_file()
	vim.notify("󱡅  marked file")
end

function M.unmark_file()
    -- Usamos la función interna de harpoon para remover el archivo actual de la lista
    require("harpoon.mark").rm_file()
    vim.notify("󰅖 unmarked file")
end

return M
