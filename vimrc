:syntax enable
:set autoindent
:colo desert

set runtimepath+=/usr/share/lilypond/2.10.33/vim/
set linespace=2
set number
set cursorline
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
