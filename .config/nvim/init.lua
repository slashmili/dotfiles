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

-- key mappings in command-line mode
vim.cmd [[
  "Jump to home in Vim's command line
  cnoremap <C-a>  <Home>
  "<UP> goes through the history where starts with text
  cnoremap <C-p>  <UP>
  "Delete to end of command line in Vim
  cnoremap <C-k> <C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>
]]


-- key mappings in normal mode to manage buffers
vim.cmd [[
  "Kill the opened buffer
  nnoremap <C-k> :bd<CR>
  "Toggle between last two buffers
  nnoremap <C-\> :e #<CR>
]]

-- map jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})
