# kiwi-vim-syntax

VIM syntax highlighting for [Kiwi templates](https://github.com/coolony/kiwi).

## Install

*  Copy `syntax/kiwi.vim` to `$HOME/.vim/syntax`
*  Add the following to your `.vimrc`:

```
autocmd BufRead,BufNewFile *.kiwi set filetype=html syntax=kiwi
```

## Thanks

dz for making [jquerytmpl.vim](https://github.com/dz/jQuery-Template-Vim-Syntax), on
which this file was based.
