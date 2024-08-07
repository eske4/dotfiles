# Dotfiles

My dotfile configuration for Arch Linux and Hyprland.

## Desktop Configuration

Follow these steps to set up your desktop environment:

### Step 1: Display Settings

1. Open `Display Settings` with the app launcher. 
2. Ensure the scale is set to 1.
3. Set the screen size to maximum.

### Step 2: Set Background

1. Press the gallery icon in the bar at the right corner to set the background.

### Step 3: Configure Hyprland Environment

1. Navigate to `~/dotfiles/home/.config/hypr/conf/environment.conf`.
2. Add Nvidia environment settings if you have an Nvidia graphics card, or skip this step if you do not.

### Step 4: Enable Pywal Integration

1. Enable Pywal on Discord:

   - Open BetterDiscord settings.
   - Enable Pywal.

2. Add the PywalFox add-on to Firefox:

   - Install the add-on from [this link](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/).

3. Add the PywalFox add-on to Thunderbird:
   - Install the add-on from [this link](https://addons.thunderbird.net/en-US/thunderbird/addon/pywalfox/).
   - Go to Thunderbird's add-on section and enable the add-on.

### Step 5: Add hyprpm plugin

1. Navigate to `~/dotfiles/scripts/hyprland/`.
2. Run the script `setup_hypr_plugins.sh`

## Dependencies

- **Waybar**: Bar UI
- **GTK**: Graphical toolkit
- **Sddm-git**: Display manager
- **Kitty**: Terminal emulator
- **Hyprland-git**: Desktop environment
- **Hypridle**: Inactivity handler
- **Hyprlock**: Lock screen
- **SWWW**: Wallpaper engine
- **Waypaper**: Wallpaper changer UI
- **UDiskie**: External drive manager
- **Pipewire**: Audio engine
- **Wireplumber**: Pipewire session manager
- **Pavucontrol**: Audio control UI
- **Slurp** and **Grim**: Screenshot system
- **Cliphist**: Clipboard manager
- **Pywal**: Theming tool
- **Wpgtk**: Pywal manager
- **SwayNc**: Notification center
- **UPower**: Power management tool
- **Tofi**: Applauncher
- **Swappy**: Screenshot editor
- **Nwg**: GTK manager ui
- **Starship** Terminal tool

## Bugs

- Wallpaper change does not work while Neovim is open.

## TODO

- [x] Setup SDDM(Simple Desktop Display Manager).
- [x] Script to symlink even when the file and structure already exists.
- [x] Link scripts in miscs and hyprland to the installer scripts.
- [x] Customize login screen ui
- [x] Restyle Hyprlock
- [x] Fix Hyprlock style when using gif as background
- [x] Themed SwayNC
- [x] Themed Wlogout
- [x] Responsive wallpaper change on SDDM 

## Requirement

Storage around 14.8GB
