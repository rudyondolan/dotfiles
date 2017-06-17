# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Remove greeting message
set fish_greeting ''

# Theme
set theme_color_scheme solarized-light
set -g theme_color_scheme light
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes

# Powerline
# set fish_function_path $fish_function_path "/home/rudy/.local/lib/python3.5/site-packages/powerline/bindings/fish"
# powerline-setup

# Laravel
set -gx PATH $PATH "/home/rudy/.config/composer/vendor/bin"

# PHPbrew
set -gx PHPBREW /home/rudy/.phpbrew/phpbrew.fish

