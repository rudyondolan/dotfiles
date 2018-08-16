" COMMON
set encoding=utf8
scriptencoding utf-8
set clipboard=unnamed
set updatetime=250
set laststatus=2
set statusline=
set statusline+=%<%f\ %h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=%{LinterStatus()}
set statusline+=%=%-14.(%l,%c%V%)\ %P
" set showtabline=2
set history=500
set autoread
set wildmenu
set ruler
set hidden
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set nowrap
" set wrap
set matchtime=2
set scrolloff=1
set foldcolumn=1
set signcolumn=no
set t_Co=256
set t_ut=
set mouse=a
set number
set confirm
set relativenumber
" set nuw=5
" set cursorline
" set cursorcolumn
" set colorcolumn=100
" set timeoutlen=1000 ttimeoutlen=0
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set guicursor=n-v-c-i-ci-ve-r-cr-o:block
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

let g:mapleader = ','

filetype plugin on
filetype indent on

" Display extra whitespace
set list listchars=tab:¬ª¬∑,trail:¬∑

" Enter clear search
map <Space> :nohl<CR>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Enable syntax highlighting
syntax on
syntax enable

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Files, backups and undo
set nobackup
set nowritebackup
set noswapfile

" Tab and indent configuration
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

" Switching buffers
map <leader>w :bn<cr>
map <leader>q :bp<cr>
map <leader>n :enew<cr>
map <leader>x :bd<cr>

" Switching tabs
" map <leader>q :tabprevious<cr>
" map <leader>w :tabnext<cr>
" map <leader>x :tabclose<cr>
" map <leader>n :tabnew<cr>
" map <leader>h :close<cr>
" map <leader>k :bdelete<cr>

" Splitting window
map <leader>- :split<cr>
map <leader>\ :vsplit<cr>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" nmap <BS> <C-W>h " -> for Neovim
" map <C-l> <C-W>l

" Neovim way to move between windows
tnoremap jj <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Vim commentary
map <leader>c :Commentary<CR>

" Search for visually selected text strict mode
vnoremap // y/\C<C-R>"<CR>

" Bind jj to Esc
inoremap jj <Esc>

" Save file
map <leader>s :w<cr>

" Make VIM remember position in file after reopen
if has('autocmd')
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Shortcut edit init.vim
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost *.vim source %

" Undo configuration
try
  set undodir=~/.config/nvim/temp_dirs/undodir
  set undofile
catch
endtry

" Python provider
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Disable line on terminal emulator
au TermOpen * setlocal nonumber norelativenumber

" Installing Vim Plug
let g:vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(g:vimplug_exists)
  if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif
  echo 'Installing Vim-Plug...'
  echo ''
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = 'yes'
  autocmd VimEnter * PlugInstall
endif

" Load plugins
call plug#begin('~/.config/nvim/plugged')

" editor
Plug 'scrooloose/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mileszs/ack.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'flowtype/vim-flow'
Plug 'jiangmiao/auto-pairs'
Plug 'docunext/closetag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-vinegar'
Plug 'mattn/emmet-vim'
Plug 'rizzatti/dash.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-capslock'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'yggdroot/indentline'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'godlygeek/tabular'
Plug 'thaerkh/vim-workspace'
Plug 'ap/vim-buftabline'
Plug 'metakirby5/codi.vim'

" omni-completions
" Plug 'eagletmt/neco-ghc'

" colorschemes
" Plug 'chriskempson/base16-vim'
" Plug 'mhartington/oceanic-next'
Plug 'nlknguyen/papercolor-theme'
" Plug 'lifepillar/vim-solarized8'
" Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
" Plug 'trevordmiller/nova-vim'
Plug 'w0ng/vim-hybrid'
Plug 'gosukiwi/vim-atom-dark'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'

call plug#end()

" INTERFACE
if (has('termguicolors'))
  set termguicolors
endif

