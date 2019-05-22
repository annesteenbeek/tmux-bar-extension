# Tmux bar extension

This plugin adds the following information to your tmux navigation bar, either in `status-left` or `status-right`:

```
#{default_ip}
#{load_avg}
```

`#{default_ip}` shows the IP of your default gateway
`#{load_avg}` shows the load average of the last 5, 10 and 15 minutes.


Quick test:
add the following line in your `~/.tmux.conf`

    set -g status-right "IP: #{default_ip} | #{load_avg} "

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'annesteenbeek/tmux-bar-extension'

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/annesteenbeek/tmux-bar-extension ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/tmux-bar-extension.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{default_ip}` interpolation should now work.

### Modifying

I created this script to be easily extendable. Just read trough the code and add your own features.

### License

[WTFPL](LICENSE)
