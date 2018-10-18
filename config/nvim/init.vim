" Leader
let mapleader = " "

" Plugins 
call plug#begin('~/.local/share/nvim/plugged')

" Editing
Plug 'vim-scripts/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Rails 
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'thoughtbot/vim-rspec'

" CSS 
Plug 'cakebaker/scss-syntax.vim'
Plug 'Rykka/colorv.vim'

" Markdown 
Plug 'plasticboy/vim-markdown'

" Git 
Plug 'airblade/vim-gitgutter'

" Search 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colours 
Plug 'tomasr/molokai'

" EditorConfig 
Plug 'editorconfig/editorconfig-vim'

" Pane Management
Plug 'itspriddle/ZoomWin'

call plug#end()

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
let g:indent_guides_enable_on_vim_startup = 1

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Status Bar 
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 0
set shortmess=atTiOI

" Search
set nohlsearch
set incsearch
set ignorecase
set wildignore=*.swp,*.bak,*.pyc,*.class
set magic
set wildmode=longest:full,list:full

" Terminal Bells
set visualbell
set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Style
syntax on
colorscheme molokai
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h11

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"

" NetRW
let g:netrw_banner=0

" Editor settings
set nowrap
set number
set numberwidth=5

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set listchars=tab:▒\ ,trail:⎵
set list

" Multiple Cursors Settings
let g:multi_cursor_exit_from_insert_mode = 0

" Disabled Q (ex)
nnoremap Q <nop>

" Switch between the last two files
nnoremap <leader><tab> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Escaping term splits
tnoremap <Esc> <C-\><C-n>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Always use vertical diffs
set diffopt+=vertical

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" FZF / ripgrep

set grepprg=rg\ --vimgrep

" Setup :Find
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nnoremap <leader>t :Files<cr>
nnoremap <leader>/ :Find<cr>
