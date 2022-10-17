---@diagnostic disable: undefined-global
os.chdir("../../")
project (WorkspaceName).group = "Games"

    kind ("ConsoleApp")
    language ("C++")
    location ("Intermediate/ProjectFiles")

    targetdir ("Binaries/%{WorkspaceName}/%{cfg.platform}/%{cfg.buildcfg}")

    objdir ("Intermediate/Build/" .. WorkspaceName)

    os.mkdir("Content")
    os.mkdir("Source/" .. WorkspaceName)

    includedirs ( "Source/" .. WorkspaceName )

    files{ "Source/Game.cpp",  "Source/" .. WorkspaceName .. "/**.h", "Source/" .. WorkspaceName .. "/**.cpp"}
    files{ "Config/AppIcon/Resource.rc"}

    vpaths{
        ["Source"] = {"Source/Game.cpp"}
    }

    vpaths{
        ["Source/" .. WorkspaceName .. "/*"] = { "Source/" .. WorkspaceName .. "/**.h", "Source/" .. WorkspaceName .. "/**.cpp" }
    }

    -- Raylib --
    includedirs("Config/Project Raylib/src")
    libdirs ( "Binaries/Raylib/%{cfg.platform}/%{cfg.buildcfg}" )
    links {"raylib"}

    -- Package --
    filter  "configurations:Package" 
        defines { "PACKAGEMODE" }
        
        Content = '"Content/"'
        defines("CONTENT=" .. Content)
        FilesFrom = path.getabsolute("Content")
        FileTo = path.getabsolute("Package/%{cfg.platform}/Content/")
        targetdir("Package/%{cfg.platform}")
        --libdirs ( "ThirdParty/Lib/%{cfg.platform}/Release" )
        symbols "Off"
        optimize "On"   
        postbuildmessage "Copying Content Files..."
        -- copy a file from the objects directory to the target directory
        postbuildcommands { "{COPYDIR} %{FilesFrom} %{FileTo}" }

    filter "system:windows"
        --defines{"_WIN32"}
        links {"winmm", "kernel32", "opengl32", "gdi32"}

    filter "system:linux"
        links {"pthread", "GL", "m", "dl", "rt", "X11"}

    filter "system:macosx"
        links {"OpenGL.framework", "Cocoa.framework", "IOKit.framework", "CoreFoundation.framework", "CoreAudio.framework", "CoreVideo.framework"}

    filter "action:vs*"
        defines{"_WINSOCK_DEPRECATED_NO_WARNINGS", "_CRT_SECURE_NO_WARNINGS"}

    filter{}