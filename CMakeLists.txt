CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
project(helloworld)
set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

#The version number
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)

configure_file(
        "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
        "${PROJECT_SOURCE_DIR}/include/TutorialConfig.h"
        )

option(USE_MYMATH "Use tutorial provided math implementation" ON)
message(${USE_MYMATH})
if (USE_MYMATH)
        message("use the tutorial provided math library")
        add_subdirectory(src)
        set(EXTRA_LIBS ${EXTRA_LIBS} mysqrt)
endif ()

#add_subdirectory(include)
add_subdirectory(src_bin)
