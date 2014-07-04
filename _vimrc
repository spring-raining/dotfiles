set nocompatible

"
"   neobundle
"   http://momota.github.io/blog/2013/08/29/vim-plugins/
"
set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
		\ 'windows' : 'make -f make_mingw32.mak',
		\ 'cygwin' : 'make -f make_cygwin.mak',
		\ 'mac' : 'make -f make_mac.mak',
		\ 'unix' : 'make -f make_unix.mak',
	\ },
\ }

NeoBundleCheck

"
" プラグイン
"
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ }

NeoBundle 'kchmck/vim-coffee-script'
syntax enable
filetype plugin indent on
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

"
" 画面表示の設定
"
syntax on          " シンタックスを表示する
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
" 括弧の対応表示時間
set showmatch matchtime=0
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:\|\ ,trail:-,extends:❯,precedes:❮
" カラースキーマ設定
colorscheme molokai
if &term =~ "xterm-256color" || "screen-256color"
	set t_Co=256
	set t_Sf=[3%dm
	set t_Sb=[4%dm
elseif &term =~ "xterm-color"
	set t_Co=8
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" マウスを有効にする
if has('mouse')
	set mouse=a
endif
" プラグインを使用可能にする
filetype on
filetype plugin on
filetype indent on
" 自動的にインデントする
set autoindent
" タイトルを表示
set title
" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" 右下に表示される行・列の番号を表示する
set ruler
" タブ幅設定
set tabstop=4
set shiftwidth=4
" カーソルライン表示
set cursorline
" クリップボード共有
set clipboard=unnamed,autoselect
