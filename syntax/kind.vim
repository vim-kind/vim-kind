" Vim syntax file
" Language: Kind 

" This is a fork from https://github.com/mynomoto/vim-kind

" Usage Instructions
" Put this file in .vim/syntax/kind.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.kind set filetype=kind

if exists("b:current_syntax")
    finish
endif

syntax keyword kindKeyword let def type 
highlight link kindKeyword Keyword

syntax keyword kindStatement do case as
highlight link kindStatement Statement

syntax keyword kindSpecial nil cons zero succ pred apply comm
highlight default link kindSpecial Boolean

syntax match kindType "\<[A-Z][a-zA-Z0-9_]*\>\(\.\)\@!"
syntax keyword kindType _
highlight link kindType Type

syntax keyword kindBooleanTrue    true
syntax keyword kindBooleanFalse   false

highlight link kindBooleanTrue Boolean
highlight link kindBooleanFalse Boolean

syntax match   kindOperator "[-!|&+<>=%/*~^:]"
highlight link kindOperator Operator

syntax region kindFunction matchgroup=Function start="\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *(" matchgroup=Function end=")" transparent
syntax region kindFunction matchgroup=Function start="\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *<" matchgroup=Function end=")" transparent
highlight link kindFunction Function

syntax keyword kindRefl refl
syntax keyword kindMirror mirror
highlight link kindRefl Macro
highlight link kindMirror Macro

syntax region kindString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syntax region kindString start=+'+ end=+'+
" to fix
"syntax region KindString start=+?+ end=/$/ contains=@Spell extend keepend
highlight link kindString String

syn match kindNumber "\<[0-9]\+[bsul]\?\>"
highlight link kindNumber Number

syn keyword kindConditional if then else
highlight link kindConditional Conditional

syn keyword kindTactic rewrite in with
highlight link kindTactic Macro

syntax keyword kindCommentTodo    contained TODO FIXME XXX TBD NOTE
syntax region  kindComment        start=+//+ end=/$/ contains=kindCommentTodo,@Spell extend keepend
highlight link kindComment Comment

let b:current_syntax = "kind"
