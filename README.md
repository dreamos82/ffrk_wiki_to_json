# FFRK WIKI TO JSON
[![Build Status](https://travis-ci.com/inuyasha82/ffrk_wiki_to_json.svg?branch=master)](https://travis-ci.com/inuyasha82/ffrk_wiki_to_json)

I will add more features in the future.


This application currently generate only a json of the ffrk default soul breaks, including the following information:

* name
* user
* realm
* effect
* target
* realm

Usage
=======

Use the following command: 

  ruby downloader.b [options]
  
Where options can be: 

* `-t` or `--type sbtype` it downloads the soulbreak of type sbtype (it can be: default, ultra, shared, arcane, overstrike, burst, super, unique)
* `-o` or `--output filename` it save the json into file with name filename

If no parameters provided it downloads the default soulbreak information on the file default.json. If no output file name is provided, it will use the default name in the format of: sbtype.json where sbtype is the selected soul break type.

Prerequisites
===============

You need ruby installed on your machine in order to run this application.

TODO
======

See tasks issues section
