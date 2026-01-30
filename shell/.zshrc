# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
# Path to your oh-my-zsh installation.
export ZSH="/Users/victoryoalli/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git composer macos)
plugins=(composer macos)

source $ZSH/oh-my-zsh.sh

# Enable autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh #removed because amazon q

# Cargo for Rust Lang => Installed with rustup.
#
# source $HOME/.cargo/env

# Load the shell dotfiles, and then some:
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Setup xdebug
export XDEBUG_CONFIG="idekey=VSCODE"

# Alias hub to git
#eval "$(hub alias -s)"

# Extra PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
#export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export PATH=$PATH:$HOME/.dotnet
export PATH="$HOME/.dotnet/tools:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval export PATH="/Users/victoryoalli/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.6.0/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}



[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
export GITHUB_PACKAGE_REGISTRY_TOKEN=REDACTED

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Added by Windsurf
export PATH="/Users/victoryoalli/.codeium/windsurf/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

eval "$(zoxide init zsh)"

