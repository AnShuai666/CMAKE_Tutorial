# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/as/Documents/software/CLion-2018.3.4/clion-2018.3.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/as/Documents/software/CLion-2018.3.4/clion-2018.3.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/as/CMAKE_Tutorial

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/as/CMAKE_Tutorial/build

# Utility rule file for NightlyConfigure.

# Include the progress variables for this target.
include CMakeFiles/NightlyConfigure.dir/progress.make

CMakeFiles/NightlyConfigure:
	/home/as/Documents/software/CLion-2018.3.4/clion-2018.3.4/bin/cmake/linux/bin/ctest -D NightlyConfigure

NightlyConfigure: CMakeFiles/NightlyConfigure
NightlyConfigure: CMakeFiles/NightlyConfigure.dir/build.make

.PHONY : NightlyConfigure

# Rule to build all files generated by this target.
CMakeFiles/NightlyConfigure.dir/build: NightlyConfigure

.PHONY : CMakeFiles/NightlyConfigure.dir/build

CMakeFiles/NightlyConfigure.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/NightlyConfigure.dir/cmake_clean.cmake
.PHONY : CMakeFiles/NightlyConfigure.dir/clean

CMakeFiles/NightlyConfigure.dir/depend:
	cd /home/as/CMAKE_Tutorial/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/as/CMAKE_Tutorial /home/as/CMAKE_Tutorial /home/as/CMAKE_Tutorial/build /home/as/CMAKE_Tutorial/build /home/as/CMAKE_Tutorial/build/CMakeFiles/NightlyConfigure.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/NightlyConfigure.dir/depend

