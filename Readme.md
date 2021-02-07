dotfiles
========

My dot files.  Just for portability.  Feel free to browse.

Polybar
-------

To install
```
$ ln -s $HOME/dotfiles/.config/polybar/ $HOME/.config
```
The mode, dark or light, can be changed by editing the colour include line

Backgrounds
-----------
Backgrounds are managed by the `set_background` utility.  It's usage is
```
$ set_background PATH_TO_BACKGROUNDS PATH_TO_POLYBAR_CONFIG_FILE
```
If the path to backgrounds is a directory, a random picture will be chosen from
the subtree once per day.

If a HEIC is found, the appropriate image for the time of day will be used as
the background.

The image will be parsed and a theme (light or dark) chosen for polybar.
