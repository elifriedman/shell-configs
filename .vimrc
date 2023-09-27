set tabstop=4 shiftwidth=4 expandtab pastetoggle=<F2>
set autoindent 
set si
filetype indent on
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
syntax on

" set visualbell to make screen not flash on error
set vb t_vb=""
