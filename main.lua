local api = require("classifyHandling")

local function assignDirectory(fileName, callback)
    local folderNames = api.loadFolderNames()
	print(folderNames)
    -- 使用 coroutine 模擬異步操作
    local co = coroutine.create(function()
        local folder = api.classifyFolder(folderNames, fileName)
        local download = {
            folder = folder,
            name = fileName
        }
        -- when operations are finished，call callback function
        callback(download)
    end)

    -- start coroutine
    coroutine.resume(co)
end

local function main()
    local downloaded_file = "./feature_test/Data_structure_HW1.txt"

    -- callback function
    local function handleDownload(download)
        if download and download.folder then
            print("The downloaded file: '" .. download.name .. "' has been moved to new directory: '" .. download.folder .. "'.")
        else
            print("Failed to determine the folder.")
        end
    end

    -- call assignDirectory function，and pass callback function as parameter
    assignDirectory(downloaded_file, handleDownload)
end

-- entry point
main()

