# Andrew's dotfiles

- Pretty much just command line stuff
- clone the repo, cd dotfiles, stow <package-name>
- we assume `bash` and a copy of `vim` that's fairly new (8?... can we get away with 7?), and a [Nerd Font](https://www.nerdfonts.com/) (current favourite is FiraCode Nerd Font Propo).
- after that, you'll want `git` to get and update the repo (though you _can_ download it by hand), and `stow` to link the packages (though again, you _could_ do it by hand... but it can get to be a bit of a bear, and you probably don't want to be doing it manually) 

Software that we store configs for, or use (though nothing is mandatory):
- bat* ([https://github.com/sharkdp/bat](https://github.com/sharkdp/bat))
- btop ([https://github.com/aristocratos/btop](https://github.com/aristocratos/btop))
- duf ([https://github.com/muesli/duf](https://github.com/muesli/duf))
- eza ([https://github.com/eza-community/eza](https://github.com/eza-community/eza))
- fd ([https://github.com/sharkdp/fd](https://github.com/sharkdp/fd))
- fzf* ([https://github.com/junegunn/fzf](https://github.com/junegunn/fzf))
- lazygit ([https://github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit))
- mc ([https://midnight-commander.org/](https://midnight-commander.org/))
- ncdu ([https://dev.yorhel.nl/ncdu](https://dev.yorhel.nl/ncdu))
- ripgrep ([https://github.com/burntsushi/ripgrep](https://github.com/burntsushi/ripgrep))
- starship ([https://starship.rs/](https://starship.rs/))
- tmux ([https://github.com/tmux/tmux](https://github.com/tmux/tmux))
- yazi ([https://yazi-rs.github.io/docs/configuration/overview/](https://yazi-rs.github.io/docs/configuration/overview/))
- zoxide ([https://github.com/ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide))

Most of those can be installed from an OS-level package, or grabbed as a binary from github. The ones marked with "*" have been seen to do weird things when installed from a package on Ubuntu.
