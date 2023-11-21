:set exrc
:set number
:set relativenumber
:set tabstop=4
:set shiftwidth=4
:set smartindent
:set expandtab
:set smarttab
:set softtabstop=4
:set mouse=a
:set background=dark
:set nohlsearch
:set nowrap
:set noerrorbells
:set incsearch
:set scrolloff=8
:set guifont=Inconsolata
:set signcolumn=yes
:set colorcolumn=120
:set clipboard=unnamedplus

call plug#begin('~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysiw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation F8 to toggle
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'powerline/fonts'
Plug 'mattn/emmet-vim' "provides support for expanding abbreviations similar to emmet
Plug 'davidhalter/jedi-vim' "python autocompletion 
Plug 'scrooloose/syntastic' "code syntaxis 
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis... 
Plug 'yggdroot/indentline' "Show indent lines (useful for loops) 
Plug 'tmhedberg/SimpylFold' "Python folding 
Plug 'ervandew/supertab' "<Tab> for code completion
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/glepnir/dashboard-nvim'
Plug 'https://github.com/ThePrimeagen/vim-be-good' " practice nvim
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jbgutierrez/vim-better-comments'
Plug 'lewis6991/gitsigns.nvim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'jiangmiao/auto-pairs'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Typescript
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Jsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Php
Plug 'shawncplus/phpcomplete.vim'
Plug 'dense-analysis/ale'
Plug 'StanAngeloff/php.vim'
Plugin 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'easymotion/vim-easymotion'
Plug 'noahfrederick/vim-laravel'

call plug#end()

require('gitsigns').setup()

" set termguicolors
" lua << EOF
" require("bufferline").setup{}
" EOF
#-------------------------------------------------------------



let g:jsx_ext_required = 1


nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme abstract "atom abstract 
highlight Normal guibg=none

let mapleader=" "
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>

map <leader>h :wincmd h <CR>
map <leader>j :wincmd j <CR>
map <leader>k :wincmd k <CR>
map <leader>l :wincmd l <CR>

nnoremap <C-s> :Telescope find_files<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-S-b> :NERDTreeFind<CR>


map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

imap <tab> <Plug>(coc-snippets-expand)
" let g:UltiSnipsExpandTrigger = '<Nop>'
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-sql',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================



" identifying php files
autocmd BufNewFile,BufRead *.php setfiletype php
syntax on
