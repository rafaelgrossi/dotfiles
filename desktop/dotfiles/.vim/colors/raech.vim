:set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "Raech"

function!  GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '
  if strlen(a:1)
    let histring .= 'guifg=' . a:1 . ' '
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' '
  endif

  execute histring
endfunction


function!  GuiWBGFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

autocmd InsertEnter * highlight Cursor guibg=#00FF00
autocmd InsertLeave * highlight Cursor guibg=#FF0000 guifg=#2d2d2d
:call GuiFor("Ignore", "#ffffff")
:call GuiWBGFor("Normal", "#2d2d2d", "#429642")
:call GuiFor("Comment", "#DEB887")
:call GuiFor("Underlined", "#ffffff")
:call GuiFor("Constant", "#DEB887")
:call GuiFor("Special", "#A3B86C")
:call GuiFor("Identifier", "#a3b86c")
:call GuiFor("Conditional", "#8ec07c")
:call GuiFor("Statement", "#8ec07c")
:call GuiFor("PreProc", "#a3b86c")
:call GuiFor("type", "#98c379")
:call GuiWBGFor("TODO", "#880000", "#deb887")

:call GuiFor("String", "#1496bb")
:call GuiFor("Constant", "#ff0000") "number
:call GuiFor("ctypedef", "#00ff00")

hi Special gui=none
hi Constant gui=none
hi Identifier gui=none
hi Statement gui=none
hi type gui=none
"Normal MODE COLORS
"hi Normal guifg=#4b7248 
"hi Normal guibg=#2d2d2d
"Terminal MODE COLORS
hi Normal ctermfg=darkgreen
hi Normal ctermbg=black

"hi ErrorMsg		guifg=#ffffff guibg=#287eff						ctermfg=white ctermbg=lightblue
"hi Visual		guifg=#8080ff guibg=fg		gui=reverse				ctermfg=lightblue ctermbg=fg cterm=reverse
"hi VisualNOS	guifg=#8080ff guibg=fg		gui=reverse,underline	ctermfg=lightblue ctermbg=fg cterm=reverse,underline
"hi Todo			guifg=#d14a14 guibg=#1248d1						ctermfg=red	ctermbg=darkblue
hi Search		guifg=#90fff0 guibg=#2050d0						ctermfg=white ctermbg=darkblue cterm=underline term=underline
hi IncSearch	guifg=#b0ffff guibg=#2050d0							ctermfg=darkblue ctermbg=gray

"hi SpecialKey		guifg=cyan			ctermfg=darkcyan
"hi Directory		guifg=cyan			ctermfg=cyan
"hi Title			guifg=magenta gui=none ctermfg=magenta cterm=bold
"hi WarningMsg		guifg=red			ctermfg=red
"hi WildMenu			guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
"hi ModeMsg			guifg=#22cce2		ctermfg=lightblue
"hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
"hi Question			guifg=green gui=none ctermfg=green cterm=none
"hi NonText			guifg=#0030ff		ctermfg=darkblue

"hi StatusLine	guifg=blue guibg=darkgray gui=none		ctermfg=blue ctermbg=gray term=none cterm=none
"hi StatusLineNC	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none
"hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none

"hi Folded	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
"hi FoldColumn	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
"hi LineNr	guifg=#90f020			ctermfg=green cterm=none

"hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
"hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
"hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
"hi ctermbg=red gui=bold guibg=Red

"autocmd InsertEnter * highlight  Cursor guifg=black guibg=yellow	ctermfg=black ctermbg=yellow
"autocmd InsertLeave * highlight  Cursor guifg=yellow guibg=black	ctermfg=yellow ctermbg=black
"hi Comment	guifg=#80a0ff ctermfg=darkred
"hi Constant	ctermfg=magenta guifg=#ffa0a0 cterm=none
"hi Special	ctermfg=brown guifg=Orange cterm=none gui=none
"hi Identifier	ctermfg=cyan guifg=#40ffff cterm=none
"hi Statement	ctermfg=yellow cterm=none guifg=#ffff60 gui=none
"hi PreProc	ctermfg=magenta guifg=#ff80ff gui=none cterm=none
"hi type		ctermfg=green guifg=#60ff60 gui=none cterm=none
"hi Underlined	cterm=underline term=underline
"hi Ignore	guifg=bg ctermfg=bg


