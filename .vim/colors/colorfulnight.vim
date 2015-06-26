"based on kraihlight from
"https://github.com/tempire/dotvim/blob/master/colors/kraihlight.vim

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "colorfulnight"

hi Visual guibg=#404040 ctermbg=238
hi Cursor guibg=#b0d0f0 ctermbg=117

hi Normal guifg=#f9f9f9 guibg=#141414 ctermfg=254
hi Underlined guifg=#f9f9f9 guibg=NONE gui=underline ctermfg=254
hi NonText guifg=#34383c guibg=NONE ctermfg=240
hi SpecialKey guifg=#303030 guibg=NONE ctermfg=239
hi LineNr guifg=#34383c guibg=NONE gui=NONE ctermfg=240
hi StatusLine guifg=black guibg=#666666 gui=NONE
hi StatusLineNC guifg=#666666 guibg=#333333 gui=NONE
hi VertSplit guifg=#303030 guibg=#303030 gui=NONE ctermfg=239 ctermbg=239
hi WildMenu guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254 ctermbg=NONE
hi Folded guifg=#8a9597 guibg=#34383c gui=NONE ctermfg=250
hi FoldColumn guifg=#8a9597 guibg=#34383c gui=NONE ctermfg=250
hi SignColumn guifg=#8a9597 guibg=#34383c gui=NONE ctermfg=250
hi MatchParen guifg=NONE guibg=#a2a96f gui=bold ctermfg=232
hi ErrorMsg guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254
hi WarnMsg guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254
hi ModeMsg guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254
hi MoreMsg guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254
hi Question guifg=#f9f9f9 guibg=NONE gui=NONE ctermfg=254

hi Comment guifg=#726d73 gui=italic ctermfg=240
hi String guifg=#9fac7f ctermfg=150
hi Number guifg=#9fac7f ctermfg=150

hi Keyword guifg=#d6b67f ctermfg=215
hi PreProc guifg=#899ab4 ctermfg=110
hi Conditional guifg=#d6b67f ctermfg=216

hi Todo guifg=#899ab4 gui=italic,bold ctermfg=110
hi Constant guifg=#d08356 ctermfg=209

hi Identifier guifg=#899ab4 ctermfg=110
hi Function guifg=#ab8252 ctermfg=215
hi Type guifg=#d87d5f gui=bold ctermfg=209
hi Statement guifg=#d6b67f ctermfg=215

hi Special guifg=#ac98ac ctermfg=225
hi Delimiter guifg=#f9f9f9 ctermfg=254
hi Operator guifg=#f9f9f9 ctermfg=254

hi Title guifg=#ab8252 gui=underline ctermfg=215
hi Repeat guifg=#d6b67f ctermfg=215
hi Structure guifg=#d6b67f ctermfg=215

hi Directory guifg=#dad085 ctermfg=228
hi Error guibg=#602020 ctermfg=52
hi Pmenu guifg=#000000 guibg=#9CBBDE gui=bold
hi PmenuSel guifg=#000000 guibg=#ffffff
hi CursorColumn guifg=NONE guibg=#303030 gui=NONE ctermbg=236
hi CursorLine guifg=NONE guibg=#000000 gui=none ctermbg=236 cterm=NONE
