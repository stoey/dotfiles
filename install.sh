#/bin/sh -e

# Setup Vim

## Install pathogen
[ -d "${HOME}/.vim/autoload" ] || mkdir -p "${HOME}/.vim/autoload"
[ -d "${HOME}/.vim/bundle" ] || mkdir -p "${HOME}/.vim/bundle"
[ -f "${HOME}/.vim/autoload/pathogen.vim" ] || curl -LSso "${HOME}/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
fgrep -q "pathogen#infect()" "${HOME}/.vimrc" || echo "
execute pathogen#infect()
syntax on
filetype plugin indent on
" >> "${$HOME}/.vimrc"

## Install CoffeeScript plugin
[ -d "${HOME}/.vim/bundle/vim-coffee-script/" ] || git clone "https://github.com/kchmck/vim-coffee-script.git" "${HOME}/.vim/bundle/vim-coffee-script/"
(cd ${HOME}/.vim/bundle/vim-coffee-script/ && git pull)



