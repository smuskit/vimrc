"dein"
"
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.config/nvim/dein')

  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/.config/nvim/dein')

 " プラグインリストを収めた TOML ファイル
 " 予め TOML ファイル（後述）を用意しておく
 let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
 let s:toml      = s:toml_dir . '/dein.toml'
 let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

 " TOML を読み込み、キャッシュしておく
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDtree

"コントロール+e でツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nnoremap <silent><C-l> :tabn<CR>
nnoremap <silent><C-h> :tabp<CR>
nnoremap <silent><C-o> :tabnew<CR>

" デフォルトで隠しファイルを表示
let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" indentLine

let g:indentLine_char = '¦'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" ALE

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"augroup PHP
"  autocmd!
"  autocmd FileType php set makeprg=php\ -l\ %
"  " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
"  autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
"augroup END
"
"" なくてもいいけどあった方がより便利
"syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 基本設定
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

set clipboard+=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 見た目系
" 行番号を表示
set number

" 現在の行を強調表示
set cursorline
highlight cursorline term=reverse cterm=none ctermbg=237
""highlight cursorline cterm=bold ctermfg=white ctermbg=black

" 現在の列を強調表示（縦）
set cursorcolumn
highlight cursorcolumn term=reverse cterm=none ctermbg=240

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell"
" ビープ音を消す
set belloff=all
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完 
set wildmode=list:longest 
"折り返し時に表示行単位での移動できるようにする 

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" シンタックスハイライトの有効化 
syntax enable 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Tab系 

" 不可視文字を可視化(タブが「▸-」と表示される) 
set list listchars=tab:\▸\- 

"タブ入力を複数の空白入力に置き換える
set expandtab
"画面上でタブ文字が占める幅
set tabstop=2 
"自動インデントでずれる幅
set shiftwidth=2
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2 
"改行時に前の行のインデントを継続する
set autoindent 
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" マイカスタマイズコマンド

" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"括弧とインデントの補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<left><CR><ESC><S-o>
inoremap " ""<left>
inoremap ' ''<left>
inoremap <% <%%><Left><Left>
inoremap <?php <?php?><left><left>
inoremap <?= <?=?><left><left>


" jjで挿入モードから抜け出す
inoremap <silent> jj <ESC>:w<CR>
inoremap <silent> っj <ESC>:w<CR>

nnoremap <ESC><ESC> :nohl<CR>

" 移動
nnoremap <C-j> 5j
nnoremap <C-k> 5k

vnoremap <C-j> 5j
vnoremap <C-k> 5k

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap ; :
nnoremap : ;

let g:deoplete#enable_at_startup = 1

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste
