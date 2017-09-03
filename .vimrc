if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    " Required:
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
    call neobundle#end()
endif
" Required:
call neobundle#begin(expand('~/dotfiles/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'szw/vim-tags'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'elixir-lang/vim-elixir'
call neobundle#end()
" 拡張子によって設定を変える場合
filetype plugin indent on

NeoBundleCheck

" ******************
" Customize
" ******************
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set backspace=indent,eol,start " insertモード時にbackspaceを有効にする
set laststatus=2 " ステータスラインを下部に表示
set title " 下部バーにタイトルを表示
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set number " 行番号
set ruler " 下部バーにカーソル位置を表示
set list " 不可視文字を表示
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:¬ " 不可視文字の表示をカスタマイズ
set incsearch " 検索文字を入れる度に検索
set hlsearch " 検索結果のハイライト
set nobackup " バックアップを取らない
set nowrap " 行末を折り返さない
set wrapscan " 検索時に行末から行頭へループ
set showmatch " 括弧の対応関係を表示
set whichwrap=h,l,<,> " 行頭行末で次の行に移動
set ignorecase " 検索時の英大文字小文字の区別を無視
set smartcase " 検索時に全て英小文字で入力した場合のみ区別を無視
set history=2000 " コマンドラインの履歴保存回数
set expandtab " tabをspaceに変換
set tabstop=2 " tabの文字幅
set shiftwidth=2 " 自動で挿入されるインデントのスペース幅
set noswapfile " swpファイルを作成しない
set backup " バックアップファイルを作成
set backupdir=/tmp " バックアップファイルのパス
set scrolloff=5 " スクロール時に余裕を持たせる
set cursorline " 現在の行をハイライト
set wildmenu wildmode=list:full
hi clear CursorLine " 行番号のみハイライト

autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末の空白を削除

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" unite.vimの設定
noremap <C-u><C-f> :Unite -buffer-name=file file<CR> " ファイル一覧
noremap <C-u><C-r> :Unite file_mru<CR> " 最近使ったファイル一覧

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') " ウィンドウを分割して開く
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
autocmd BufRead,BufNewFile *.py setfiletype python
