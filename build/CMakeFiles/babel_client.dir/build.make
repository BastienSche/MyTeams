# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.22.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.22.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build

# Include any dependencies generated for this target.
include CMakeFiles/babel_client.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/babel_client.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/babel_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/babel_client.dir/flags.make

CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o: babel_client_autogen/mocs_compilation.cpp
CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o -MF CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/babel_client_autogen/mocs_compilation.cpp

CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/babel_client_autogen/mocs_compilation.cpp > CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.i

CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/babel_client_autogen/mocs_compilation.cpp -o CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.s

CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o: ../client/RequestHandler.cpp
CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o -MF CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o.d -o CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/RequestHandler.cpp

CMakeFiles/babel_client.dir/client/RequestHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/RequestHandler.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/RequestHandler.cpp > CMakeFiles/babel_client.dir/client/RequestHandler.cpp.i

CMakeFiles/babel_client.dir/client/RequestHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/RequestHandler.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/RequestHandler.cpp -o CMakeFiles/babel_client.dir/client/RequestHandler.cpp.s

CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o: ../client/ResponseHandler.cpp
CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o -MF CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o.d -o CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/ResponseHandler.cpp

CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/ResponseHandler.cpp > CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.i

CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/ResponseHandler.cpp -o CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.s

CMakeFiles/babel_client.dir/client/Window.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/Window.cpp.o: ../client/Window.cpp
CMakeFiles/babel_client.dir/client/Window.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/babel_client.dir/client/Window.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/Window.cpp.o -MF CMakeFiles/babel_client.dir/client/Window.cpp.o.d -o CMakeFiles/babel_client.dir/client/Window.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/Window.cpp

CMakeFiles/babel_client.dir/client/Window.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/Window.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/Window.cpp > CMakeFiles/babel_client.dir/client/Window.cpp.i

CMakeFiles/babel_client.dir/client/Window.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/Window.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/Window.cpp -o CMakeFiles/babel_client.dir/client/Window.cpp.s

CMakeFiles/babel_client.dir/client/finalwindow.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/finalwindow.cpp.o: ../client/finalwindow.cpp
CMakeFiles/babel_client.dir/client/finalwindow.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/babel_client.dir/client/finalwindow.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/finalwindow.cpp.o -MF CMakeFiles/babel_client.dir/client/finalwindow.cpp.o.d -o CMakeFiles/babel_client.dir/client/finalwindow.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/finalwindow.cpp

CMakeFiles/babel_client.dir/client/finalwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/finalwindow.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/finalwindow.cpp > CMakeFiles/babel_client.dir/client/finalwindow.cpp.i

CMakeFiles/babel_client.dir/client/finalwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/finalwindow.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/finalwindow.cpp -o CMakeFiles/babel_client.dir/client/finalwindow.cpp.s

CMakeFiles/babel_client.dir/client/main.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/main.cpp.o: ../client/main.cpp
CMakeFiles/babel_client.dir/client/main.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/babel_client.dir/client/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/main.cpp.o -MF CMakeFiles/babel_client.dir/client/main.cpp.o.d -o CMakeFiles/babel_client.dir/client/main.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/main.cpp

CMakeFiles/babel_client.dir/client/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/main.cpp > CMakeFiles/babel_client.dir/client/main.cpp.i

CMakeFiles/babel_client.dir/client/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/main.cpp -o CMakeFiles/babel_client.dir/client/main.cpp.s

CMakeFiles/babel_client.dir/client/mainwindow.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/mainwindow.cpp.o: ../client/mainwindow.cpp
CMakeFiles/babel_client.dir/client/mainwindow.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/babel_client.dir/client/mainwindow.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/mainwindow.cpp.o -MF CMakeFiles/babel_client.dir/client/mainwindow.cpp.o.d -o CMakeFiles/babel_client.dir/client/mainwindow.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/mainwindow.cpp

CMakeFiles/babel_client.dir/client/mainwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/mainwindow.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/mainwindow.cpp > CMakeFiles/babel_client.dir/client/mainwindow.cpp.i

CMakeFiles/babel_client.dir/client/mainwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/mainwindow.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/mainwindow.cpp -o CMakeFiles/babel_client.dir/client/mainwindow.cpp.s

CMakeFiles/babel_client.dir/client/registerwindow.cpp.o: CMakeFiles/babel_client.dir/flags.make
CMakeFiles/babel_client.dir/client/registerwindow.cpp.o: ../client/registerwindow.cpp
CMakeFiles/babel_client.dir/client/registerwindow.cpp.o: CMakeFiles/babel_client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/babel_client.dir/client/registerwindow.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/babel_client.dir/client/registerwindow.cpp.o -MF CMakeFiles/babel_client.dir/client/registerwindow.cpp.o.d -o CMakeFiles/babel_client.dir/client/registerwindow.cpp.o -c /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/registerwindow.cpp

CMakeFiles/babel_client.dir/client/registerwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/babel_client.dir/client/registerwindow.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/registerwindow.cpp > CMakeFiles/babel_client.dir/client/registerwindow.cpp.i

CMakeFiles/babel_client.dir/client/registerwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/babel_client.dir/client/registerwindow.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/client/registerwindow.cpp -o CMakeFiles/babel_client.dir/client/registerwindow.cpp.s

# Object files for target babel_client
babel_client_OBJECTS = \
"CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o" \
"CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o" \
"CMakeFiles/babel_client.dir/client/Window.cpp.o" \
"CMakeFiles/babel_client.dir/client/finalwindow.cpp.o" \
"CMakeFiles/babel_client.dir/client/main.cpp.o" \
"CMakeFiles/babel_client.dir/client/mainwindow.cpp.o" \
"CMakeFiles/babel_client.dir/client/registerwindow.cpp.o"

# External object files for target babel_client
babel_client_EXTERNAL_OBJECTS =

../babel_client: CMakeFiles/babel_client.dir/babel_client_autogen/mocs_compilation.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/RequestHandler.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/ResponseHandler.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/Window.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/finalwindow.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/main.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/mainwindow.cpp.o
../babel_client: CMakeFiles/babel_client.dir/client/registerwindow.cpp.o
../babel_client: CMakeFiles/babel_client.dir/build.make
../babel_client: /usr/local/lib/QtNetwork.framework/Versions/A/QtNetwork
../babel_client: /usr/local/lib/QtWidgets.framework/Versions/A/QtWidgets
../babel_client: /Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/lib/libportaudio.dylib
../babel_client: /usr/local/lib/QtGui.framework/Versions/A/QtGui
../babel_client: /usr/local/lib/QtCore.framework/Versions/A/QtCore
../babel_client: CMakeFiles/babel_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable ../babel_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/babel_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/babel_client.dir/build: ../babel_client
.PHONY : CMakeFiles/babel_client.dir/build

CMakeFiles/babel_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/babel_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/babel_client.dir/clean

CMakeFiles/babel_client.dir/depend:
	cd /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build /Users/gabrieldetaxis/Desktop/UltimateBabel/Testing/build/CMakeFiles/babel_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/babel_client.dir/depend

