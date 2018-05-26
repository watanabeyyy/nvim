set number
set mouse-=a
set clipboard=unnamed
set expandtab
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set termencoding=utf-8
set fenc=utf-8
set syntax=on

function Terminal()
  echo "Call termnial"
  :w
  :terminal
endfunction

nnoremap <C-f><C-f> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
nnoremap <C-x><C-x> :<C-u>call Terminal()<CR>

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:dir       = expand('~/.config/dein')
  let s:toml      = g:dir . '/realtime.toml'
  let s:lazy      = g:dir . '/lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy,      {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

colorscheme molokai

" enable deoplete
let g:deoplete#enable_at_startup = 1

let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'
