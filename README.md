# Andrew's dotfiles

- Pretty much just command line stuff
- This repo has configs for a bunch of differnet stuff, but everything is packaged separately so you can use only what you need. `stow` is used to link the various packages into your home directory.
- At a minimum you'll want `git` to grab and update the repo, and `stow` to manage packages (though you _could_ do everything by hand... but that would become a bit of a bear very quickly).
- You'll want a [Nerd Font](https://www.nerdfonts.com/) (current favourite is FiraCode Nerd Font Propo) for a bunch of stuff to display nicely.

Software that we store configs for, or use (though nothing is mandatory):
- [bat\*](https://github.com/sharkdp/bat)
- [btop](https://github.com/aristocratos/btop)
- [duf](https://github.com/muesli/duf)
- [eza](https://github.com/eza-community/eza)
- [fd\*](https://github.com/sharkdp/fd)
- [fzf\*](https://github.com/junegunn/fzf)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [mc](https://midnight-commander.org/)
- [ncdu](https://dev.yorhel.nl/ncdu)
- [ripgrep](https://github.com/burntsushi/ripgrep)
- [starship](https://starship.rs/)
- [tmux](https://github.com/tmux/tmux)
- [yazi](https://yazi-rs.github.io/docs/configuration/overview/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

Most of those can be installed from an OS-level package, or grabbed as a binary from github. The ones marked with "\*" have been seen to do weird things when installed from a package on Ubuntu.

## Usage
The hope is that this scheme is simple and modular:
> Clone this repo onto your host -> `cd dotfiles` -> `stow <package-name>`

`stow` just one or two packages for a bare-bones system:
> `stow bash vim`

Or `stow` a whole bunch on your fully-loaded daily driver:
> `stow bash starchip vim tmux eza zoxide fzf yazi ripgrep ncdu mc lazygit fd duf btop bat`

Add your current favourite colour scheme (only one at a time, or `stow` will give you the what for):
> `stow theme-gruvbox`

There might be a package specific to a host that you need (again... one at a time):
> `stow host-fussy_workstation`

Is it time for a change of theme?
> `stow -D theme-gruvbox`
>
> `stow theme-solarized` 
