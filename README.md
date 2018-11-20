# FFRK WIKI TO JSON
[![Build Status](https://travis-ci.com/inuyasha82/ffrk_wiki_to_json.svg?branch=master)](https://travis-ci.com/inuyasha82/ffrk_wiki_to_json)

I will add more features in the future.


This application  generate a json of the ffrk soul breaks, including the following information:

* name
* user
* realm
* effect
* target
* realm
* burst abilities (for burs soul break)

Usage
=======

Use the following command:

  ruby downloader.b [options]

Where options can be:

* `-t` or `--type sbtype` it downloads the soulbreak of type sbtype (it can be: default, ultra, shared, arcane, overstrike, burst, super, unique)
* `-o` or `--output filename` it save the json into file with name filename
* `-h` or `--help` to read the help

If no parameters provided it downloads the default soulbreak information on the file default.json. If no output file name is provided, it will use the default name in the format of: sbtype.json where sbtype is the selected soul break type.

Prerequisites
===============

You need ruby installed on your machine in order to run this application.

TODO
======
Ideally i would like to generate json for everything in the game (characters, weapons, accessories, foes, etc).

See tasks issues section (feel free to add tasks/issues)
