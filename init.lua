local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Declare a few options for lazy
local opts = {
	change_detection = {
		-- Don't notify us every time a change is made to the configuration
		notify = false,
	},
	checker = {
		-- Automatically check for package updates
		enabled = true,
		-- Don't spam us with notification every time there is an update available
		notify = false,
	},
}

-- vim.treesitter.start = function() end

-- Load the options from the config/options.lua file
require("config.options")
-- Load the keymaps from the config/keymaps.lua file
require("config.keymaps")
-- Load the auto commands from the config/autocmds.lua file
require("config.autocmds")
-- Setup lazy, this should always be last
-- Tell lazy that all plugin specs are found in the plugins directory
-- Pass it the options we specified above
require("lazy").setup("plugins", opts)

-- ============================================================================
-- CONFIGURACIÓN DE TRANSPARENCIA PARA EVERFOREST Y TERMINAL
-- ============================================================================

vim.g.everforest_transparent_background = 1
vim.cmd.colorscheme("everforest")

vim.api.nvim_create_autocmd("colorscheme", {
	pattern = "everforest",
	callback = function()
		vim.cmd([[
      highlight normal guibg=none ctermbg=none
      highlight normalnc guibg=none ctermbg=none
      highlight signcolumn guibg=none ctermbg=none
      highlight endofbuffer guibg=none ctermbg=none
      highlight foldcolumn guibg=none ctermbg=none
      highlight winbar guibg=none ctermbg=none
      highlight winbarnc guibg=none ctermbg=none
      highlight linenr guibg=none ctermbg=none
      highlight cursorlinenr guibg=none ctermbg=none
      highlight statusline guibg=none ctermbg=none
      highlight statuslinenc guibg=none ctermbg=none
      highlight tabline guibg=none ctermbg=none
      highlight tablinefill guibg=none ctermbg=none
      highlight tablinesel guibg=none ctermbg=none
      highlight cursorline guibg=none ctermbg=none
      highlight cursorlinesign guibg=none ctermbg=none
      highlight cursorlinefold guibg=none ctermbg=none
    ]])
	end,
})

-- forzarlo inmediatamente también
vim.cmd([[
  highlight normal guibg=none ctermbg=none
  highlight normalnc guibg=none ctermbg=none
  highlight signcolumn guibg=none ctermbg=none
  highlight endofbuffer guibg=none ctermbg=none
  highlight foldcolumn guibg=none ctermbg=none
  highlight winbar guibg=none ctermbg=none
  highlight winbarnc guibg=none ctermbg=none
  highlight linenr guibg=none ctermbg=none
  highlight cursorlinenr guibg=none ctermbg=none
  highlight statusline guibg=none ctermbg=none
  highlight statuslinenc guibg=none ctermbg=none
  highlight tabline guibg=none ctermbg=none
  highlight tablinefill guibg=none ctermbg=none
  highlight tablinesel guibg=none ctermbg=none
  highlight cursorline guibg=none ctermbg=none
  highlight cursorlinesign guibg=none ctermbg=none
  highlight cursorlinefold guibg=none ctermbg=none
]])
