## bashrc / zshrc

```bash
# the best generic option for letting your terminal emulator know that it is safe
# to render more than the standard 16 colors
export TERM=xterm-256color

# place all configuration and state in a uarch-specific path
xdgbase=$HOME/.local/$(uname -m)
export XDG_DATA_HOME=$xdgbase/share
export XDG_CONFIG_HOME=$xdgbase/config
export XDG_STATE_HOME=$xdgbase/state

export LOCAL_PATH=$xdgbase/bin
export PATH=$LOCAL_PATH:$PATH

export EDITOR=vim

# expand env variables automatically
shopt -s direxpand
```

```bash
# Respect default shortcuts.
$include /etc/inputrc

## arrow up
"\e[A":history-search-backward
## arrow down
"\e[B":history-search-forward
```

## oh-my-posh

Consistent prompt on all systems: https://ohmyposh.dev/

installing
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $LOCAL_PATH
```

```bash
# .bashrc / .zshrc

# only initialise oh-my-posh if it has been installed
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh init $(oh-my-posh get shell) --config $HOME/dot-files/oh-my-posh/theme.omp.json)"
fi
```

## neovim

Link the nvim configuration to the location neovim expects to find it
```
ln -s $XDG_CONFIG_HOME $HOME/dot-files
```

### LSP

I found setting up LSP is a bit more of a pain than expected.
The challenge is that we need to install two things:
* `clangd` executable
* the clang C++ headers in a path relative to `clangd`

Installing these on laptop or desktop PC is easy - just use pacman or apt-get, etc.

On Alps I made it work by building `llvm` in the `editors` uenv, but `llvm` is 12 GB uncompressed... it creates a 10x larger uenv squashfs.

On Alps the most efficient way is to download a pre-built binary package for LLVM, and copy out just the parts that we need.
```
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/clang+llvm-18.1.8-aarch64-linux-gnu.tar.xz
tar -xf clang+llvm-18.1.8-aarch64-linux-gnu.tar.xz
cp -Rv bin/clangd $HOME/.local/$(uarch -m)/bin
mkdir -p $HOME/.local/$(uarch -m)/lib/clang/18
cp -Rv lib/clang/18/include $HOME/.local/$(uarch -m)/lib/clang/18
```

I checked beforehand that `clangd` can be installed stand-alone:
```
> libtree ./bin/clangd -p
clangd
├── /lib64/libpthread.so.0 [default path]
├── /lib64/librt.so.1 [default path]
│   └── /lib64/libpthread.so.0 [default path]
├── /lib64/libtinfo.so.6 [default path]
└── /usr/lib64/libz.so.1 [default path]
```


Once set up, you can start nvim and check the lsp status:
```
:LspInfo
```
