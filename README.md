Fractal Art
=============
This program generates colorful Wallpapers.

# Usage
These are optional

It automatically detects your screen resolution.

| Command      | Argument |  Description                                | Default                       |
|--------------|----------|---------------------------------------------|-------------------------------|
| -w, --width  | Integer  | sets width of the generated image           | Screen Width                  |
| -h, --height | Integer  | sets height of the generated image          | Screen Height                 |
| -f, --file   | Path     | specify filename and path                   |  ~/.fractalart/wallpaper.bmp  |
| -n, --no-bg  |          | don't set the wallpaper                     |                               |

# Installation

####Arch Linux


This package is available in the AUR as fractalart-git. 

####Building manually

Make sure you have [stack](http://docs.haskellstack.org/en/stable/install_and_upgrade/) and zlib installed.

Then do:
```shell
$ git clone https://github.com/TomSmeets/FractalArt.git
$ cd FractalArt
$ stack install
```

Your executable will copied to your [local-bin path](http://docs.haskellstack.org/en/stable/install_and_upgrade/#path).
For Unix systems this path is `$HOME/.local/bin` and on Windows `%APPDATA%\local\bin`.

# Windows
If you want a new wallpaper each time you start your PC,
put the executable into a startup folder.

For Windows 7 this folder is located at:
`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

but can also be found in: `Start Menu -> All Programs`

# Linux
On Linux you have to set your wallpaper path to: `~/.fractalart/wallpaper.bmp`

And somehow run the program on startup.

## Gnome
You can add `~/.cabal/bin` to your path

or move `dist/build/FractalArt/FractalArt` inside `/usr/local/bin/`


Create `~/.config/autostart/fractalart.desktop` 

```
[Desktop Entry]
Name=FractalArt
GenericName=Fractal Art
Comment=Generate Wallpapers
Exec=FractalArt
Terminal=false
Type=Application
Categories=Graphics
```

This will execute the command `FractalArt` after login.

To set your wallpaper path run:

`gsettings set org.gnome.desktop.background picture-uri file://$HOME/.fractalart/wallpaper.bmp`

# Example images
![Image0](examples/image0.bmp?raw=true)

![Image1](examples/image1.bmp?raw=true)
