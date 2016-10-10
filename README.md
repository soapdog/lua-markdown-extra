# lua-markdown-extra
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
local html, metadata = mde.from_file("test.md")
```

The ```html``` will contain your processed markdown, the ```metadata``` will be a table with your metadata.


