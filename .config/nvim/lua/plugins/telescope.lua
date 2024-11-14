return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
	{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files"},
	{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep"},
	{
	  "<C-g>",
	  function ()
	    vim.cmd [[
	      nnoremap <c-g> :execute 'Telescope live_grep theme=dropdown default_text=' . expand('<cword>')<cr>
            ]]
	  end,
	  'open live_grep with current world in the search bar'
	},
	{"<leader>b", "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", desc = "find from buffers"},
	{"<C-p>", "<cmd>Telescope git_files theme=dropdown previewer=false<cr>", desc = "find git files"},
	{"<M-p>", "<cmd>lua require(\"telescope.builtin\").resume()<cr>", desc = "resume the search"},
	{"π", "<cmd>Telescope resume<cr>", desc = "resume search by option+p"},
      },
      config = function()
        require "telescope".setup {
          defaults = {
            mappings = {
              i = {
                ["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume() end,
                ["<C-a>"] = function() vim.cmd "normal! I" end,
                ["<C-e>"] = function() vim.cmd "normal! $" end,
              }
            }
          }
        }
       end
    }
