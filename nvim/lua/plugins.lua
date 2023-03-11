return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gruvbox theme
    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
    }

    -- treesitter synac highlight
    -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	
	-- hop easy motion
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}
	require'hop'.setup()
	
	-- marks
	use { "chentoast/marks.nvim" }

end)


