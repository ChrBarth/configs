" my .vimrc

" misc settings: {{{

" Lilypond:
filetype off
set runtimepath+=/usr/share/lilypond/2.18.2/vim/
filetype on

syntax enable
set autoindent
set breakindent
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
set hlsearch
set incsearch
set path+=**
"folding:
set foldmethod=marker
" }}}

" key mappings: {{{
" from https://www.youtube.com/watch?v=2pqipq-UEwQ:
" (disable arrow keys, leader+up and down move line up/down)
no <Leader><down> ddp
no <Leader><up> ddkP
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
" switch word with next one (does not always work as expected):
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
" guitar-tab-shortcut: --
nnoremap -- :normal! i-<Esc>vy79pVy5p4jo<CR><CR><Esc>
" Taktstriche: II (fügt einen Taktstrich ein, Cursor muss sich auf oberster Tab-Linie befinden)
nnoremap II :normal! R\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>5kl<Esc>
nnoremap <leader>t :tabnew<CR>
" shortcuts for some often used configs
nnoremap <leader>brc :tabnew<CR>:edit ~/.config/bashrc_base<CR>
nnoremap <leader>vrc :tabnew<CR>:edit $MYVIMRC<CR>
nnoremap <leader>i3c :tabnew<CR>:edit ~/.config/i3/config<CR>
nnoremap <leader>rrc :tabnew<CR>:edit ~/.config/ranger_base.conf<CR>
nnoremap <leader>xr :tabnew<CR>:edit ~/.Xresources<CR>
nnoremap <leader>fs :tabnew<CR>:edit ~/.config/folder_shortcuts.txt<CR>
nnoremap <leader>sv :source $MYVIMRC<CR><CR>
nnoremap <leader>vc :tabnew<CR>:edit ~/src/git/cheatsheets/vim-cheatsheet.md<CR>
nnoremap <leader>n :tabnew<CR>:Explore ~/Dokumente/Notizen<CR>
nnoremap <Leader><Space> viw
nnoremap <Leader><Space><Space> viW
nnoremap <c-a> ggVG
vnoremap <Leader>C "+y
nnoremap <Leader>V "+p
vnoremap <Leader>X "+x
" F5 in insert-Mode: insert date+time:
inoremap <F5> <C-R>=strftime("%c")<CR>
" open file browser on the left side
nnoremap <F12> :leftabove vnew<CR><Esc>:Explore<CR><Esc>:vertical resize 40<CR>
nnoremap <F11> <Esc>:Explore<CR>
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
augroup php_html
    autocmd!
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
    au FileType php,html inoremap <leader>td <td></td><Esc>FtT>i
    au FileType php inoremap <leader>c <Esc>I/*  */<Esc>hhi
    au FileType php vnoremap <leader>c I//<Esc>
    au FileType php inoremap <leader>php <?php  ?><Esc>Tpi
augroup END

augroup python_programming
	autocmd!
    au FileType python nnoremap <Leader>c I#<Esc>
augroup END

augroup lilypond
	autocmd!
    source $HOME/.vim/include/lilycomp.vim
	au FileType lilypond nnoremap <Leader>c I%<Esc>
    au filetype lilypond inoremap <leader>rv \repeat volta 2 {  }<Esc>hi
    au FileType lilypond inoremap <Leader>ru \repeat unfold 2 {  }<Esc>hi
    " creates pdf from lilypond-file and previews it with xdg-open:
    au FileType lilypond nnoremap <leader>lc :execute "call LilyComp()"<CR>
augroup END

augroup special_filetypes
    autocmd!
    " set filetype to css when loading .rasi files (rofi config):
    au BufRead,BufNewFile *.rasi set filetype=css
    au BufRead,BufNewFile ~/Mail/account.* set filetype=muttrc
augroup END
" }}}

