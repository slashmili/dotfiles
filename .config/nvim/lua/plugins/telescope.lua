return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
	{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
	{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep"},
	{"<leader>b", "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", desc = "find from buffers"},
	{"<C-p>", "<cmd>Telescope git_files theme=dropdown previewer=false<cr>", desc = "find git files"},
	{"π", "<cmd>Telescope resume<cr>", desc = "resume search by option+p"},
      },
      config = function()
        require "telescope".setup {
          defaults = {
            mappings = {
              i = {
                ["<C-a>"] = function() vim.cmd "normal! I" end,
                ["<C-e>"] = function() vim.cmd "normal! $" end,
              }
            }
          }
        }
       end
    }
