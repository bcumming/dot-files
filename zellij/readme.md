## configuring

```bash
# customise this according to XDG_CONFIG_HOME, if set

zellij setup --generate-completion zsh > $HOME/.config/zellij/setup.zsh
zellij setup --generate-completion zsh > $XDG_CONFIG_HOME/zellij/setup.zsh

zellij setup --generate-completion bash > $HOME/.config/zellij/setup.bash
zellij setup --generate-completion bash > $XDG_CONFIG_HOME/zellij/setup.bash
```

Then update your `.bashrc` or `.zshrc`

```bash
# zsh:
source $XDG_CONFIG_HOME/zellij/setup.zsh

# bash:
source $XDG_CONFIG_HOME/zellij/setup.bash
```

