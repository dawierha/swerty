Script for installing the swerty keyboard on linux systems.

The layout is created by [Johan Gustafsson](https://johanegustafsson.net/projects/swerty/)

The script modifies the following files to add the keyboard layout:
* /usr/share/X11/xkb/symbols/se
* /usr/share/X11/xkb/rules/evdev.xml
* /usr/share/X11/xkb/rules/evdev.lst

## Requirements
Require sed to be installed and root privileges