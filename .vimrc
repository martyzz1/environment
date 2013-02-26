syntax on
set softtabstop=4
set shiftwidth=4
set tabstop=4
"set smarttab
set expandtab
"set autoindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"call pathogen#helptags()
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0
let g:syntastic_python_checker = "flake8"
let g:syntastic_python_flake8_args = "--ignore=E501,E261,E128"
call pathogen#infect()
