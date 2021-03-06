scriptencoding utf-8
set encoding=utf-8
set nocompatible
set pastetoggle=<F2>
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set scrolloff=10
set wildmenu
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·,trail:·
set colorcolumn=+1
set number
set numberwidth=5
set splitbelow
set splitright
set spellfile=$HOME/.vim-spell-en.utf-8.add
set t_Co=256
set cursorline
set relativenumber
set wildignore+=*/_build/*,*/deps/*
set visualbell

set suffixesadd+=.js
set suffixesadd+=.ts
set suffixesadd+=.jsx
set suffixesadd+=.tsx
set path+=$PWD/node_modules

"set autoread
"au CursorHold * checktime

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 5

let mapleader = ","
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_typescript_checkers = ['tslint']
"let g:jsx_ext_required = 0
"let g:javascript_plugin_flow = 1
let g:html_indent_tags = 'li\|p'
let g:netrw_liststyle=3
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:mustache_abbreviations = 1
let g:tmuxline_separators = {
      \'left' : ' ♪',
      \'left_alt': ' ♪ ',
      \'right' : ' ♪ ',
      \'right_alt' : ' ♪ ',
      \'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'z'    : '#H'}
let g:airline_theme = 'minimalist'
let g:airline_left_sep = ' ♩ '
let g:airline_right_sep = ' ♩ '
let g:ctrlp_custom_ignore = 'output\|node_modules\|DS_Store\|git\|bower_components\|jest_*'
let g:neoformat_try_formatprg = 1

let g:rustfmt_autosave = 1
nmap <F8> :TagbarToggle<CR>

nnoremap <C-t> :CtrlPTag<cr>
map <leader>/ <plug>NERDCommenterToggle :normal ^f<space><cr>
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>= <C-w>=
map <Leader>n :NERDTreeToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

omap / <Plug>(easymotion-tn)

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <Leader>tn :tabnew<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Color setting
filetype plugin indent on
colorscheme iceberg

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

augroup fmt
  autocmd!
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.css Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
augroup END

augroup vimrcEx
  autocmd!

  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  autocmd FileType markdown setlocal spell
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript set filetype=javascript.jsx
  autocmd FileType css,scss,sass setlocal iskeyword+=-
  autocmd FileType html,haml,elixir setlocal textwidth=400
augroup END

autocmd BufNewFile * :ClearAllCtrlPCaches
