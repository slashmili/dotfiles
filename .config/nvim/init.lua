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

-- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
vim.opt.hidden = true
vim.opt.scrolloff = 9
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
-- Highlight matching parens, brackets, etc.
vim.opt.showmatch = true

vim.cmd [[
  "vimrc todo config helpers
   nnoremap <Leader>e :e ~/.config/nvim/init.lua<CR>
   nnoremap <Leader>r :source ~/.config/nvim/init.lua<CR>
]]

-- key mappings in command-line mode
vim.cmd [[
  "Jump to home in Vim's command line
  cnoremap <C-a>  <Home>
  "<UP> goes through the history where starts with text
  cnoremap <C-p>  <UP>
  "Delete to end of command line in Vim
  cnoremap <C-k> <C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>
]]


-- key mappings in normal mode
vim.cmd [[
  "Kill the opened buffer
  nnoremap <C-k> :bd<CR>
  "Toggle between last two buffers
  nnoremap <C-\> :e #<CR>

  " Yank path to current file to clipboard
  nnoremap yp :let @+=expand("%")<CR>
  noremap <C-j> i<CR><ESC>
]]

-- key mappings in visual mode
vim.cmd [[
  "Paste without yanking
  xnoremap <leader>p "_dp
]]

-- show spaces and tabs with . and >
vim.cmd [[  "
  set list
  set listchars+=space:.
]]

-- map jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})


-- configure tabs for js/css/lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "css", "lua"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- jump to last position
vim.cmd [[
  " :help last-position-jump
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]
