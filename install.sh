#/bin/sh -e

# Functions

FILE_EXISTS () { [ -f $1 ] }
DIR_EXISTS () { [ -d $1 ] }
FILE_CONTAINS () { fgrep -q $2 $1 }

# Setup Vim

## Install pathogen

DIR_EXISTS "${HOME}/.vim/autoload" || mkdir -p "${HOME}/.vim/autoload"
DIR_EXISTS "${HOME}/.vim/bundle" || mkdir -p "${HOME}/.vim/bundle"
FILE_EXISTS "${HOME}/.vim/autoload/pathogen.vim" || curl -LSso "${HOME}/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
FILE_CONTAINS "${HOME}/.vimrc" "pathogen#infect()" || echo "
execute pathogen#infect()
syntax on
filetype plugin indent on
" >> "${$HOME}/.vimrc"

## Install CoffeeScript plugin
DIR_EXISTS "${HOME}/.vim/bundle/vim-coffee-script/" || git clone "https://github.com/kchmck/vim-coffee-script.git" "${HOME}/.vim/bundle/vim-coffee-script/"
(cd ${HOME}/.vim/bundle/vim-coffee-script/ && git pull)



