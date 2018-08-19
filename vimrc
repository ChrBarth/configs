" my .vimrc

" misc settings: {{{
syntax enable
set autoindent
colo desert
let mapleader = ","

" expand tabs to spaces
set expandtab
" one tab=4 spaces
set tabstop=4
" indented lines (">") also 4 spaces
set shiftwidth=4

set linespace=2
"set number
set number relativenumber
"set cursorline
set wildmenu
set incsearch
set hlsearch
"folding:
set foldmethod=marker
" }}}

" key mappings: {{{
" from https://www.youtube.com/watch?v=2pqipq-UEwQ:
" (disable arrow keys, up and down move line up/down)
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>
imap <Leader>' ''<Esc>i
imap <Leader>" ""<Esc>i
imap <Leader>( ()<Esc>i
imap <Leader>[ []<Esc>i
" guitar-tab-shortcut: --
nnoremap -- :normal! i-<Esc>vy79pVy5p4jo<CR><CR><Esc>
" Taktstriche: II (fügt einen Taktstrich ein, Cursor muss sich auf oberster Tab-Linie befinden)
nnoremap II :normal! R\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>5kl<Esc>
nnoremap <leader>t :tabnew<CR>
" shortcuts for some often used configs
nnoremap <leader>brc :tabnew<CR>:edit ~/.bashrc<CR>
nnoremap <leader>vrc :tabnew<CR>:edit $MYVIMRC<CR>
nnoremap <leader>i3c :tabnew<CR>:edit ~/.config/i3/config<CR>
nnoremap <leader>rrc :tabnew<CR>:edit ~/.config/ranger/rc.conf<CR>
nnoremap <leader>xr :tabnew<CR>:edit ~/.Xresources<CR>
nnoremap <leader>sv :source $MYVIMRC<CR><CR>
" }}}

" StatusLine stuff: {{{
" change Color of StatusLine when inserting/replacing:
au InsertEnter * hi StatusLine ctermfg=Magenta ctermbg=White
au InsertLeave * hi StatusLine ctermfg=LightYellow ctermbg=Black

" default color of StatusLine:
hi StatusLineNC ctermfg=Darkgrey ctermbg=Black
hi StatusLine ctermfg=LightYellow ctermbg=Black

" StatusLine format:
set statusline=%<%f\ [%{strlen(&fenc)?&fenc:'none'}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
" }}}

" Syntax stuff: {{{
" Lilypond:
filetype off
set runtimepath+=/usr/share/lilypond/2.18.2/vim/
filetype on
syntax on

" Autocommands php/html editing:
au FileType php,html inoremap <leader>p <p></p><Esc>FpT>i
au FileType php,html inoremap <leader>d <div></div><Esc>FdT>i
au FileType php,html inoremap <leader>a <a href=""></a><Esc>FaT>i
au FileType php,html inoremap <leader>img <img src=""><Esc>2T"i
au FileType php,html inoremap <leader>b <b></b><Esc>FbT>i
au FileType php,html inoremap <leader>e <em></em><Esc>FeT>i
au FileType php,html inoremap <leader>ul <ul><Return></ul><Esc>O
au FileType php,html inoremap <leader>l <li><Esc>a
au FileType php,html inoremap <leader>1 <h1></h1><Esc>FhT>i
au FileType php,html inoremap <leader>2 <h2></h2><Esc>FhT>i
au FileType php,html inoremap <leader>3 <h3></h3><Esc>FhT>i
au FileType php,html inoremap <leader>tb <table><Return></table><Return><Esc>kO
au FileType php,html inoremap <leader>th <th></th><Esc>FtT>i
au FileType php,html inoremap <leader>tr <tr></tr><Esc>FtT>i
au FileType php,html inoremap <leader>td <td></td>Esc>FtT>i

au FileType php inoremap <leader>php <?php  ?><Esc>Tpi

" set filetype to css when loading .rasi files (rofi config):
au BufRead,BufNewFile *.rasi set filetype=css

au BufRead,BufNewFile ~/Mail/account.* set filetype=muttrc
" }}}

