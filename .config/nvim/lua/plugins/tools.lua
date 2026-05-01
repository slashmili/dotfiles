return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lualine').setup( {sections = { lualine_c = { { 'filename', path = 1 } } }})
    end,
  },
  {
    'jeffkreeftmeijer/vim-numbertoggle'
  },
  {
    'mg979/vim-visual-multi'
  },
  {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = {
        socket_name = "default",
        target_pane = ":.2",
      }
      vim.g.slime_dont_ask_default = 1
      -- Keybinding: send visual selection
      vim.keymap.set("x", "<leader>r", "<Plug>SlimeRegionSend", { silent = true })
    end,
  }
}

