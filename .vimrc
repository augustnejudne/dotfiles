                                " __ 
  " ____ ___  ______ ___  _______/ /_
 " / __ `/ / / / __ `/ / / / ___/ __/
" / /_/ / /_/ / /_/ / /_/ (__  ) /_  
" \__,_/\__,_/\__, /\__,_/____/\__/  
  "          /____/                  
  "                _           __         
  "  ____  ___    (_)_  ______/ /___  ___ 
  " / __ \/ _ \  / / / / / __  / __ \/ _ \
 " / / / /  __/ / / /_/ / /_/ / / / /  __/
" /_/ /_/\___/_/ /\__,_/\__,_/_/ /_/\___/ 
  "         /___/                         
  "       _                    
 " _   __(_)___ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__  
" |___/_/_/ /_/ /_/_/   \___/  
                             
"" ===========================================
"" Vim Plug Core
"" ===========================================
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Vim Vinegar
Plug 'tpope/vim-vinegar'

"" Nerdtree
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" Syntax plugins
Plug 'gorodinskiy/vim-coloresque'
Plug 'hail2u/vim-css3-syntax'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'

"" Monokai Colorscheme
Plug 'phanviet/vim-monokai-pro'

"" Gruvbox Colorscheme
Plug 'morhetz/gruvbox'

"" Emmet
Plug 'mattn/emmet-vim'

"" Ripgrep
Plug 'jremmen/vim-ripgrep'

"" Fuzzyfind
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Utilities
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'vim-scripts/restore_view.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'ervandew/supertab'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/goyo.vim'

"" Hardtime
Plug 'takac/vim-hardtime'

call plug#end()

"" use restore view
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']


"" ===========================================
"" Basic Setup
"" ===========================================
set nocompatible
filetype plugin indent on

"" Autocomplete
set omnifunc=syntaxcomplete#Complete

"" Disable commenting on new line
set formatoptions-=cro<cr>

"" Hide unsaved buffers
set hidden

"" Allow yank/paste from system clipboard
set clipboard=unnamed

"" Visual
syntax on
set termguicolors
" colorscheme onedark
colorscheme gruvbox
set bg=dark
set cursorline
set number
set relativenumber
set ruler

"" Visual options for gvim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Ubuntu\ Mono\ Regular\ 14
" set linespace=10

"" Tabs
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

"" GitGutter always show the sign column
set signcolumn=yes

"" Folds
set foldmethod=manual

"" Wraps
set nowrap
set formatoptions-=t

"" No swap files
set noswapfile

"" Airline
" let g:airline_theme = 'onedark'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

"" Ale
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_fixers = {'javascript': ['standard']}
" let g:ale_linters = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Hard time setup
let g:hardtime_default_on = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_maxcount = 2
let g:hardtime_timeout = 2000



"" ===========================================
"" Mappings
"" ===========================================
let mapleader=','

"" SuperTab for omnifunc
" let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionType = "<c-n>"

nnoremap <leader><space> :nohl<cr>

"" Bring up UltiSnipsEdit
nnoremap <leader>ue :UltiSnipsEdit<cr>

"" Splits
nnoremap <leader>h :split<cr>
nnoremap <leader>v :vsplit<cr>

"" Switching windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-q> <c-w>q

"" Move visual block
nnoremap j gj
nnoremap k gk

"" Move line up/down
nnoremap - :m .+1<cr>==
nnoremap _ :m .-2<cr>==

nnoremap <c-y> 5<c-y>
nnoremap <c-e> 5<c-e>

"" Open vimrc in new split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>:echo '.vimrc sourced'<cr>

"" Buffer navigation
nnoremap <leader>q :bp<cr>
nnoremap <leader>w :bn<cr>
nnoremap <leader>c :bp<cr>:bd #<cr>
" nnoremap <leader>c :bd<cr>

"" ALEFix
nnoremap <leader>pp :ALEFix<cr>

"" FZF
nnoremap <silent><c-p> :FZF<cr>

"" Git
noremap <leader>ga :Gwrite<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gsh :Gpush<cr>
noremap <leader>gll :Gpull<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gd :Gvdiff<cr>
noremap <leader>gr :Gremove<cr>

"" Set working directory
nnoremap <leader>.. :lcd %:p:h<cr>

"" Insert current time
nnoremap <F5> "=strftime("%r")<cr>P
inoremap <F5> <C-R>=strftime("%r")<cr>
nnoremap <F4> "=strftime("%c")<cr>P
inoremap <F4> <C-R>=strftime("%c")<cr>

"" Open explorer
" nnoremap <F3> :Explore<cr>
" inoremap <F3> :Explore<cr>

"" folding
nnoremap <leader>ff zf
nnoremap <leader>df zd
vnoremap <leader>ff zf
vnoremap <leader>rf zd
nnoremap <space> za

" :autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" :autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)


"" turn off the highlighting of color words like white, black, red
nnoremap <leader>t :set t_Co=0<cr>


"" ===========================================
"" FZF
"" ===========================================
"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>e :FZF -m<cr>
"Recovery commands from history through FZF
nmap <leader>y :History:<cr>


"" ===========================================
"" NERDTree
"" ===========================================
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<cr>
nnoremap <silent> <F3> :NERDTreeToggle<cr>


"" ===========================================
"" Airline
"" ===========================================
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
