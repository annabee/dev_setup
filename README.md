# dev_setup

Development set up for a new Mac. Homebrew installs the tools, GNU Stow symlinks
the dotfiles into `$HOME`.

## Setup

1. Install Homebrew:

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Put Homebrew on the path for future shells, and for the current one:

   ```sh
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```

3. Install everything in the Brewfile, from the `homebrew` directory:

   ```sh
   cd homebrew
   brew bundle install --verbose
   brew bundle check --verbose
   ```

4. Link the dotfiles. Run this from the `dotfiles` directory, **not** from the
   repository root:

   ```sh
   cd dotfiles
   stow --target="$HOME" */
   ```

5. Open a new shell so the linked `.zshrc` is picked up.

## Post-install

### Python

```sh
uv python install 3.14        # or whichever version you need
uv python list                # confirm what is available
```

### Terraform

```sh
tfenv install latest
tfenv use latest
```

### Java

The Brewfile installs the current LTS as a cask. Confirm the shell picked it up:

```sh
/usr/libexec/java_home -v 25
echo "$JAVA_HOME"
```

### Containers

No container runtime is installed by default. `kind` needs one to create local
clusters, so uncomment `colima` in the Brewfile to install it. Colima is a
runtime only and also needs a client, either `docker` or `podman`.

## Tips

- Homebrew problems: `brew doctor`
- Preview a Brewfile change before applying it: `brew bundle check --verbose`
- `brew bundle cleanup` lists everything installed that the Brewfile does not
  mention; `brew bundle cleanup --force` then uninstalls it. That includes tools
  installed deliberately by other means, so read the list first.
