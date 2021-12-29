function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_add_path "/usr/local/opt/libpq/bin" $fish_user_paths 

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/sls.fish ]; and . /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/slss.fish ]; and . /Users/paulo.portella/dev/pauloportella/bundlewatch-service/node_modules/tabtab/.completions/slss.fish
export PATH="$PATH:/Users/paulo.portella/.kenv/bin"
export PATH="$PATH:/Users/paulo.portella/.kit/bin"


