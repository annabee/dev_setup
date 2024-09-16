# dev_setup
Development specific set up for a new mac


## Instructions ##

1. Install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Add to PATH: `(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/anna/.zprofile
     eval "$(/opt/homebrew/bin/brew shellenv)"`
1. In the homebrew directory, run:
     - `brew bundle check --verbose --no-upgrade`
     - `brew bundle cleanup --verbose -f`
     - `brew bundle install --verbose --no-upgrade`
1. [Optional] Install [oh-my-posh](https://ohmyposh.dev/)
1. In the dotfiles directory, run: `stow --target=$HOME */`


### Tips:
- Homebrew related issues: `brew doctor`
