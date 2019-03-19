get_filename_component(CMAKETUTORIAL_CMAKE_DIR "$CMAKE_CURRENT_LIST_FILE" PATH)

set(FOOBAR_INCLUDE_DIRS "/home/yhl/CMAKE_Tutorial;/home/yhl/CMAKE_Tutorial/build")

if(NOT TARGET hello AND NOT CMakeTutorial_BINARY_DIR)
    include("${FOOBAR_CMAKE_DIR}/FooBarTargets.cmake")
endif()

set(MYSQRT_LIBRARIES mysqrt)
set(TUTORIAL_EXECUTABLE tutorial)
