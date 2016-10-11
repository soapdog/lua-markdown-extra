local mde = require "markdown_extra"

local markdown_with_metadata = [[
<!--
title: the title
subtitle: the subtitle
-->
# h1

para
]]

local markdown_no_metadata = [[
# h1

para
]]

local markdown_broken_metadata1 = [[
<!--
title = the title
subtitle: the subtitle
-->
# h1

para
]]
local markdown_broken_metadata2 = [[
<!-
title: the title
subtitle: the subtitle
-->
# h1

para
]]

local htmlProof = [[

<h1>h1</h1>

<p>para</p>    

]]

local metadataProof = {
    title = "the title",
    subtitle = "the subtitle"
}    

local function trim(s)
  -- from PiL2 20.4
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

describe("testing normal operation with strings", function() 

    it("normal markdown with metadata should work", function()
        local html, metadata = mde.from_string(markdown_with_metadata)
        
        assert.are.same(metadata, metadataProof)
        assert.are.same(trim(htmlProof), trim(html))
    end)

    it("normal markdown no metadata should work", function()
        local html, metadata = mde.from_string(markdown_no_metadata)
        
        assert.are.same(metadata, nil)
        assert.are.same(trim(htmlProof), trim(html))
    end)

    it("markdown with broken metadata should work #1", function()
        local html, metadata = mde.from_string(markdown_broken_metadata1)
        
        assert.are.same(metadata, nil)
        assert.are.same(trim(htmlProof), trim(html))
    end)

    it("markdown with broken metadata delimiter should work #2", function()
        local html, metadata = mde.from_string(markdown_broken_metadata2)
        
        assert.are.same(metadata, metadataProof)
        assert.are.same(trim(htmlProof), trim(html))
    end)
end)


