set nocompatible
set backupcopy=no
let mapleader = ","

" filetype off
filetype on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" SEARCH
" Plugin 'mileszs/ack.vim'
" map <leader>a :Ack!<space>
" map <leader>A :Ack! <C-R><C-W><CR>

Plugin 'jremmen/vim-ripgrep'
map <leader>r :Rg<space>
" map <leader>R :Ack! <C-R><C-W><CR>

" OPEN
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|node_modules|dist|^log$'
let g:ctrlp_working_path_mode = 0

" REPEAT
Plugin 'tpope/vim-repeat'

" SYNTAX
"Plugin 'vim-syntastic/syntastic'
"let g:syntastic_enable_signs=1
"let g:syntastic_quiet_messages = { 'level': 'warnings' }

"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': [],
"                           \ 'passive_filetypes': ['ruby', 'javascript'] }

"let g:syntastic_javascript_checkers = ['jshint']

" syntax asynchrounous lint style
Plugin 'w0rp/ale'
" let g:ale_emit_conflict_warnings = 0
let g:ale_linter_aliases = {
\   'svelte': ['css', 'javascript']
\ }
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'svelte': ['stylelint', 'eslint']
\ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'svelte': ['prettier', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" TAB OR INDENT
Plugin 'ervandew/supertab'
Plugin 'aaronjensen/matchindent.vim'

" TODO, yes
Plugin 'aserebryakov/vim-todo-lists'
let g:VimTodoListsDatesEnabled = 1
let g:VimTodoListsMoveItems = 0

" Markdown zen mode?
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" SYNTAX STUFF
Plugin 'sheerun/vim-polyglot'

Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'ap/vim-css-color'
Plugin 'elixir-lang/vim-elixir'
Plugin 'evanleck/vim-svelte'
Plugin 'Shougo/context_filetype.vim'
Plugin 'prettier/vim-prettier'

" because brew don't do latest version of vim
let g:go_version_warning = 0

" Svelte
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.svelte =
            \ [
            \    {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
            \    {'filetype' : 'css', 'start' : '<style>', 'end' : '</style>'},
            \ ]
au! BufNewFile,BufRead *.svelte set ft=html


" Prettier config, to do on autosave on these formats. Install prettier by doing `yarn global add prettier`
" let g:prettier#config#semi = 'false'
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json PrettierAsync ",*.graphql,*.md,*.vue


" Music stuff :)
" Plugin 'dermusikman/sonicpi.vim'
" let g:sonicpi_enabled = 0

" THEME
Plugin 'mrtazz/molokai.vim'
" Plugin 'altercation/vim-colors-solarized'
" set background=dark
" colorscheme solarized

set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/backup
set directory=~/.vim/backup

syntax enable
set nohidden
set history=10000
set number
set ruler
set switchbuf=useopen
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=longest,list
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled
set wildignore+=tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache
set wildignore+=bundler_stubs,build,error_pages,bundle,build,error_pages,node_modules

" Status bar
set laststatus=2

set t_Co=256
color molokai

" Show (partial) command in the status line
set showcmd

set noerrorbells
set visualbell
set t_vb=

" Use modeline overrides
set modeline
set modelines=10

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Per filetype config
autocmd FileType markdown setlocal spell spelllang=en_us
" textwidth=79 colorcolumn=80
autocmd Filetype gitcommit setlocal spell textwidth=50 colorcolumn=51

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Remove trailing whitespace automagically
autocmd BufWritePre *.rb,*.coffee :%s/\s\+$//e

" Inserts the path of the currently edited file into a command
" Command mode: %%
cmap %% <C-R>=expand("%:p:h") . "/" <CR>

" Show 2 lines of context
set scrolloff=2

" Copy paste system clipboard
map <leader>y "*y
map <leader>p "*p
map <leader>P "*P

" Persist undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" Same pane switching commands as VIM, but in Tmux
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" resize current buffer by +/- 5
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>

" Linebreak on 500 characters
set lbr
set tw=1000
