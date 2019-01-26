# Order is significant. local should be last
scripts=(environment command-not-found prompts aliases autojump functions local)

for script in "${scripts[@]}"; do
  source "$HOME/.zsh/$script.zsh"
done

# This is all stuff that keeps getting shoved into or suggested for this file.
# It's less work to just leave them here than to fight it.

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
export PATH="/home/force/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This is me overriding a PATH change made by nvm or Node at some point that
# leads to the global bin being favored over the ./node_modules/.bin one. Maybe
# this can be removed at some point?
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

if uname -a | grep Microsoft >/dev/null 2>&1; then
  unsetopt BG_NICE
  export TERM=xterm-color
fi

# vi: set ft=sh:
