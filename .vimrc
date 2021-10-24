filetype plugin indent on
syntax on
let need_to_install_plugins = 0
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          let need_to_install_plugins = 1
        endif

        call plug#begin()
        Plug 'pixelneo/vim-python-docstring'
        Plug 'mechatroner/rainbow_csv'
        Plug 'davidhalter/jedi-vim'
        Plug 'tpope/vim-sensible'
        Plug 'itchyny/lightline.vim'
        Plug 'joshdick/onedark.vim'
        Plug 'ap/vim-buftabline'
        Plug 'airblade/vim-gitgutter'
        Plug 'preservim/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'jiangmiao/auto-pairs'
        Plug 'dense-analysis/ale'
        Plug 'majutsushi/tagbar'
        Plug 'vim-scripts/indentpython.vim'
        Plug 'lepture/vim-jinja'
        Plug 'pangloss/vim-javascript'
        Plug 'alvan/vim-closetag'
        Plug 'maxmellon/vim-jsx-pretty'
        call plug#end()

filetype plugin indent on
syntax on
let g:python_style = 'google'
if need_to_install_plugins == 1
      echo "Installing plugins..."
          silent! PlugInstall
              echo "Done!"
                  q
                endif
"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set laststatus=2
set t_Co=256
set t_ut=
set number
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
	    if g:is_mouse_enabled == 1
		            echo "Mouse OFF"
			            set mouse=
				            let g:is_mouse_enabled = 0
					        else
							        echo "Mouse ON"
								        set mouse=a
									        let g:is_mouse_enabled = 1
										    endif
									    endfunction

syntax on
colorscheme onedark
filetype on
filetype plugin indent on
set noshowmode
let g:lightline = { 'colorscheme': 'onedark'  }
set foldmethod=indent
set foldlevel=99
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
	    if &wrap
		            echo "Wrap OFF"
			            setlocal nowrap
				            set virtualedit=all
					            silent! nunmap <buffer> <Up>
						            silent! nunmap <buffer> <Down>
							            silent! nunmap <buffer> <Home>
								            silent! nunmap <buffer> <End>
									            silent! iunmap <buffer> <Up>
										            silent! iunmap <buffer> <Down>
											            silent! iunmap <buffer> <Home>
												            silent! iunmap <buffer> <End>
													        else
															        echo "Wrap ON"
																        setlocal wrap linebreak nolist
																	        set virtualedit=
																		        setlocal display+=lastline
																			        noremap  <buffer> <silent> <Up>   gk
																				        noremap  <buffer> <silent> <Down> gj
																					        noremap  <buffer> <silent> <Home> g<Home>
																						        noremap  <buffer> <silent> <End>  g<End>
																							        inoremap <buffer> <silent> <Up>   <C-o>gk
																								        inoremap <buffer> <silent> <Down> <C-o>gj
																									        inoremap <buffer> <silent> <Home> <C-o>g<Home>
																										        inoremap <buffer> <silent> <End>  <C-o>g<End>
																											    endif
																										    endfunction
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F10> 10gt 
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 1
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
	    NERDTreeTabsToggle
	        if g:nerdtree_open == 1
			        let g:nerdtree_open = 0
				    else
					            let g:nerdtree_open = 1
						            wincmd p
							        endif
							endfunction

							function! StartUp()
								    if 0 == argc()
									            NERDTree
										        end
										endfunction
										autocmd VimEnter * call StartUp()
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)
map <leader>t :TagbarToggle<CR>
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
	    set pastetoggle=<Esc>[201~
	        set paste
		    return ""
	    endfunction]
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

