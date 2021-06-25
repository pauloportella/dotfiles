function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths


export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"