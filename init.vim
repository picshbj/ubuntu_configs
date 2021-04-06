""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
noremap <leader>r :so ~/.config/nvim/init.vim <cr>
noremap <leader>rc :tabnew ~/.config/nvim/init.vim <cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')

" Colorscheme Plugs
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00'  }
Plug 'sainnhe/sonokai'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'arzg/vim-colors-xcode'
Plug 'kristijanhusak/vim-hybrid-material'

" Pretty dev-icons
Plug 'ryanoasis/vim-devicons'

Plug 'tmux-plugins/vim-tmux'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" Comfortable motion
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Tagbar
Plug 'majutsushi/tagbar'
nmap ? :TagbarToggle<cr>

" Nerdtree
Plug 'scrooloose/nerdtree'
nmap \ :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let g:NERDTreeDirArrowCollapsible = '🔰'

" Autopair close
Plug 'jiangmiao/auto-pairs'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'


" Clean Whitespace
Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

" Expand Visual-block
Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'   }
Plug 'junegunn/fzf.vim'

" tpope
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'mhinz/vim-startify'

" undotree
Plug 'mbbill/undotree'
noremap <F3> :UndotreeToggle<cr>
set undodir=~/.config/nvim/undodir
set undofile

Plug 'frazrepo/vim-rainbow'
let g:rainbow_active=1

" Plug 'blueyed/vim-diminactive'
" let g:diminactive_enable_focus = 1

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" EASY Motion
Plug 'easymotion/vim-easymotion'
Plug 'pechorin/any-jump.vim'

" Ctrlp
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Floating terminal
Plug 'voldikss/vim-floaterm'
noremap <leader>ter :FloatermNew<cr>

" Terminal
Plug 'vimlab/split-term.vim'
set splitbelow
noremap <c-t> :10Term<cr>

" Python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop'  }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pboettch/vim-cmake-syntax'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><F7> :if exists("g:syntax_on") <Bar>
            \   syntax off <Bar>
            \ else <Bar>
            \   syntax enable <Bar>
            \ endif <CR>
colorscheme gruvbox
set background=dark
set termguicolors
set mouse=a
set t_Co=256

set cursorline
set noshowmode
set list listchars=trail:»,tab:»-,eol:¬
set pastetoggle=<F2>

" Indent for global
set expandtab
set shiftwidth=4
set softtabstop=4

" Automatic indentation is good
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase

" Column limits
set colorcolumn=110
set textwidth=110
" Toggle between column widths
let g:wide_column = 1
noremap <leader>c :call ToggleColumnWidth()<cr>
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        highlight colorcolumn ctermbg=DarkGray guibg=DarkMagenta
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        highlight colorcolumn ctermbg=DarkGray guibg=DarkGray
        let g:wide_column = 1
    endif
endfunction

" Relative line number
set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Last modifed cursor position
au BufReadPost *
  \ if line("'\"") > -1 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Navigate completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc-expolorer
nmap <leader>e :CocCommand explorer<CR>

" Set python interpreter
noremap <leader>int :CocCommand python.setInterpreter<cr>

" coc-yank
nnoremap <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <leader>ycl :CocCommand yank.clean<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> /gd :call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap rn <Plug>(coc-rename)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split windows
nmap <leader>sp :split
nmap <leader>vsp :vsplit

" Resizing windows
noremap <leader>= :exe "resize +3" <cr>
noremap <leader>- :exe "resize -3" <cr>
noremap <leader>1 :exe "vertical resize -8" <cr>
noremap <leader>2 :exe "vertical resize +8" <cr>

" Use arrow keys to switch tabs
noremap <leader><leader><esc> :bp <BAR> bd#<cr>
noremap tc :tabclose <cr>
noremap <leader><Tab> :tabnext<cr>
noremap <leader><S-Tab> :tabprevious<cr>
noremap <leader><Tab> :bprevious <cr>
noremap <leader><S-Tab> :bnext <cr>
noremap <leader>to :tabnew

" Some mistake keys
cmap Wq wq
cmap W w
cmap Q q

" Move windows
nmap <S-h> <C-w>h
nmap <S-j> <C-w>j
nmap <S-k> <C-w>k
nmap <S-l> <C-w>l

" Some useful keys
nmap <c-s> :update<cr>
vmap <c-s> <c-c> :update<cr>
imap <c-s> <c-o> :update<cr>

