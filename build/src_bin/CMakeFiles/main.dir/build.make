# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yhl/CPP_STUDY/tmp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yhl/CPP_STUDY/tmp/build

# Include any dependencies generated for this target.
include src_bin/CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include src_bin/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include src_bin/CMakeFiles/main.dir/flags.make

src_bin/CMakeFiles/main.dir/main.cpp.o: src_bin/CMakeFiles/main.dir/flags.make
src_bin/CMakeFiles/main.dir/main.cpp.o: ../src_bin/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yhl/CPP_STUDY/tmp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src_bin/CMakeFiles/main.dir/main.cpp.o"
	cd /home/yhl/CPP_STUDY/tmp/build/src_bin && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/main.cpp.o -c /home/yhl/CPP_STUDY/tmp/src_bin/main.cpp

src_bin/CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	cd /home/yhl/CPP_STUDY/tmp/build/src_bin && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yhl/CPP_STUDY/tmp/src_bin/main.cpp > CMakeFiles/main.dir/main.cpp.i

src_bin/CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	cd /home/yhl/CPP_STUDY/tmp/build/src_bin && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yhl/CPP_STUDY/tmp/src_bin/main.cpp -o CMakeFiles/main.dir/main.cpp.s

src_bin/CMakeFiles/main.dir/main.cpp.o.requires:

.PHONY : src_bin/CMakeFiles/main.dir/main.cpp.o.requires

src_bin/CMakeFiles/main.dir/main.cpp.o.provides: src_bin/CMakeFiles/main.dir/main.cpp.o.requires
	$(MAKE) -f src_bin/CMakeFiles/main.dir/build.make src_bin/CMakeFiles/main.dir/main.cpp.o.provides.build
.PHONY : src_bin/CMakeFiles/main.dir/main.cpp.o.provides

src_bin/CMakeFiles/main.dir/main.cpp.o.provides.build: src_bin/CMakeFiles/main.dir/main.cpp.o


# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

../bin/main: src_bin/CMakeFiles/main.dir/main.cpp.o
../bin/main: src_bin/CMakeFiles/main.dir/build.make
../bin/main: ../lib/libhello.so
../bin/main: src_bin/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yhl/CPP_STUDY/tmp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/main"
	cd /home/yhl/CPP_STUDY/tmp/build/src_bin && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src_bin/CMakeFiles/main.dir/build: ../bin/main

.PHONY : src_bin/CMakeFiles/main.dir/build

src_bin/CMakeFiles/main.dir/requires: src_bin/CMakeFiles/main.dir/main.cpp.o.requires

.PHONY : src_bin/CMakeFiles/main.dir/requires

src_bin/CMakeFiles/main.dir/clean:
	cd /home/yhl/CPP_STUDY/tmp/build/src_bin && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : src_bin/CMakeFiles/main.dir/clean

src_bin/CMakeFiles/main.dir/depend:
	cd /home/yhl/CPP_STUDY/tmp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yhl/CPP_STUDY/tmp /home/yhl/CPP_STUDY/tmp/src_bin /home/yhl/CPP_STUDY/tmp/build /home/yhl/CPP_STUDY/tmp/build/src_bin /home/yhl/CPP_STUDY/tmp/build/src_bin/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src_bin/CMakeFiles/main.dir/depend

