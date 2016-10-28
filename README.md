# lua-markdown-extra
[![Build Status](https://travis-ci.org/soapdog/lua-markdown-extra.svg?branch=master)](https://travis-ci.org/soapdog/lua-markdown-extra) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/soapdog/lua-markdown-extra/master/LICENSE)
[![LuaRocks](https://img.shields.io/badge/LuaRocks-0.3-blue.svg)](https://luarocks.org/modules/soapdog/lua-markdown-extra)
[![Lua](https://img.shields.io/badge/Lua-5.1%2C%20JIT%2C%205.2-blue.svg)](https://img.shields.io/badge/Lua-5.1%2C%20JIT%2C%205.2-blue.svg)
[![GitHub issues](https://img.shields.io/github/issues/soapdog/lua-markdown-extra.svg)](https://github.com/soapdog/lua-markdown-extra/issues)
[![GitHub stars](https://img.shields.io/github/stars/soapdog/lua-markdown-extra.svg)](https://github.com/soapdog/lua-markdown-extra/stargazers)
[![GitHub release](https://img.shields.io/github/release/soapdog/lua-markdown-extra.svg?maxAge=2592000)]()

A rock that is able to process markdown files with metadata

## Instalation

You can install it with [Luarocks](http://luarocks.org)

``` $ luarocks install lua-markdown-extra```

## Usage

Consider the following markdown file:

```
<!--
title: My Markdown document with metadata
layout: just a layout
-->
This is my Markdown

# This is a title

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate assumenda provident nisi accusamus animi magnam porro id, vel saepe voluptate similique quia quis exercitationem, soluta, error dolorem modi obcaecati. Iusto?
```

You can process it with ```markdown_extra.from_file(filePath)``` or ```markdown_extra.from_string(stringContent)``` both functions return two values ```html, metadata```:

```
local mde = require "markdown_extra"
local html, metadata = mde.from_file("test.md")
```

The ```html``` will contain your processed markdown, the ```metadata``` will be a table with your metadata. The metadata frontmatter needs to be in [YAML](http://yaml.org) format. If you have an error in your frontmatter, the ```metadata``` variable will be ```nil```.

## API

### markdown_extra.from_file(path)
Process the file specified by ```path``` and returns both html and metadata.

### markdown_extra.from_string(stringContent)
Process the content specified by ```stringContent``` and returns both html and metadata.

### markdown_extra.set_metadata_delimiters(startDelimiter, endDelimiter)
Change the delimiters used to find the metadata at the start of the markdown content. The default values are ```<!--``` and ```-->```.

## Testing
I am using ```busted``` for testing. You can check our test spec inside the ```spec``` folder.


