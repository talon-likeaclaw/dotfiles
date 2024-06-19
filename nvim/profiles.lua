--[[
       ___           ___           ___           ___                                    ___     
      /  /\         /__/\         /  /\         /  /\          ___        ___          /__/\    
     /  /:/         \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   
    /  /:/           \__\:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  
   /  /:/  ___   ___ /  /::\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ 
  /__/:/  /  /\ /__/\  /:/\:\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
  \  \:\ /  /:/ \  \:\/:/__\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
   \  \:\  /:/   \  \::/       \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      
    \  \:\/:/     \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     
     \  \::/       \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    
      \__\/         \__\/         \__\/         \__\/           ~~~~                   \__\/    

	A config switcher written in Lua by NTBBloodbath and Vhyrro.
--]]

-- Defines the profiles you want to use
local profiles = {
	nvtalon = { "~/.config/nvtalon", {
		plugins = "packer",
		preconfigure = "packer",
	} },
	lazyvim = { "~/.config/lazyvim", {
		plugins = "packer",
		preconfigure = "packer",
	} },
}

-- return <name_of_config>, <list_of_profiles>
return "lazyvim", profiles
