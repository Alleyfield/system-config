syntax on
set ruler               " Show the line and column numbers of the cursor.
set textwidth=0         " Hard-wrap long lines as you type them.
set linespace=0         " Set line-spacing to minimum.
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set encoding=utf-8              " Set default encoding to UTF-8
" Show all kinds of info in the statusline
set laststatus=2
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
" Shared clipboard
set clipboard=unnamed
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1
let xml_syntax_folding=1
" SMART INDENTATION FOR JAVASCRIPT
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set wildignore+=*/node_modules/* "Dont search with command-p

" SPACE AS LEADER
" Don't use it in insert mode ... otherwise tabs suck
"let mapleader = "\<Space>"
map <Space> <leader>

" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_curso"
"":nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

let g:NERDTreeWinPos = "right"
" " Open nerdtree when vim is opened without defining a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" use the + and - minus key incrase
" " and decrease window
 if bufwinnr(1)
     map + <C-W>+
     map - <C-W>-
 endif

" Replace word under cursor with register 0
map <Leader>p cw<C-r>0<ESC>
" Jump between windows by space + movement
map <Leader>j :wincmd j <CR>
map <Leader>k :wincmd k <CR>
map <Leader>h :wincmd h <CR>
map <Leader>l :wincmd l <CR>
map <Leader>w :w <CR>
map <Leader>q :q <CR>
" faster navigation with ctrl
map <c-k> 4k
map <c-j> 4j
" Leader t to open ctrl p file search
map <Leader>t :CtrlP <CR>
" Leader r to resize all windows to equal dimensions
map <Leader>r <c-w>=
" Use space + n to choose a specific tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Use space + n to open nerdtree
map <Leader>n :NERDTreeToggle<CR>
" Use tab to open nerdtree folders instead of enter or o
let NERDTreeMapActivateNode='<Tab>'
" Display bookmarks when started
let NERDTreeShowBookmarks=1

" Highlight the character that is on 81
":2mat ErrorMsg '\%81v.'

let g:python_host_prog="/usr/local/bin/python2.7"
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" Pressing , twice adds a semicolon at the end of line
inoremap ,, <esc>A;
nnoremap ,, A;

" Pressing " or '' twice adds quotation marks around word
nnoremap "" ciw"<C-r>""<esc>
nnoremap '' ciw'<C-r>"'<esc>


" Pressing d + ""  uncomments a word 
nnoremap d" ciw<esc>la<Space><esc>pBi<BS><BS><BS><esc>E

" Map character below to open current buffer in a new tab
" as the character is mapped into ctrl + i in iterm
nmap <Leader>i :tabnew %<CR>
nmap ȩ :tabnew %<CR>
map! ȩ <Esc>:tab %<CR>
map! <Leader>i <Esc>:tab %<CR>

" use ag instead of ack on searches
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrl.p results can be browsed with alt-j/k
" mapped in iTerm
map Đ <Down>
map ű <Up>

" When editing Javascript - typing in curly brace and hitting enter
" adds a new line and puts cursor into new line
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
" Always load HTML snippets
autocmd FileType typescript.tsx UltiSnipsAddFiletypes html
autocmd FileType typescript.tsx UltiSnipsAddFiletypes javascript_react


" Plugins here
call plug#begin('~/.config/nvim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" React code snippets
Plug 'cristianoliveira/vim-react-html-snippets'
" Plug 'Shougo/deoplete.nvim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
" auto prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'wookiehangover/jshint.vim'
Plug 'kien/ctrlp.vim'
" tsx highlight
Plug 'tasn/vim-tsx' 

" Distraction distraction free writing mode - enabled with :Goyo
Plug 'junegunn/goyo.vim'
" Double tap space to hide all
map <Leader><Space> :Goyo<CR>
nnoremap <Leader><Space> :Goyo<CR>

Plug 'ludovicchabant/vim-gutentags'
" Open tags in a new split
map <silent><Leader>e <C-w><C-]>

" automatically add pairs
Plug 'jiangmiao/auto-pairs'


" Elixir, Erlang and Phoenix support
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'slashmili/alchemist.vim'

call plug#end()

" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="Ô"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif

" Multicursor
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-e>'
""let g:multi_cursor_quit_key='<Esc>'
"let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Other
set mouse=
set list
