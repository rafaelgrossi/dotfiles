set background=light
" asdasdadasd

hi clear
if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'monochrome'

hi Normal guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Cursor guifg=#d4ceb5 ctermfg=15 guibg=LightGray ctermbg=252 gui=NONE cterm=NONE term=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=LightGray ctermbg=252 gui=NONE cterm=NONE term=NONE
hi CursorLineNr guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi diffAdded guifg=#778899 ctermfg=124 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi diffRdfemoved guifg=Red ctermfg=1 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi DiffAdd guifg=#778899 ctermfg=124 guibg=LightGray ctermbg=255 gui=NONE cterm=NONE term=NONE
hi DiffChange guifg=#778899 ctermfg=20 guibg=LightGray ctermbg=255 gui=NONE cterm=NONE term=NONE
hi DiffDelete guifg=Red ctermfg=1 guibg=LightGray ctermbg=255 gui=NONE cterm=NONE term=NONE
hi DiffText guifg=Red ctermfg=1 guibg=LightGray ctermbg=255 gui=bold cterm=bold term=bold
hi FoldColumn guifg=DarkGray ctermfg=248 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Folded guifg=Black ctermfg=245 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi TabLine guifg=Black ctermfg=16 guibg=LightGray ctermbg=252 gui=NONE cterm=NONE term=NONE
hi TabLineFill guifg=LightGray ctermfg=252 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi TabLineSel guifg=#d4ceb5 ctermfg=15 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi StatusLine guifg=#d4ceb5 ctermfg=Black guibg=Black ctermbg=15 gui=NONE cterm=NONE term=NONE
hi StatusLineNC guifg=#737373 ctermfg=249 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi SignColumn guifg=Black ctermfg=16 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi VertSplit guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi ColorColumn guifg=Black ctermfg=16 guibg=LightGray ctermbg=255 gui=NONE cterm=NONE term=NONE
hi LineNr guifg=#727b5b ctermfg=238 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Statement guifg=#cd664d ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi PreProc guifg=#cd664d ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi String guifg=#cd664d ctermfg=2 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Comment guifg=#cc654c ctermfg=2 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Constant guifg=#3c3828 ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Type guifg=#3c3828 ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Function guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Identifier guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Special guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi MatchParen guifg=#d4ceb5 ctermfg=252 guibg=#353535 ctermbg=252 gui=underline cterm=underline term=underline
hi Conceal guifg=#3c3828 ctermfg=16 guibg=LightGray ctermbg=252 gui=NONE cterm=NONE term=NONE
hi rubyConstant guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubySharpBang guifg=#737373 ctermfg=249 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubyStringDelimiter guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubyStringEscape guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubyRegexpEscape guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubyRegexpAnchor guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi rubyRegexpSpecial guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi perlSharpBang guifg=#737373 ctermfg=249 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi perlStringStartEnd guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi perlStringEscape guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi perlMatchStartEnd guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi pythonEscape guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi javaScriptFunction guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi elixirDelimiter guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Search guifg=#d4ceb5 ctermfg=15 guibg=#778899 ctermbg=124 gui=NONE cterm=NONE term=NONE
hi Visual guifg=#d4ceb5 ctermfg=15 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi NonText guifg=DarkGray ctermfg=248 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi Directory guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi Title guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi markdownHeadingDelimiter guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi markdownHeadingRule guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=bold cterm=bold term=bold
hi markdownLinkText guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=underline cterm=underline term=underline
hi Todo guifg=LightGray ctermfg=252 guibg=Yellow ctermbg=226 gui=bold cterm=bold term=bold
hi Pmenu guifg=Black ctermfg=16 guibg=#778899 ctermbg=124 gui=NONE cterm=NONE term=NONE
hi PmenuSel guifg=#778899 ctermfg=124 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi helpSpecial guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi helpHyperTextJump guifg=#778899 ctermfg=124 guibg=#d4ceb5 ctermbg=15 gui=underline cterm=underline term=underline
hi helpNote guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimOption guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimGroup guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiClear guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiGroup guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiAttrib guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiGui guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiGuiFgBg guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiCTerm guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimHiCTermFgBg guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimSynType guifg=Black ctermfg=16 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE
hi vimCommentTitle guifg=#737373 ctermfg=249 guibg=#d4ceb5 ctermbg=15 gui=NONE cterm=NONE term=NONE

