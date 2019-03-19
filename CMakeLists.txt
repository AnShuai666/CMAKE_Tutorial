CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
project(helloworld)
set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

#The version number
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)
set(Tutorial_VERSION_PATCH 0)
set(Tutorial_VERSION
        ${Tutorial_VERSION_MAJOR}.${Tutorial_VERSION_MINOR}.${Tutorial_VERSION_PATCH})

set(INSTALL_LIB_DIR lib CACHE PATH "Installation directory for libraries")
set(INSTALL_BIN_DIR bin CACHE PATH "Installation directories for executables")
set(INSTALL_INCLUDE_DIR include CACHE PATH "Installation directory for header files")

if (WIN32 AND NOT CYGWN)
        set(DEF_INSTALL_CMAKE_DIR CMake)
else()
        set(DEF_INSTALL_CMAKE_DIR lib/CMake/Tutorial)
endif ()
set(INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directories for cmake files")

foreach(p LIB BIN INCLUDE CMAKE)
        set(var INSTALL_${p}_DIR)
        if (NOT IS_ABSOLUTE "${${var}}")
                set(${var} "${CMAKE_INSTALL_PREFIX}/${${var}}")
        endif()
endforeach()




option(USE_MYMATH "Use tutorial provided math implementation" ON)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmakemodule)
include(checkFunctionExists)
check_function_exists(log HAVE_LOG)
check_function_exists(exp HAVE_EXP)

message(STATUS ${HAVE_LOG})
configure_file(
        "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
        "${PROJECT_SOURCE_DIR}/include/TutorialConfig.h"
        )

message(${USE_MYMATH})
if (USE_MYMATH)
        message("use the tutorial provided math library")
        add_subdirectory(src)
        set(EXTRA_LIBS ${EXTRA_LIBS} mysqrt)
endif ()

#add_subdirectory(include)
add_subdirectory(src_bin)

export(TARGETS mysqrt hello FILE "${PROJECT_SOURCE_DIR}/FooBarTargets.cmake")

export(PACKAGE FooBar)

#file(RELATIVE_PATH REL_INCLUDE_DIR
#        "INSTALL_CMAKE_FDIR" "${INSTALL_INCLUDE_DIR}")

set(CONF_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}" "${PROJECT_BINARY_DIR}")
configure_file(CmakeTutorialConfig.cmake.in
        "${PROJECT_SOURCE_DIR}/share/CmakeTutorialConfig.cmake" @ONLY)

configure_file(CmakeTutorialConfigVersion.cmake.in
        "${PROJECT_SOURCE_DIR}/share/CmakeTutorialConfigVersion.cmake" @ONLY)

#build a CPack driven installer package
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE
        "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")

include(CPack)