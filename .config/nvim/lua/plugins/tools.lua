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
   }
}

