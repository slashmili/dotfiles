return {
  {
    "neovim/nvim-lspconfig", 
    config = function() 
      require'lspconfig'.elixirls.setup{
           cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") };
      }

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
            vim.lsp.buf.format()
        end,
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "vim", "elixir", "eex", "heex" },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
      },
    }
    end
  },
  {
    "vim-test/vim-test",
    keys = {
      {"<Leader>t", "<cmd>TestNearest<CR>", desc="Runs the test"},
    },
    config = function ()
      local function ElixirPryTransform(cmd)
        local modified_cmd = cmd:gsub('^mix%s*', '')
        return "MIX_ENV=test iex --dbg pry -S mix do " .. modified_cmd .. " --trace + run -e 'System.halt'"
      end
      vim.g['test#custom_transformations'] = {elixir = ElixirPryTransform}
      vim.g['test#transformation'] = 'elixir'

      vim.g['test#strategy'] = 'neovim'
      vim.api.nvim_set_keymap('i', '<Leader>t', '<Esc> :w<CR> :TestNearest<CR>', {noremap = true, silent = true})
    end
  },
  {
    'tpope/vim-endwise'
    }
}
