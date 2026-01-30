<!-- markdownlint-disable -->
<h3 align="center">
 <img src="https://raw.githubusercontent.com/sainnhe/everforest/master/palette.png" width="100" alt="Logo"/><br/>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
 Everforest for <a href="https://github.com/tmux/tmux">Tmux</a>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
    <a href="https://github.com/schlerp/tmux-everforest/stargazers"><img src="https://img.shields.io/github/stars/schlerp/tmux-everforest?colorA=2D353B&colorB=A7C080&style=for-the-badge"></a>
    <a href="https://github.com/schlerp/tmux-everforest/issues"><img src="https://img.shields.io/github/issues/schlerp/tmux-everforest?colorA=2D353B&colorB=E69875&style=for-the-badge"></a>
    <a href="https://github.com/schlerp/tmux-everforest/contributors"><img src="https://img.shields.io/github/contributors/schlerp/tmux-everforest?colorA=2D353B&colorB=A7C080&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="./assets/preview.webp"/>
</p>
<!-- markdownlint-enable -->

## Themes

<details>
<summary>🌲 Dark Hard</summary>

High contrast dark theme with hard edges.

</details>
<details>
<summary>🌲 Dark Medium (Default)</summary>

Balanced dark theme with medium contrast.

</details>
<details>
<summary>🌲 Dark Soft</summary>

Low contrast dark theme with softer colors.

</details>
<details>
<summary>🌿 Light Hard</summary>

High contrast light theme with hard edges.

</details>
<details>
<summary>🌿 Light Medium</summary>

Balanced light theme with medium contrast.

</details>
<details>
<summary>🌿 Light Soft</summary>

Low contrast light theme with softer colors.

</details>

## Installation

In order to have the icons displayed correctly please use/update your favorite
[nerd font](https://www.nerdfonts.com/font-downloads).
If you do not have a patched font installed, you can override or remove any
icon. Check the [documentation](./docs/reference/configuration.md) on the
options available.

### Manual (Recommended)

This method is recommended as TPM has some issues with name conflicts.

<!-- x-release-please-start-version -->

1. Clone this repository to your desired location (e.g.
   `~/.config/tmux/plugins/everforest`).

   ```bash
   mkdir -p ~/.config/tmux/plugins/everforest
   git clone https://github.com/schlerp/tmux-everforest.git ~/.config/tmux/plugins/everforest/tmux
   ```

1. Add the following line to your `tmux.conf` file:
   `run ~/.config/tmux/plugins/everforest/tmux/everforest.tmux`.
1. Reload Tmux by either restarting or reloading with `tmux source ~/.tmux.conf`.
<!-- x-release-please-end -->

Check out what to do next in the "[Getting Started Guide](./docs/tutorials/01-getting-started.md)".

### TPM

<!-- x-release-please-start-version -->

1.  Install [TPM](https://github.com/tmux-plugins/tpm)
1.  Add the Everforest plugin:

    ```bash
    set -g @plugin 'schlerp/tmux-everforest'
    # ...alongside
    set -g @plugin 'tmux-plugins/tpm'
    ```

1.  (Optional) Set your preferred flavor, it defaults to `"dark_medium"`:

    ```bash
    set -g @everforest_flavor 'dark_medium' # Options: dark_hard, dark_medium, dark_soft, light_hard, light_medium, light_soft
    ```

    <!-- x-release-please-end -->

> [!IMPORTANT]
> You may have to run `~/.config/tmux/plugins/tpm/bin/clean_plugins`
> if upgrading from a Catppuccin-based version.

### For TMUX versions prior to 3.2

This plugin uses features that were only introduced into tmux in version 3.2.
If you are using a version earlier than this, you can still have lovely
everforest colors, the installation method just looks a little different.

```sh
# In your ~/.tmux.conf

# Add the colors from the palette. Check the themes/ directory for all options.

# Some basic dark_medium colors.
set -g @ef_bg "#2D353B"
set -g @ef_surface_1 "#3D484D"
set -g @ef_fg "#D3C6AA"
set -g @ef_green "#A7C080"
set -g @ef_bg_dim "#232A2E"

# status line
set -gF status-style "bg=#{@ef_bg},fg=#{@ef_fg}"

# windows
set -gF window-status-format "#[bg=#{@ef_surface_1},fg=#{@ef_fg}] ##I ##T "
set -gF window-status-current-format "#[bg=#{@ef_green},fg=#{@ef_bg_dim}] ##I ##T "
```

### Upgrading from Catppuccin

This theme is based on the [Catppuccin tmux theme](https://github.com/catppuccin/tmux) architecture.
If you're migrating from Catppuccin, update your configuration:
- Replace `@catppuccin_` with `@everforest_` in all option names
- Update flavor names to Everforest variants (e.g., `dark_medium`, `light_soft`)
- Replace `catppuccin.tmux` with `everforest.tmux` in your run commands

## Recommended Default Configuration

This configuration shows some customisation options, that can be further
extended as desired.

```bash
# ~/.tmux.conf

# Options to make tmux more pleasant
set -g mouse on
set -g default-terminal "tmux-256color"

# Configure the everforest plugin
set -g @everforest_flavor "dark_medium"
set -g @everforest_window_status_style "rounded"

# Load everforest
run ~/.config/tmux/plugins/everforest/tmux/everforest.tmux
# For TPM, instead use `run ~/.tmux/plugins/tmux-everforest/everforest.tmux`

# Make the status line pretty and add some modules
set -g status-right-length 100
set -g status-left-length 100
set -g status-left ""
set -g status-right "#{E:@everforest_status_application}"
set -agF status-right "#{E:@everforest_status_cpu}"
set -ag status-right "#{E:@everforest_status_session}"
set -ag status-right "#{E:@everforest_status_uptime}"
set -agF status-right "#{E:@everforest_status_battery}"

run ~/.config/tmux/plugins/tmux-plugins/tmux-cpu/cpu.tmux
run ~/.config/tmux/plugins/tmux-plugins/tmux-battery/battery.tmux
# Or, if using TPM, just run TPM
```

## Documentation

### Guides

- [Getting Started](./docs/tutorials/01-getting-started.md)
- [Custom Status Line Segments](./docs/tutorials/02-custom-status.md)
- [Troubleshooting](./docs/guides/troubleshooting.md)

### Reference

- [Status Line](./docs/reference/status-line.md)
- [Configuration Options Reference](./docs/reference/configuration.md)

## 💝 Thanks to

- [sainnhe](https://github.com/sainnhe) for creating the beautiful [Everforest color scheme](https://github.com/sainnhe/everforest)
- [Catppuccin tmux](https://github.com/catppuccin/tmux) for the excellent tmux theme architecture this is based on
- [Pocco81](https://github.com/Pocco81)
- [vinnyA3](https://github.com/vinnyA3)
- [rogeruiz](https://github.com/rogeruiz)
- [kales](https://github.com/kjnsn)

&nbsp;

<!-- markdownlint-disable -->
<p align="center">
<a href="https://github.com/sainnhe/everforest" target="_blank">Everforest Color Scheme</a>
<p align="center"><a href="https://github.com/schlerp/tmux-everforest/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=D3C6AA&colorA=2D353B&colorB=A7C080"/></a></p>
<!-- markdownlint-enable -->
