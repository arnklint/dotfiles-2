" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

let mapleader = ","

set number " show line numbers
set relativenumber " show relative line numbers
set nocompatible
syntax enable
set fileencodings=utf-8
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution
set inccommand=split

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
set showmatch " Show matching brackets etc
" How many tenths of a second to blink when matching brackets
"set mat=2

" Ignore case when searching
set ignorecase

" Be smart when using tabs ;)
set smarttab
" indents
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.tsx,.ts

" JavaScript
" au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
" au BufNewFile,BufRead *.ts setf typescript
" au BufNewFile,BufRead *.tsx setf typescriptreact
" set filetypes as typescriptreact
" au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Markdown
au BufNewFile,BufRead *.md set filetype=markdown

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr  cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif
"
" Automatically show relative numbers only in the pane you are in.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"-------------------------------------------------------------------------------
" Other plugins
"-------------------------------------------------------------------------------

" vim-go
" let g:go_disable_autoinstall = 1

" vim-json
" let g:vim_json_syntax_conceal = 0

" Status line with git (fugitive)
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

" JSX
" let g:jsx_ext_required = 0

" Tern
" Disable auto preview window
set completeopt-=preview

" localvimrc
let g:localvimrc_ask = 0

" leader + r -> ripgrep
map <leader>r :Rg<space>

"-------------------------------------------------------------------------------
" Dein
"-------------------------------------------------------------------------------

let s:dein_dir = expand('~/.cache/dein')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let g:rc_dir = expand('~/.dotfiles/.vim/rc')
let s:toml = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "call dein#add('Shougo/denite.nvim', {
  "\ 'hook_add': 'source ~/.dotfiles/.config/nvim/plugins/denite.rc.vim',
  "\ })

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('itchyny/lightline.vim')
  call dein#add('jlanzarotta/bufexplorer')


  " call dein#add('jiangmiao/auto-pairs')
  call dein#add('alampros/vim-styled-jsx')

  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')


  call dein#add('ryanoasis/vim-devicons')

  call dein#add('kristijanhusak/defx-icons')
  call dein#add('kristijanhusak/defx-git')
  call dein#add('Shougo/defx.nvim', {
  \ 'depends': ['defx-git', 'defx-icons'],
  \ 'hook_add': 'source ~/.dotfiles/config/nvim/plugins/defx.rc.vim',
  \ })
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('morhetz/gruvbox')
  call dein#add('altercation/vim-colors-solarized')

  call dein#add('neoclide/coc.nvim', {
  \ 'merged': 0,
  \ 'rev': 'release',
  \ 'hook_add': 'source ~/.dotfiles/config/nvim/plugins/coc.rc.vim'
  \ })

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" nmap <Leader>t :Files<CR>
" nmap <Leader>r :Tags<CR>

"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

set guifont=Source\ Code\ Pro\ for\ Powerline\:h11
let g:webdevicons_enable_vimfiler = 1

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------

" Set these in .config/nvim/init.vim
" colorscheme solarized
" colorscheme molokai
" colorscheme gruvbox

"-------------------------------------------------------------------------------
" Same pane switching commands as VIM, but in Tmux
"-------------------------------------------------------------------------------
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
  let &t_ti = "\<Esc>]2;nvim\<Esc>\\" . &t_ti
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

"-------------------------------------------------------------------------------
" imports
"-------------------------------------------------------------------------------

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    source ~/.dotfiles/config/nvim/nvimrc.osx
  endif
endif

source ~/.dotfiles/config/nvim/nvimrc.maps
source ~/.dotfiles/config/nvim/nvimrc.lightline

" allows for true color
if exists("&termguicolors") && exists("&winblend")
  let g:neosolarized_termtrans=1
  " runtime ./colors/solarized_true.vim
  " runtime ./colors/molokai.vim
  runtime ./colors/gruvbox.vim
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif
