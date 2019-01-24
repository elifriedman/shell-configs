syntax on
filetype plugin indent on

"Information on the following setting can be found with
":help set
set tabstop=4
set expandtab
set cindent
set autoindent 
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set ruler
set number
set backspace=indent,eol,start

" set visualbell
" Uncomment below to make screen not flash on error
set vb t_vb=""
colorscheme default

autocmd BufRead,BufNewFile   *.c,*.h,*.cpp au BufWinEnter * let w:m1=matchadd ('Search', '\%<80v.\%>76v', -1)
autocmd BufRead,BufNewFile   *.c,*.h,*.cpp au BufWinEnter * let w:m2=matchadd ('ErrorMsg', '\%>79v.\+', -1)

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\" zz ^" | endif
endif

" F8 = Swap between cpp/h file
nnoremap <silent> <F8> :exec ":e ".(expand("%") =~ ".h$"
            \       ? glob(substitute(expand("%"), ".h$", ".cpp", ""))
            \          : substitute(expand("%"), "\\.cpp$", ".h", ""))<CR>
"            \          : substitute(expand("%"), "\\.cp*$", ".h", ""))<CR>
" F9 = Swap between c/h file
nnoremap <silent> <F9> :exec ":e ".(expand("%") =~ ".h$"
            \       ? glob(substitute(expand("%"), ".h$", ".c", ""))
            \          : substitute(expand("%"), "\\.c$", ".h", ""))<CR>

" Auto-Insertion for closing braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {} {}
filetype plugin indent on
