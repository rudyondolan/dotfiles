# put this files on $HOME/.config/fish/config.fish
# Theme Bobthefish
# set -g theme_color_scheme base16-dark
# set -g theme_color_scheme solarized-dark
set -g theme_color_scheme dark
# set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_display_date no
# Theme Default
set -g theme_short_path yes

# PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/sbin $PATH
set -g -x PATH $HOME/Library/Android/sdk $PATH
set -g -x PATH $HOME/Library/Android/sdk/tools $PATH
set -g -x PATH $HOME/Library/Android/sdk/tools/bin $PATH
set -g -x PATH $HOME/Library/Android/sdk/platform-tools $PATH

# Remove greeting message
set fish_greeting ''

# Alias
alias a=atom
alias m=mvim
alias t=trash
alias v=nvim
alias vs=code-insiders
alias de="cd $HOME/Desktop"
alias wo="cd $HOME/Works"
alias so="source $HOME/.config/fish/config.fish"
alias myfish="v $HOME/.config/fish/config.fish"
alias aether="cd $HOME/Works/tessereact-ui-apollo-frontend & v"

# Base16 Shell
# if status --is-interactive
#     eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
# end
