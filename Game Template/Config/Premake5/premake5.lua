---@diagnostic disable: undefined-global

os.chdir("../../")

WorkspaceName = path.getbasename(os.getcwd())
Content = ""
workspace (WorkspaceName)

    startproject(WorkspaceName)

    configurations { "Debug", "Release", "Package" }
    platforms { "Win32", "Win64" }

    filter  "configurations:Debug" 
    defines { "DEBUGMODE" }
    Content = '"' .. path.getabsolute("Content") .. '/' .. '"'
    defines("CONTENT=" .. Content)
    symbols "On"
    
   filter  "configurations:Release" 
        defines { "RELEASEMODE" }
        Content = '"' .. path.getabsolute("Content") .. '/' .. '"'
        defines("CONTENT=" .. Content)
        optimize "On"

    filter "configurations:Package"
        staticruntime "on"
        runtime "Release"

   filter { "platforms:Win32" }
        architecture "x86"
        cppdialect "C++17"

    filter { "platforms:Win64" }
        architecture "x64"
        cppdialect "C++17"
        
    filter{}

    include ("Config/Project Settings/GamePremake5.lua")
    include ("Config/Project Settings/RaylibPremake5.lua")
    
    newaction {
        trigger     = "GeneratorVs2017",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Refresh Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2017'
            io.writefile(Filename, Content)

           
        end
     }

     newaction {
        trigger     = "GeneratorVs2019",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Refresh Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2019'
            io.writefile(Filename, Content)

           
        end
     }

     newaction {
        trigger     = "GeneratorVs2022",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Refresh Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2022'
            io.writefile(Filename, Content)

           
        end
     }
    
     newaction {
        trigger     = "Build Release",
        description = "Install the software",
        execute     = function ()
            buildcommands {
                "make %{WorkspaceName} %{cfg.buildcfg}"
             }
        end
     }