if !exists('g:not_finish_vimplug')
  set background=dark
  " colorscheme base16-eighties
  " colorscheme PaperColor
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext
  " let g:solarized_use16 = 1
  " let g:solarized_term_italics = 1
  " let g:solarized_old_cursor_style = 1
  " let g:solarized_extra_hi_groups = 1
  " colorscheme solarized8
  " colorscheme dracula
  " let g:molokai_original = 1
  " colorscheme molokai
  " colorscheme gruvbox
  " colorscheme nova
  let g:hybrid_custom_term_colors = 1
  " let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
  colorscheme hybrid
  " let g:enable_bold_font = 1
  " let g:enable_italic_font = 1
  " colorscheme hybrid_material
endif

" Deoplete configuration
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.config/nvim/snippets/
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Deoplete tern
" Whether to include the types of the completions in the result data. Default: 0
" let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
" let g:deoplete#sources#ternjs#depths = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
" let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
" let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
" let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
" let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
" let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least two characters. Default: 1
" let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
" let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
" let g:deoplete#sources#ternjs#in_literal = 0

" Add extra filetypes
" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue',
"                 \ ]

" Airline Configuration
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.branch = 'ÓÇ†'
" let g:airline_theme = 'hybrid'
" let g:airline_extensions = ['ctrlp', 'ale', 'keymap', 'capslock', 'branch', 'tabline']
" let g:airline_powerline_fonts = 0
" let g:airline_detect_modified = 1
" let g:airline_mode_map = {
"   \ '__' : '-',
"   \ 'n'  : 'N',
"   \ 'i'  : 'I',
"   \ 'R'  : 'R',
"   \ 'c'  : 'C',
"   \ 'v'  : 'V',
"   \ 'V'  : 'V',
"   \ '' : 'V',
"   \ 's'  : 'S',
"   \ 'S'  : 'S',
"   \ '' : 'S',
"   \ 't'  : 'T',
"   \ }

" ALE configuration
let g:ale_lint_on_text_changed = 1
let g:ale_sign_error = '‚Ä¢'
let g:ale_sign_warning = '‚Ä¢'
" let g:ale_echo_msg_error_str = 'Err'
" let g:ale_echo_msg_warning_str = 'Warn'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" base16-eighties
" highlight ALEErrorSign guifg=#ff6473 guibg=#393939
" highlight ALEWarningSign guifg=#f3cd5a guibg=#393939
" OceanicNext
" highlight ALEErrorSign guifg=#ff6473 guibg=#233640
" highlight ALEWarningSign guifg=#f3cd5a guibg=#233640
" PaperColor
" highlight ALEErrorSign guibg=#dfdfdf
" highlight ALEWarningSign guibg=#dfdfdf
" solarized-light
" highlight ALEErrorSign guibg=#eee9d4 guifg=#e5007e
" highlight ALEWarningSign guibg=#eee9d4 guifg=#c48a00
" solarized-dark
" highlight ALEErrorSign guibg=#003743 guifg=#e5007e
" highlight ALEWarningSign guibg=#003743 guifg=#c48a00
" molokai
" highlight ALEErrorSign guifg=#ff6473 guibg=#3b3b32
" highlight ALEWarningSign guifg=#f3cd5a guibg=#3b3b32
" Hybrid
highlight ALEErrorSign guifg=#ff6473 guibg=#1d1f21
highlight ALEWarningSign guifg=#f3cd5a guibg=#1d1f21

" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'jsx': ['eslint'],
  \ 'scss': ['stylelint'],
  \ 'css': ['stylelint'],
  \ 'json': ['jsonlint'],
  \ 'vim': ['vint'],
  \ }
" let g:ale_linter_aliases = {'jsx': 'css'}
" let g:ale_fixers = {
"   \ 'javascript': ['eslint'],
"   \ 'jsx': ['eslint'],
"   \ 'scss': ['stylelint'],
"   \ 'css': ['stylelint'],
"   \ 'json': ['prettier'],
"   \ }
" let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '[Ok]' : printf(
    \ '[%d Warn, %d Err]',
    \ l:all_non_errors,
    \ l:all_errors
    \ )
