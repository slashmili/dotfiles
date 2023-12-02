return {
  {
    'lewis6991/gitsigns.nvim',
    config = true
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    keys = {
      {
        '<Leader>g', '<cmd>Neogit<CR>', desc='open neogit window'
      }
    },
    config = true
  }
}
