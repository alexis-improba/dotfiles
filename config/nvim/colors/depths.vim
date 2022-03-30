" Depths syntax file
" Author: Alexis Moins
" Creation: 15 dec 2021
" Last Change: 20 dec 2021

" {{{ Initialization 

set background=dark

highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "test"

" }}}

" {{{ Highlighting Groups 

hi Normal           ctermfg=7           ctermbg=0
hi EndOfBuffer      ctermfg=0           ctermbg=0               cterm=none
hi FoldColumn       ctermfg=6           ctermbg=0               cterm=none          
hi LineNr           ctermfg=8           ctermbg=0
hi CursorLine                           ctermbg=15              cterm=none

hi StatusLine       ctermfg=6           ctermbg=0               cterm=none
hi StatusLineNC     ctermfg=0           ctermbg=0               cterm=none
hi StatusLineNC     ctermfg=0           ctermbg=0               cterm=none
hi StatusLineTerm   ctermfg=6           ctermbg=0               cterm=none

hi User1                                ctermbg=6
hi User2            ctermfg=8           ctermbg=0
hi User3            ctermfg=1           ctermbg=0
hi User4            ctermfg=0           ctermbg=0
hi User5            ctermfg=5           ctermbg=0
hi ModeMsg          ctermfg=2

hi DiffText         ctermfg=5           ctermbg=none
hi DiffChange       ctermfg=4           ctermbg=none
hi DiffDelete       ctermfg=1           ctermbg=none

hi SpellBad         ctermfg=1           ctermbg=none            cterm=underline
hi SpellCap         ctermfg=6           ctermbg=none            cterm=underline

hi TabLine          ctermfg=8           ctermbg=0               cterm=none
hi TabLineSel       ctermfg=7
hi MatchParen       ctermfg=7           ctermbg=none            cterm=underline

hi Pmenu            ctermfg=7           ctermbg=15
hi PmenuSel         ctermfg=0           ctermbg=5
hi PmenuSbar        ctermbg=15


hi! link VertSplit      EndOfBuffer
hi! link TabLineFill    EndOfBuffer
hi! link SignColumn     EndOfBuffer

hi! link Folded         LineNr
hi! link DiffAdd        ModeMsg
hi! link WildMenu       Normal

hi! link CursorLineNr   CursorLine
hi! link Visual         CursorLine

" }}}

" {{{ Syntax Groups

hi Red          ctermfg=1
hi Green        ctermfg=2
hi Orange       ctermfg=3
hi Blue         ctermfg=4
hi Purple       ctermfg=5
hi Cyan         ctermfg=6
hi White        ctermfg=7
hi Grey         ctermfg=8
hi Pink	        ctermfg=9
hi Yellow       ctermfg=11
hi LightBlue    ctermfg=12
hi Visual       ctermfg=15

hi! link Identifier		Green
hi! link StorageClass	Orange
hi! link Type			Green
hi! link Constant		Orange
hi! link Character		Purple
hi! link Exception		Red
hi! link PreProc		Red
hi! link Label			Green
hi! link Operator		Red
hi! link Special		Red
hi! link Statement		Purple
hi! link Structure		LightBlue

" hi Conditional      ctermfg=4
hi! link Type			Purple
hi! link Delimiter		White
hi! link Boolean		Orange
hi! link Identifier     LightBlue
hi! link Comment		Grey
hi! link Keyword        Pink
hi! link Number         Orange
hi! link String			LightBlue
hi! link Function		Green
hi! link Constant		Orange
hi! link Conditional    Orange
hi! link Repeat         Orange

hi! link Special    Function

" }}}

" {{{ Tree-sitter

hi! link TSFuncMacro			Purple
hi! link TSKeywordFunction		Purple

hi! link TSKeywordOperator      Orange

hi! link TSParameter		White
hi! link TSConstructor		Function

hi! link TSField            White

" }}}

" {{{ Language Specific Highlighting 

" vim
hi! link vimOption          Delimiter
hi! link vimHiGroup         Delimiter
hi! link vimCommentTitle    Delimiter
hi! link vimEnvVar          Function
hi! link vimHiKeyList       Statement
hi! link vimHiCtermFgBg     Constant
hi! link vimHiCTerm         Constant
hi! link vimHiAttrib        Number

" netrw
hi! link netrwSymLink       Number
hi! link netrwLink          Comment
hi! link netrwClassify      Delimiter
hi! link netrwTreeBar       Delimiter

" coc
hi! link CocInfoSign        Type
hi! link CocHintSign        String
hi! link CocWarningSign     Constant
hi! link CocErrorSign       Statement

" gitcommit
hi! link gitcommitBlank         Delimiter
hi! link gitcommitSummary       Delimiter
hi! link gitcommitFirstLine     Statement
hi! link gitcommitHeader        Delimiter
hi! link gitcommitFile          Comment
hi! link gitcommitType          Comment

" zsh
hi! link zshOption      Number
hi! link zshQuoted      Number
hi! link zshTypes       Function
hi! link zshCommands    Function
hi! link zshSubst       Delimiter

" haskell
hi! link haskellType                Type
hi! link haskellBrackets            Delimiter
hi! link haskellIdentifier          Constant
hi! link haskellDecl                Statement
hi! link haskellWhere               Statement
hi! link haskellDeriving            Statement
hi! link haskellDeclKeyword         Statement
hi! link haskellForeignKeywords     Statement

" }}}