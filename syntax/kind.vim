if exists("b:current_syntax")
    finish
endif

syntax keyword kindKeyword let def type
highlight link kindKeyword Keyword

syntax keyword kindStatement do case as
highlight link kindStatement Statement

syntax match kindType "\<[A-Z][a-zA-Z0-9_']*\>"
highlight link kindType Type

syntax keyword kindBooleanTrue    true
syntax keyword kindBooleanFalse   false

highlight link kindBooleanTrue Boolean
highlight link kindBooleanFalse Boolean

syntax match   kindOperator "[-!|&+<>=%/*~^:]"
highlight link kindOperator Operator

syntax keyword kindRefl refl
highlight link kindRefl Macro

syntax region kindString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
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
