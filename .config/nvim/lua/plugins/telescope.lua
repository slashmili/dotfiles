return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
	{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
	{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep"},
	{"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find files"},
      }
    }
