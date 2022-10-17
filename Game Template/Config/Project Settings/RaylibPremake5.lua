---@diagnostic disable: undefined-global

function platform_defines()
    defines{"PLATFORM_DESKTOP"}

    filter {"options:graphics=opengl43"}
        defines{"GRAPHICS_API_OPENGL_43"}

    filter {"options:graphics=opengl33"}
        defines{"GRAPHICS_API_OPENGL_33"}

    filter {"options:graphics=opengl21"}
        defines{"GRAPHICS_API_OPENGL_21"}

    filter {"options:graphics=opengl11"}
        defines{"GRAPHICS_API_OPENGL_11"}

    filter {"system:macosx"}
        disablewarnings {"deprecated-declarations"}

    filter {"system:linux"}
        defines {"_GNU_SOURCE"}
-- This is necessary, otherwise compilation will fail since
-- there is no CLOCK_MONOTOMIC. raylib claims to have a workaround
-- to compile under c99 without -D_GNU_SOURCE, but it didn't seem
-- to work. raylib's Makefile also adds this flag, probably why it went
-- unnoticed for so long.
-- It compiles under c11 without -D_GNU_SOURCE, because c11 requires
-- to have CLOCK_MONOTOMIC
-- See: https://github.com/raysan5/raylib/issues/2729

    filter{}
end

os.chdir("../../")

project("Raylib").group = "Core"

    kind "StaticLib"
    language "C"
    location ("Intermediate/ProjectFiles")
    platform_defines()
    disablewarnings { "4996" }
    disablewarnings { "4244" }
    disablewarnings { "4305" }
    disablewarnings { "4305" }
    disablewarnings { "4018" }

    RaylibPath = "Config/Project Raylib/"

    targetdir ("Binaries/Raylib/%{cfg.platform}/%{cfg.buildcfg}")
    objdir ("Intermediate/Build/Raylib")

    includedirs {RaylibPath .. "src" }
    includedirs {RaylibPath .. "src/external" }
    includedirs {RaylibPath .. "src/external/glfw/include" }

    vpaths
    {
        ["Header Files"] = { RaylibPath .. "src/**.h"},
        ["Source Files/*"] = { RaylibPath .. "src/**.c"},
    }
    files
    {
        RaylibPath .. "src/*.h", RaylibPath .. "src/*.c"
    }

        -- Package --
    filter  "configurations:Package" 
        symbols "Off"
        optimize "On"   
  