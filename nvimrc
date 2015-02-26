" Leader
let mapleader = " "

" Plugins 
call plug#begin('~/.nvim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/matchit.zip'
Plug 'dbakker/vim-projectroot'
Plug 'terryma/vim-multiple-cursors'

" Notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Statusbar 
Plug 'bling/vim-airline'

" Rails 
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'ecomba/vim-ruby-refactoring'

" Elixir 
Plug 'elixir-lang/vim-elixir'

" CSS 
Plug 'cakebaker/scss-syntax.vim'
Plug 'Rykka/colorv.vim'

" Markdown 
Plug 'plasticboy/vim-markdown'

" Handlebars 
Plug 'mustache/vim-mustache-handlebars'

" Git 
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" Search 
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'

" Colours 
Plug 'croaky/vim-colors-github'

" EditorConfig 
Plug 'editorconfig/editorconfig-vim'


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

" Gist 
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_private = 1

" Unite 

" Excluded directories for unite
call unite#custom_source('file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/',
  \ '\.sass-cache/',
  \ '\node_modules/',
  \ '\.svn/',
  \ '\.hg/',
  \ '\.bundle/',
  \ 'vendor/',
  \ 'tmp/',
  \ 'log/'
  \ ], '\|'))

" Ctrlp replacement
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Build the ctrlp function, using projectroot to define the 
" working directory.
function! Unite_ctrlp()
  execute ':Unite  -buffer-name=files -start-insert buffer file_rec:'.ProjectRootGuess().'/'
endfunction

" Call these custom settings on all unite buffers:
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <c-a> <Plug>(unite_choose_action)

  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Tell unit to use ag for searching
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <C-P> :call Unite_ctrlp()<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>s :Unite -quick-match buffer<cr>

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
colorscheme github
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h11

" Notes 
:let g:notes_directories = ['~/Dropbox/Notes']

" NetRW
set autochdir
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
nnoremap <leader><leader> <c-^>

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
