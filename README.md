# dev_setup
Development specific set up for a new mac


## Instructions ##

1. Install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. In the homebrew directory, run:
    - `brew bundle check --verbose --no-upgrade`
    - `brew bundle cleanup --verbose -f`
    - `brew bundle install --verbose --no-upgrade`
3. [Optional] Install `oh-my-zsh`: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
4. In the dotfiles directory, run: `stow --target=$HOME */`


### Tips:
- Homebrew related issues: `brew doctor`