endfunction

" Enable completion where available.
" let g:ale_completion_enabled = 1

" TABULAR
if exists(':Tabularize')
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let l:p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# l:p || getline(line('.')+1) =~# l:p)
    let l:column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let l:position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',l:column).'\s\{-\}'.repeat('.',l:position),'ce',line('.'))
  endif
endfunction

" Fugitive configuration
autocmd QuickFixCmdPost *grep* cwindow

" Git gutter configuration
let g:gitgutter_darkide_sign_column_highlight = 0

" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_max_height=20
let g:ctrlp_custom_ignore='node_modules\|vendor\|^\.DS_Store\|^\.git\|^\.coffee'
map <C-o> :CtrlPBuffer<cr>

" NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrowExpandable='‚ñ∏'
" let g:NERDTreeDirArrowCollapsible='‚ñæ'
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMouseMode=3

" Closetag configuration
let g:closetag_html_style=1

" Comfortable motion configuration
" let g:comfortable_motion_scroll_down_key='j'
" let g:comfortable_motion_scroll_up_key='k'
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(45)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-45)<CR>

" Vim indent guide configuration
" let g:indent_guides_enable_on_vim_startup=1

" Vim indent line configuration
" let g:indentLine_enabled=1
" let g:indentLine_char='‚îÇ'
" let g:indentLine_concealcursor='inc'
" let g:indentLine_conceallevel=2
" let g:indentLine_setConceal=0

" Vim ack + silversearcher configuration
" TODO: brew install the_silver_searcher
let g:ackprg='ag --nogroup --nocolor --column'

" Flow configuration
let g:flow#enable=0

" Javascript Libraries Syntax configuration
let g:used_javascript_libs='react,flux,underscore,requirejs'

" Netrw configuration
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_localrmdir='rm -rf'
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Workspace configuration
let g:workspace_autosave=0
let g:workspace_autosave_always=0
let g:workspace_persist_undo_history=0
let g:workspace_autosave_untrailspaces=0

" Buftabline configuration
" let g:buftabline_separators=1
" let g:buftabline_indicators=1

" Italic text
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight Comment gui=italic
highlight htmlArg gui=italic

" Custom color configuration
" molokai
" highlight FoldColumn guibg=#3b3b32
" highlight SignColumn guibg=#3b3b32
" highlight Pmenu guibg=#444444 guifg=none

" hybrid
" highlight FoldColumn guibg=#1c282d
" highlight SignColumn guibg=#1c282d
highlight FoldColumn guibg=#26292c
highlight SignColumn guibg=#26292c
highlight StatusLine guibg=#6f7881 guifg=#282a2e
highlight PmenuSel guibg=#c4c8c6 guifg=#282a2e gui=bold
highlight TabLine guibg=#6f7881 guifg=#282a2e
highlight TabLineFill guibg=#282a2e guifg=#282a2e
highlight TabLineSel guibg=#c4c8c6 guifg=#1c282d
" highlight CursorLine guibg=#1a2327
" highlight CursorColumn guibg=#1a2327
" highlight ColorColumn guibg=#1a2327
highlight Search guibg=#373b41 guifg=none
highlight IncSearch guibg=#373b41 guifg=none
highlight Substitute guibg=#373b41 guifg=none

" solarized-light
" highlight SignColumn guibg=#eee9d4
" highlight CursorLine guibg=#f3eed9
" highlight CursorColumn guibg=#f3eed9
" highlight Search guibg=none guifg=none
" highlight Visual guibg=none guifg=none
" highlight GitGutterAdd guibg=#eee9d4
" highlight GitGutterChange guibg=#eee9d4
" highlight GitGutterDelete guibg=#eee9d4
" highlight GitGutterChangeDelete guibg=#eee9d4
" highlight GitGutterAddLine guibg=#eee9d4
" highlight GitGutterChangeLine guibg=#eee9d4
" highlight GitGutterDeleteLine guibg=#eee9d4
" highlight GitGutterChangeDeleteLine guibg=#eee9d4

