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

#add_subdirectory(include)``
add_subdirectory(src_bin)

#do test
include(CTest)
#enable_testing()

#does the application run?
add_test(TutorialRun tutorial 25)
add_test(TutorialUsage tutorial)
set_tests_properties(TutorialUsage PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number")
add_test(tutorialComp25 tutorial 25)
set_tests_properties(tutorialComp25 PROPERTIES PASS_REGULAR_EXPRESSION "25 is 5")

macro(do_test arg result)
        add_test(TutorialComp${arg} tutorial ${arg})
        set_tests_properties(TutorialComp${arg} PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro(do_test)

do_test(9 "9 is 3")
do_test(0 "0 is 0")
do_test(-25 "-25 is 0")