syntax on

"line numbering that toggles between normal and relative
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"original line number
set number

"indent options
set ai

"search incrementally and highlighting
set incsearch
set hlsearch

"show matching brackets
set showmatch

"tab completion
set wildmode=longest:full
set wildmenu

"set semi-colon to colon
nore ; :
nore : ;

"dark background color
set background=light

"shift >>/<< width
set shiftwidth=2

set tabstop=8

"Use Enter to introduce new lines below w/o leaving normal mode
map <Enter> o<ESC>

"""setup vundle
set nocompatible
filetype off

set rtp^=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""manage vundle
Plugin 'gmarik/Vundle.vim'

"""CtrlP plugin
Plugin 'ctrlpvim/ctrlp.vim'

"""License adder
Plugin 'antoyo/vim-licenses'

"""find ideal positions to jump to
Plugin 'unblevable/quick-scope'

"""list of tags
Plugin 'majutsushi/tagbar'

"""comment toggle
Plugin 'tpope/vim-commentary'

"""slime for vim
Plugin 'jpalardy/vim-slime'

"""Documentation in browser
Plugin 'keith/investigate.vim'

"""Main go plugin
Plugin 'fatih/vim-go'

""" Snippets in golang
""" Have not got working yet
"Plugin 'SirVer/ultisnips'

""" simple Autocomplete for golang
Plugin 'Shougo/neocomplete.vim'

call vundle#end()
filetype plugin indent on

"Ctrlp fuzzy finder : thanks to Robin Ward
"for quick indexing by using git file listing => no files from gitignore, but untracked files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

""" search through tags
let g:ctrlp_extensions = ['tag']
nmap <leader>p ;CtrlPTag<CR>

"""For the License Adder
let g:licenses_authors_name = 'Govindarajan, Chander <chandergovind@gmail.com>'
let g:licenses_copyright_holders_name = 'Govindarajan, Chander <chandergovind@gmail.com>'

""" set terminal mode
set term=rxvt-unicode
""" this way, by using tmux (with xterm keys on) also works

""" for urxvt
map [5^ <C-PageUp>
map [6^ <C-PageDown>

""" Tabs management

"""switching between tabs
map <C-PageUp> ;tabprevious<CR>
map <C-PageDown> ;tabnext<CR>

""" new tab creation
map tn <Esc>;tabnew<CR>

""" QuickScope plugin

""" toggle with
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

""" tagbar plugin

""" easy toggle
nmap <F8> ;TagbarToggle<CR>

""" Timeouts for commands
set notimeout
set ttimeout

""" Show partial commands
set showcmd

""" QuickFix window options

""" direct move to next
nmap cn ;cn<CR>
" no mapping for prev -- as I rarely need it

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" required to counter the effect of our mapping of <CR> in clist window

""" A better escape
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>
inoremap <silent> <Left> <ESC><Left>
inoremap <silent> <Right> <ESC><Right>

""" remove highlighting till next search
nnoremap <silent> <esc> :noh<return><esc>

""" Courtesy of nvie/vimrc

""" to paste without mass auto indendation
set pastetoggle=<F2>

""" fold using syntax
set foldmethod=syntax
set foldclose=all "automatically reclose after navigating out
set foldlevel=0

""" underline current line
set cursorline
noremap <silent> <F3> :set nocursorline!<CR>

""" keep para indentation when wrapping text
set breakindent

" Quick yanking to the end of the line
nnoremap Y y$

""" End courtesy

""" slime configuration
let g:slime_target = "tmux"
noremap <silent> X :SlimeSendCurrentLine<CR>

""" vigode specfic configurations

""" golang tabs as 4 spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

""" Vim-go configurations
" fix imports on formatting
let g:go_fmt_command = "goimports"
" run metalinter on save
let g:go_metalinter_autosave = 1
" To open the alternate file
noremap <silent>ga :GoAlternate<CR>
" use :AT to open the alternate file in new tab
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" also with a simpler command
noremap <silent>gA :AT<CR>
" show info
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" better guru path - need to check if it actually works
" https://github.com/fatih/vim-go/issues/1037
au FileType go silent exe "GoGuruScope " . go#package#ImportPath(expand('%:p:h')) . "..."
" disable timeout when running GoTest
let g:go_test_timeout=0

""" Autocomplete settings
set completeopt=longest,menu,menuone
let g:neocomplete#enable_at_startup=1
" have selection on first option
let g:neocomplete#enable_auto_select = 1
