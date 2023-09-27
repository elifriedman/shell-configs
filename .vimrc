set tabstop=4 shiftwidth=4 expandtab pastetoggle=<F2>
set ai
set si
filetype indent on
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
