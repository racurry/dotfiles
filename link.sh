#!/bin/bash

SCRIPT_PATH=$(cd `dirname $0` && pwd -P)
DOTFILES_PATH=$(cd ${SCRIPT_PATH}/ && pwd)

ln -s ${DOTFILES_PATH}/.vimrc ${HOME}/.vimrc
ln -s ${DOTFILES_PATH}/.zshrc ${HOME}/.zshrc
