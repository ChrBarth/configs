" my .vimrc

" misc settings: {{{

" plug.vim:
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'JosefLitos/vim-i3config'
Plug 'tpope/vim-fugitive'
call plug#end()

" Lilypond:
filetype off
set runtimepath+=/usr/share/lilypond/2.18.2/vim/
filetype on

syntax enable
set autoindent
set breakindent
colo desert
"let mapleader = ","
let mapleader = " "

" expand tabs to spaces
set expandtab
" one tab=4 spaces
set tabstop=4
" indented lines (">") also 4 spaces
set shiftwidth=4
" start scrolling when 8 lines from top/bottom:
set scrolloff=8

set linespace=2
"set number
set number relativenumber
" highlight the current line
set cursorline
set cursorlineopt=line

set wildmenu
set hlsearch
set incsearch
set path+=**
set rtp+=~/.fzf

"folding:
set foldmethod=marker
" }}}

" key mappings: {{{
" from https://www.youtube.com/watch?v=2pqipq-UEwQ:
" (disable arrow keys, leader+up and down move line up/down)
"no <Leader><down> ddp
"no <Leader><up> ddkP
no <left> <Nop>
no <down> <Nop>
no <right> <Nop>
no <up> <Nop>
"don't disable in insert mode (guitar tabs are too hard otherwise)
"ino <down> <Nop>
"ino <up> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" from https://youtu.be/hSHATqh8svM0:
" keeping the cursor centered when jumping from one search result to the next:
nnoremap n nzzzv
nnoremap N Nzzzv
" keep the cursor position when joining lines:
nnoremap J mzJ`z
" enable undo after every ,.; in insert-mode
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
" move selection up or down (keep selection):
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" move current line up or down (insert/normal mode):
inoremap <C-j> <ESC>:m .+1<CR>==
inoremap <C-k> <ESC>:m .-2<CR>==
" center view when scrolling half page up/down
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==

nnoremap <Leader>< :syntax sync fromstart
nnoremap <Leader>sw bvelxel"-p
nnoremap <Leader>sW BvElxEl"-p
nnoremap / /\v
inoremap jk <Esc>
nnoremap <Leader>' ''<Esc>i
nnoremap <Leader>" ""<Esc>i
nnoremap <Leader>( ()<Esc>i
nnoremap <Leader>[ []<Esc>i
" put quotes/brackets/... around selection:
vnoremap <Leader>" <Esc>`<i"<Esc>`>la"
vnoremap <Leader>' <Esc>`<i'<Esc>`>la'
vnoremap <Leader>( <Esc>`<i(<Esc>`>la)
vnoremap <Leader>[ <Esc>`<i[<Esc>`>la]
vnoremap <Leader>{ <Esc>`<i{<Esc>`>la}
vnoremap <Leader>` <Esc>`<i`<Esc>`>la`
" same mappings for visual line mode (V):
vnoremap <Leader>"" <Esc>`<i"<Esc>`>a"
vnoremap <Leader>'' <Esc>`<i'<Esc>`>a'
vnoremap <Leader>(( <Esc>`<i(<Esc>`>a)
vnoremap <Leader>[[ <Esc>`<i[<Esc>`>a]
vnoremap <Leader>{{ <Esc>`<i{<Esc>`>a}
vnoremap <Leader>`` <Esc>`<i`<Esc>`>la`
" keep selection after indenting:
vnoremap > >gv
vnoremap < <gv
" guitar-tab-shortcut: --
nnoremap -- :normal! i-<Esc>vy79pVy5p4jo<CR><CR><Esc>
" Taktstriche: II (fügt einen Taktstrich ein, Cursor muss sich auf oberster Tab-Linie befinden)
nnoremap II :normal! R\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>5kl<Esc>
nnoremap <leader>t :tabnew<CR>
" shortcuts for some often used configs
nnoremap <Leader>brc :tabnew<CR>:edit ~/.config/bashrc_base<CR>
nnoremap <Leader>vrc :tabnew<CR>:edit $MYVIMRC<CR>
nnoremap <Leader>i3c :tabnew<CR>:edit ~/.config/i3/config<CR>
nnoremap <Leader>xr :tabnew<CR>:edit ~/.Xresources<CR>
nnoremap <Leader>fs :tabnew<CR>:edit ~/.config/folder_shortcuts.txt<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR><CR>
nnoremap <Leader>vc :tabnew<CR>:edit ~/src/git/cheatsheets/vim-cheatsheet.md<CR>
nnoremap <Leader>n :tabnew<CR>:Explore ~/Dokumente/Notizen<CR>
nnoremap <Leader><Space> viw
nnoremap <Leader><Space><Space> viW
nnoremap <c-a> ggVG
vnoremap <Leader>C "+ygv
nnoremap <Leader>V "+p
vnoremap <Leader>X "+x
nnoremap <Leader>h :nohlsearch<CR>
" F5 in insert-Mode: insert date+time:
inoremap <F5> <C-R>=strftime("%c")<CR>
" open file browser on the left side
nnoremap <F11> <Esc>:Lexplore<CR><Esc>:vertical resize 40<CR>
"nnoremap <F11> :leftabove vnew<CR><Esc>:Explore<CR><Esc>:vertical resize 40<CR>
nnoremap <F12> <Esc>:Explore<CR>
"
" fzf-vim:
nnoremap <Leader>f <Esc>:Files<CR>
nnoremap <Leader>g <Esc>:GFiles<CR>
nnoremap <Leader>w <Esc>:Windows<CR>
nnoremap <Leader>b <Esc>:Buffers<CR>
nnoremap <leader>r <Esc>:Rg 
" }}}

" StatusLine stuff: {{{
" change Color of StatusLine when inserting/replacing:
hi TabLineSel ctermfg=7 ctermbg=234
hi TabLine ctermfg=244 ctermbg=234
hi TabLineFill ctermfg=234 ctermbg=244

au InsertEnter * hi StatusLine ctermfg=214 ctermbg=0
au InsertLeave * hi StatusLine ctermfg=232 ctermbg=244

" default color of StatusLine:
hi StatusLineNC ctermfg=234 ctermbg=244
hi StatusLine ctermfg=234 ctermbg=244

" StatusLine format:
set statusline=%<%f\ [%{strlen(&fenc)?&fenc:'none'}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
" }}}

" Syntax stuff: {{{
augroup php_html
    autocmd!
    " Autocommands php/html editing:
    au FileType php,html nnoremap <Leader>p <p></p><Esc>FpT>i
    au FileType php,html nnoremap <Leader>d <div></div><Esc>FdT>i
    au FileType php,html nnoremap <Leader>a <a href=""></a><Esc>FaT>i
    au FileType php,html nnoremap <Leader>img <img src=""><Esc>2T"i
    au FileType php,html nnoremap <Leader>b <b></b><Esc>FbT>i
    au FileType php,html nnoremap <Leader>e <em></em><Esc>FeT>i
    au FileType php,html nnoremap <Leader>ul <ul><Return></ul><Esc>O
    au FileType php,html nnoremap <Leader>l <li><Esc>a
    au FileType php,html nnoremap <Leader>tb <table><Return></table><Return><Esc>kO
    au FileType php,html nnoremap <Leader>th <th></th><Esc>FtT>i
    au FileType php,html nnoremap <Leader>tr <tr></tr><Esc>FtT>i
    au FileType php,html nnoremap <Leader>td <td></td><Esc>FtT>i
    au FileType php,html nnoremap <Leader>1 i<h1></h1><Esc>FhT>i
    au FileType php,html nnoremap <Leader>2 i<h2></h2><Esc>FhT>i
    au FileType php,html nnoremap <Leader>3 i<h3></h3><Esc>FhT>i
    au FileType php,html nnoremap <Leader>v i<!--<Return>--><Esc>O
    au FileType php,html nnoremap <Leader>V i<!-- --><Esc>3F-a
    au FileType php nnoremap <Leader>c <Esc>I/*  */<Esc>hhi
    au FileType php vnoremap <Leader>c I//<Esc>
    au FileType php nnoremap <Leader>php <?php  ?><Esc>Tpi
augroup END

augroup python_programming
	autocmd!
    au FileType python nnoremap <Leader>c I#<Esc>
augroup END

augroup lilypond
	autocmd!
    source $HOME/.vim/include/lilycomp.vim
	au FileType lilypond nnoremap <Leader>c I%<Esc>
    au filetype lilypond inoremap <Leader>rv \repeat volta 2 {  }<Esc>hi
    au FileType lilypond inoremap <Leader>ru \repeat unfold 2 {  }<Esc>hi
    " creates pdf from lilypond-file and previews it with xdg-open:
    au FileType lilypond nnoremap <Leader>lc :execute "call LilyComp()"<CR>
augroup END

augroup special_filetypes
    autocmd!
    " set filetype to css when loading .rasi files (rofi config):
    au BufRead,BufNewFile *.rasi set filetype=css
    au BufRead,BufNewFile ~/Mail/account.* set filetype=muttrc
augroup END

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug END

aug q3config_detection
  au!
  au BufNewFile,BufRead ~/.q3a/*.cfg set filetype=quake3
aug END
" }}}
