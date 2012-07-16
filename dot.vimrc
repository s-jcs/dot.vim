""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   Vim Setting
""

" シンタックスハイライト有効化
" (背景黒向け。白はコメントアウトされている設定を使用)
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none
set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化
set ignorecase " 検索時に大文字小文字を区別しない

:source ~/.vim/config/statusline.vim

:source ~/.vim/config/keymap.vim

set backupdir=$HOME/.vim/backup "バックアップファイルを作るディレクトリ
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer

""""""""""""""""""
" 行番号
set number

" 行番号表示切り替え(相対表示) - ver7.3 以降から対応
if version >= 703
  noremap  gl :<C-u>ToggleNumber<CR>
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
    else
      set number
    endif
  endfunction
endif

"クリップボードをWindowsと連携
"set clipboard=unnamed

set nocompatible "Vi互換をオフ
"スワップファイル用のディレクトリ
filetype off
set directory=$HOME/.vim/swaps

set expandtab "タブの代わりに空白文字を挿入する
set hidden "変更中のファイルでも、保存しないで他のファイルを表示
set incsearch "インクリメンタルサーチを行う

"listで表示される文字のフォーマットを指定する
set list
set listchars=eol:$,tab:>\ ,extends:< "タブ文字、行末など不可視文字を表示する

set showmatch "閉じ括弧が入力されたとき、対応する括弧を表示する
set smartcase "検索時に大文字を含んでいたら大/小を区別

set autoindent "新しい行のインデントを現在行と同じにする
set smartindent "新しい行を作ったときに高度な自動インデントを行う
set shiftwidth=2 "シフト移動幅
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set tabstop=2 "ファイル内の <Tab> が対応する空白の数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする

"検索をファイルの先頭へループしない
"set nowrapscan

set mouse=a " マウス機能有効化
" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
au BufEnter * execute ":lcd " . expand("%:p:h")

" 保存時に行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/ /ge

" 余計なVimエディタが起動しないようにする
runtime macros/editexisting.vim

" 文字のないところにもカーソルを移動できる
" all   : all mode (normal, insert, ...)
" block : only visual mode
set virtualedit=all

" 検索結果ハイライトを ESCキーの連打でリセットする
:nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepコマンドで検索したら、検索結果の一覧を自動で開く
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


""""""
" for ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


colorscheme torte
if has('gui_macvim')
    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set transparency=15 " 透明度を指定
    set antialias
    set guifont=Monaco:h14
endif

" if has("gui_running")
"   set fuoptions=maxvert,maxhorz
"   au GUIEnter * set fullscreen
" endif

" gvimrc があとから読まれる
" 読まれたく無いファイルには下記の設定を記述
"let plugin_cmdex_disable = 1

" vundle
:source ~/.vim/config/bundles.vim

" 文字コード関連設定
:source ~/.vim/config/character.vim

" calendar
:source ~/.vim/config/qfixhown-config.vim

