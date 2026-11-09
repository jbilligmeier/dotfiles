#!/usr/bin/env bash
# Install oh-my-zsh (plugins only; Starship draws the prompt) and make zsh the
# login shell. Runs once per machine.
set -euo pipefail

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone -q --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

if [ "$(uname)" = Darwin ]; then
  login_shell="$(dscl . -read "/Users/$USER" UserShell | awk '{print $2}')"
else
  login_shell="$(getent passwd "$USER" | cut -d: -f7)"
fi
if command -v zsh >/dev/null && [ "$(basename "$login_shell")" != "zsh" ]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi
