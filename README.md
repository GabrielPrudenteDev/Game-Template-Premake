# Game-Template-Premake
Template generator of projects to make Games with the Raylib library.  

This template uses the Premake 5 tool to generate the projects for Visual Studio.  

Visual Studio 17, 19 and 22 generators.  

Generating a new project.  
1 - Move the "Game Template" folder to your preferred location and rename it to your project name.  
2 - Go into the folder "My Project/Config/Generators" and run the desired generator.  
3 - Now go to the root folder, it has the name of your project and open the Solution and that's it.  

# Note
When generating a project, some things will be created in the root folder.  
"Content" folder will be used to store all your Assets like Music, Textures and others...  
"Intermediate" folder Content project files and compiled objects.  
"Source" folder will have Game.cpp the starting point of the program.  
"Source/Project Name" folder where all the .h and .cpp code files will be placed, this folder is marked by Visual Studio and will be the root of the files.  
This solution contains two Raylib projects which is a static library and the Executable Game Project.  
To add new files and need to update the project so that the filters are generated correctly, this can be done with the file "Refresh Project.bat" in the root folder of the project, it is generated with the project.  
It is possible to change the icon of the executable and just go to the folder "Config/AppIcon/" paste the new icon and change the name in the file "Resource.rc" to the name of the new icon and update the project. Right-click on the "Resource.rc" file and choose "Editor".  

# Macros
CONTENT - will have a const char* with the path from the root of the drive to the "Content" folder of the project. This makes it easier to get the assets path.  

DEBUGMODE   - builds in Debug mode.  
RELEASEMODE - builds in Release mode.  
PACKAGEMODE - builds in Package mode this copy all files from the "Content" folder along with the program binary to a "Package" folder in the project root.

# Credits
Raylib Everyone involved in the Raylib project.  
Raylib -> https://www.raylib.com/  

GameDevTutorials Channel with several videos about Raylib that gave me the idea of ​​making my own solution in Premake.  
YouTube -> https://www.youtube.com/channel/UC3fReidx_0iMJxjtzTA3qPw/videos  

Ripper Junkie Channel of a game developer who showed me C++ and Raylib.  
YouTube -> https://www.youtube.com/c/gameplayripper  

Canal do Oliveira Dev My Channel might have something there.  
YouTube -> https://www.youtube.com/channel/UC-S8m-8Lred5NLJKhzIHOSg  
