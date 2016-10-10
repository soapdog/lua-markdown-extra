local markdown_extra = {}
local markdown = require "markdown"
local yaml = require "yaml"

local fm_token_start = "<!--"
local fm_token_end = "-->"

local function fetchMetadata(fullText)
    local metadata 
    local justMarkdown
    local status
    local ts_pos_start, ts_pos_end = string.find(fullText, fm_token_start)
    local te_pos_start, te_pos_end = string.find(fullText, fm_token_end)

    if ts_pos_start ~= nil and ts_pos_end ~= nil and te_pos_start ~= nil and te_pos_end ~= nil then
        metadata = string.sub(fullText, ts_pos_end+2, te_pos_start-1)

        status, metadata = pcall(yaml.load, metadata)

        if not status then
            metadata = nil
        end

        justMarkdown = string.sub(fullText, te_pos_end+2, #fullText)
    else
        metadata = nil
        justMarkdown = fullText
    end 


    return {metadata = metadata, markdown = justMarkdown}
end

function markdown_extra.set_metadata_delimiters(startDelimiter, endDelimiter)
    fm_token_start = startDelimiter
    fm_token_end = endDelimiter
end

function markdown_extra.from_file(path)   
    local f = assert (io.open (path, "rb"))
    local src = f:read("*all")
    f:close()
    return markdown_extra.from_string(src)
end

function markdown_extra.from_string(text)  
    local src = fetchMetadata(text)
    local html = markdown(src.markdown)
    return html, src.metadata
end

return markdown_extra