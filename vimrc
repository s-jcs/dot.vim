""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   Vim Setting
""
" シンタックスハイライト有効化
" 背景黒向け
syntax on

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd BufWritePre * :%s/\s\+$//e

highlight cursorline term=reverse cterm=reverse

set hlsearch " 検索キーワードのハイライト
set nocompatible
set ignorecase " 検索時に大文字小文字を区別しない
set lazyredraw
set ttyfast
set undofile " Maintain undo history between vim sessions
set undodir=~/.vim/undodir

" 文字コード関連設定
source ~/.vim/config/character.vim

source ~/.vim/config/statusline.vim

source ~/.vim/config/keymap.vim

set backupdir=$HOME/.vim/backup "バックアップファイルを作るディレクトリ
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

""""""""""""""""""
" 行番号
set number

"クリップボードを連携
set clipboard=unnamed

set noswapfile
" set directory=$HOME/.vim/swaps " スワップファイル用のディレクトリ

set expandtab "タブの代わりに空白文字を挿入する
set hidden "変更中のファイルでも、保存しないで他のファイルを表示
set incsearch "インクリメンタルサーチを行う

"listで表示される文字のフォーマットを指定する
set nolist
" タブ文字、行末など不可視文字を表示する
set listchars=tab:»-,extends:»,precedes:«,nbsp:%,trail:-,eol:↲

set showmatch "閉じ括弧が入力されたとき、対応する括弧を表示する
set smartcase "検索時に大文字を含んでいたら大/小を区別

set autoindent "新しい行のインデントを現在行と同じにする
set smartindent "新しい行を作ったときに高度な自動インデントを行う
set shiftwidth=2 "シフト移動幅
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set tabstop=2 "ファイル内の <Tab> が対応する空白の数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set nocompatible   " Disable vi-compatibility
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"検索をファイルの先頭へループしない
"set nowrapscan

set mouse=a " マウス機能有効化
" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
" au BufEnter * execute ":lcd " . expand("%:p:h")

" 文字のないところにもカーソルを移動できる
" all   : all mode (normal, insert, ...)
" block : only visual mode
set virtualedit=all

" 検索結果ハイライトを ESCキーの連打でリセットする
:nnoremap <ESC><ESC> :nohlsearch<CR>

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

set nofoldenable
set colorcolumn=80

" set ctags
set tags=./tags,tags;

 """python"""
inoremap pdb<Space> import pdb;pdb.set_trace()

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

:colorscheme default