" solarized-dark
" highlight SignColumn guibg=#003743
" highlight Search guibg=none guifg=none
" highlight Visual guibg=none guifg=none
" highlight GitGutterAdd guibg=#003743
" highlight GitGutterChange guibg=#003743
" highlight GitGutterDelete guibg=#003743
" highlight GitGutterChangeDelete guibg=#003743
" highlight GitGutterAddLine guibg=#003743
" highlight GitGutterChangeLine guibg=#003743
" highlight GitGutterDeleteLine guibg=#003743
" highlight GitGutterChangeDeleteLine guibg=#003743

" dracula
" highlight LineNr guibg=#3d3e49 guifg=gray
" highlight FoldColumn guibg=#3d3e49
" highlight SignColumn guibg=#3d3e49
" highlight Search guibg=#3d3e49 guifg=none
" git gutter
" highlight GitGutterAdd guibg=#3d3e49
" highlight GitGutterChange guibg=#3d3e49
" highlight GitGutterDelete guibg=#3d3e49
" highlight GitGutterChangeDelete guibg=#3d3e49
" highlight GitGutterAddLine guibg=#3d3e49
" highlight GitGutterChangeLine guibg=#3d3e49
" highlight GitGutterDeleteLine guibg=#3d3e49
" highlight GitGutterChangeDeleteLine guibg=#3d3e49

" base16-eighties
" highlight CursorLine guibg=#313131
" highlight CursorColumn guibg=#313131
" highlight ColorColumn guibg=#353535
" highlight Search guibg=#515151 guifg=none

" OceanicNext
" highlight LineNr guibg=#233640
" highlight FoldColumn guibg=#233640
" highlight SignColumn guibg=#233640
" highlight CursorLine guibg=#1c2f39
" highlight CursorColumn guibg=#1c2f39
" highlight ColorColumn guibg=#1c2f39
" highlight CursorLineNR guifg=#f2a659 guibg=#233640
" highlight Search guibg=#4d5b67 guifg=none
" highlight TabLine guibg=#233640 guifg=#63737f gui=italic
" highlight TabLineFill guibg=#233640 guifg=#233640
" highlight TabLineSel guibg=#233640 guifg=white gui=italic,bold
" git gutter
" highlight GitGutterAdd guibg=#233640
" highlight GitGutterChange guibg=#233640
" highlight GitGutterDelete guibg=#233640
" highlight GitGutterChangeDelete guibg=#233640
" highlight GitGutterAddLine guibg=#233640
" highlight GitGutterChangeLine guibg=#233640
" highlight GitGutterDeleteLine guibg=#233640
" highlight GitGutterChangeDeleteLine guibg=#233640

" " PaperColor
" highlight LineNr guibg=#dfdfdf
" highlight FoldColumn guibg=#dfdfdf
" highlight SignColumn guibg=#dfdfdf
" highlight CursorLineNR guibg=#dfdfdf
" highlight Search guibg=#0088b2 guifg=#ffffff
" highlight TabLine guibg=#dfdfdf guifg=#63737f gui=italic
" highlight TabLineFill guibg=#dfdfdf guifg=#dfdfdf
" highlight TabLineSel guibg=#dfdfdf guifg=white gui=italic,bold
" " git gutter
" highlight GitGutterAdd guibg=#dfdfdf
" highlight GitGutterChange guibg=#dfdfdf
" highlight GitGutterDelete guibg=#dfdfdf
" highlight GitGutterChangeDelete guibg=#dfdfdf
" highlight GitGutterAddLine guibg=#dfdfdf
" highlight GitGutterChangeLine guibg=#dfdfdf
" highlight GitGutterDeleteLine guibg=#dfdfdf
" highlight GitGutterChangeDeleteLine guibg=#dfdfdf
