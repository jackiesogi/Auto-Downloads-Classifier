local classifyHandling = {}

local function capture(command)
    local file = io.popen(command)
    local output = file:read('*a')
    file:close()
    return output
end


function classifyHandling.classifyFolder(folderNames, downloadedFile)

    -- Execute the chatgpt command to determine the folder
    local command = "chatgpt \"in the following folder names: " .. folderNames .. ", return only the name of the folder that you think the " .. downloadedFile.. " should be put, without saying other words or sentences\""
    -- Use os.execute or another suitable method to execute the command
    local output = capture(command) -- Use os.execute or appropriate method to execute the command
    --local folder = "academic"
    local folder = output:match("(%S+)$")
    
    return folder
end

function classifyHandling.loadFolderNames()
    local folderNames = ""
    local files = io.popen('ls -d ./feature_test*/'):read("*all")
    -- Process the output of 'ls' command to get folder names as a string with space delimiter
    -- Extract folder names from 'files' variable and concatenate them into 'folderNames'
    -- You might need to clean and format 'files' appropriately to extract folder names
    
    return folderNames
end

return classifyHandling

