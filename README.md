# README

## Apply dotfiles

Simply run ./install

## Manuall steps to dump and load dconf

Dump:

    dconf dump / > dconf-settings.ini

Load:

    dconf load / < dconf-settings.ini

## Manuall steps to dump and load gsettings

Dump:

    gsettings list-recursively > dump

Set specific settings:

    gsettings set org.gnome.desktop.calendar show-weekdate true

## Manuall steps to dump and load gnome terminal conf:

Dump:

    cat gnome-term.conf | dconf load /org/gnome/terminal/legacy/profiles:/

Load:

    dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-term.conf