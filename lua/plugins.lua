local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end
 
return require('packer').startup(function(use)
 	use "arcticicestudio/nord-vim"
 	-- use "glepnir/galaxyline.nvim"
 	use "romgrk/barbar.nvim"
 	use "hrsh7th/nvim-compe"
 	use "kabouzeid/nvim-lspinstall"
 	use "kevinhwang91/rnvimr"
 	use "kyazdani42/nvim-web-devicons"
 	use "neovim/nvim-lspconfig"
 	use "ryanoasis/vim-devicons"
  use "sheerun/vim-polyglot"
 	use "tpope/vim-commentary"
 	use "tpope/vim-vinegar"
 	use "wbthomason/packer.nvim"
 	use {
 		"nvim-treesitter/nvim-treesitter",
 		run = ":TSUpdate"
 	}
 	use "kyazdani42/nvim-tree.lua"
 
 	-- git
 	use "tpope/vim-fugitive"
 	use "tpope/vim-rhubarb"
 
 	-- telescope
 	use "nvim-telescope/telescope.nvim"
 	use "nvim-telescope/telescope-media-files.nvim"
 	use "nvim-lua/plenary.nvim"
 	use "nvim-lua/popup.nvim"
 
 	use "psliwka/vim-smoothie"
 	use {
 		"iamcco/markdown-preview.nvim",
 		run = "cd app && npm install"
 	}
end)
