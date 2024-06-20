
local distros = {
    nixos       = "nixos",
    debian      = "debian",
    ubuntu      = "debian",
    arch        = "arch",
    manjaro     = "arch",
    suse        = "suse",
    macos       = "macos"
}


-- get the first cl argument
local osType = arg[1]

-- check if the osType is in the distros table
if distros[osType] == nil then
    print("Invalid osType")
    os.exit(1)
end

-- get the enumberated osType 

local info = distros[osType]

print(info)


-- install lfs
os.execute("luarocks install luafilesystem")

local lfs = require("lfs")

-- create symlinks for config files
print("Creating symlinks for config files")

local configsDir = "../configs"
local homeDir = os.getenv("HOME")
local configDir = homeDir .. "/.config"

-- for each config dir, link it to the dotfiles
for dir in lfs.dir(configsDir) do
    if dir ~= "." and dir ~= ".." then
        local configPath = configDir .. "/" .. dir
        os.execute("rm -rf " .. configPath)
        os.execute("ln -s " .. configsDir .. "/" .. dir .. " " .. configPath)
    end
end


-- if there is a .bashrc file in ~/, append fish to the end of it
local catBashRc = os.execute("cat ~/.bashrc | tail -n 1")

if catBashRc != "fish" then
    os.execute("echo 'fish' >> ~/.bashrc")
end

-- if thre is a .zshrc file in ~/, append fish to the end of it
local catZshRc = os.execute("cat ~/.zshrc | tail -n 1")

if catZshRc != "fish" then
    os.execute("echo 'fish' >> ~/.zshrc")
end



