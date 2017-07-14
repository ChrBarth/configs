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
set relativenumber
"set cursorline
set wildmenu
set incsearch
set hlsearch

" Tabulatur-Shortcut: --
" i = insert-Mode
" - = ein "-" eingeben
" <Esc> = zurück in Normal-Mode
" vy = visual mode aktuelles Zeichen markieren und kopieren
" 79p = und 79x pasten
" Vy = ganze Zeile im Visual-Mode markieren und kopieren
" 5p = das ganze 5x einfügen (jetzt haben wir 6 Zeilen mit je 80 "-")
" 4j = 4 Zeilen nach unten gehen
" o = Zeile darunter einfügen
" <CR><CR><Esc> = 2 Leerzeilen druntersetzen und Insert-Mode verlassen
nnoremap -- :normal! i-<Esc>vy79pVy5p4jo<CR><CR><Esc>
" Taktstriche: II (fügt einen Taktstrich ein, Cursor muss sich auf oberster Tab-Linie befinden)
nnoremap II :normal! R\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>jR\|<Esc>5kl<Esc>

nnoremap <leader>t :tabnew<CR>

" shortcuts for some often used configs
nnoremap <leader>brc :tabnew<CR>:edit ~/.bashrc<CR>
nnoremap <leader>vrc :tabnew<CR>:edit ~/.vimrc<CR>
nnoremap <leader>i3c :tabnew<CR>:edit ~/.config/i3/config<CR>

" change Color of StatusLine when inserting/replacing:
au InsertEnter * hi StatusLine ctermfg=Magenta ctermbg=White
au InsertLeave * hi StatusLine ctermfg=LightYellow ctermbg=Black

" default color of StatusLine:
hi StatusLineNC ctermfg=Darkgrey ctermbg=Black
hi StatusLine ctermfg=LightYellow ctermbg=Black

" StatusLine format:
set statusline=%<%f\ [%{strlen(&fenc)?&fenc:'none'}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2

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
