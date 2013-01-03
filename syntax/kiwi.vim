" Vim syntax file
" Language:     Kiwi Templates
" Maintainer:   Robert Klep <robert@klep.name>
" URL:          https://github.com/robertklep/kiwi-vim-syntax
" Last Change:  Jan 2013

if exists("b:current_syntax")
  finish
endif

" keywords
"syn keyword KiwiComments      comment #       containedin=KiwiCommandRegion 
syn keyword KiwiRepeats       each            containedin=KiwiCommandRegion
syn keyword KiwiConditionals  if else ifblock containedin=KiwiCommandRegion
syn keyword KiwiCommands      as tmpl include block extend raw filter containedin=KiwiCommandRegion 

" {{ }} region
syn region KiwiCommandRegion start=+{{+ keepend end=+}}+ contains=KiwiCommands 

" ${var} variable
syn match KiwiVariable '\${[^}]*}' containedin=javaScriptStringS,javaScriptStringD,htmlString
syn match KiwiVariableShortcut '{{=[^}]*}}' containedin=javaScriptStringS,javaScriptStringD,htmlString

syn cluster KiwiAll contains=KiwiVariable,KiwiVariableShortcut

" comments
syn region  KiwiCommentedOut matchgroup=KiwiCommands start=+{{comment}}+ end=+{{/comment}}+

" include html syntax
runtime! syntax/html.vim
unlet b:current_syntax
let b:current_syntax = "kiwitmpl"

" hilighting
command! -nargs=+ KiwiHiLink hi def link <args>

KiwiHiLink  KiwiCommentedOut      Comment
KiwiHiLink  KiwiVariable          Identifier
KiwiHiLink  KiwiVariableShortcut  Identifier
KiwiHiLink  KiwiCommands          Special
KiwiHiLink  KiwiCommandRegion     Structure
KiwiHiLink  KiwiConditionals      Conditional
KiwiHiLink  KiwiRepeats           Repeat

delcommand KiwiHiLink
