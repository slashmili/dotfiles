local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
-- require("lazy").setup(plugins, opts)

vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":e ~/.config/nvim/init.lua<CR>",
  { noremap = true }
 )

vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":source ~/.config/nvim/init.lua<CR>",
  { noremap = true }
 )


-- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
vim.opt.hidden = true
vim.opt.scrolloff = 9
vim.opt.number = true
vim.cursorline = true

-- Jump to begining in Vim's command line
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', {noremap = true, silent = false})

-- map jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})

-- Toggle between last two buffers
vim.api.nvim_set_keymap('n', '<C-\\>', ':e #<CR>', {noremap = true, silent = true})
