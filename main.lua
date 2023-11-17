local api = require("classifyHandling")

local function assignDirectory(fileName)
    local folderNames = api.loadFolderNames()
    local folder = api.classifyFolder(folderNames, fileName)
    local download = {
        folder = folder,
        --date = "", -- Add logic to extract creation date here if available
        name = fileName
    }

    return download
end

