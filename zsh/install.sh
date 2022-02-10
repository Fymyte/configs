#! /bin/bash

CUSTOM_PLUGINS="\
  https://github.com/zsh-users/zsh-autosuggestions \
  https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "

SCRIPT_DIR=$(pwd)

CUSTOM_DIR="$SCRIPT_DIR/custom"
OHMYZSH_DIR="$SCRIPT_DIR/ohmyzsh"

echo_info() {
  echo -en "\e[1;32m"
  echo -n $@
  echo -e "\e[0m"
}

create_custom_dir() {
  mkdir "$CUSTOM_DIR"
}

install_themes() {
  cd $SCRIPT_DIR
  mkdir "$CUSTOM_DIR/themes/"
  cp themes/*.zsh-theme "$CUSTOM_DIR/themes/"
}

install_plugins() {
  mkdir "$CUSTOM_DIR/plugins"
  cd "$CUSTOM_DIR/plugins"
  for plugin in $CUSTOM_PLUGINS; do
    git clone $plugin
  done
}

install_zshrc() {
  cd $SCRIPT_DIR
  ln -s "$SCRIPT_DIR/zshrc" "$HOME/.zshrc"
}

main() {
  echo_info "Creating custom directory"
  create_custom_dir

  echo_info "Installing themes ..."
  install_themes

  echo_info "Installing plugins ..."
  install_plugins

  echo_info "Installing zshrc file ..."
  install_zshrc
}

main
