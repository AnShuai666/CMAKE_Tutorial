#project(helloworld)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

include_directories(../include)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

add_executable(main main.cpp)

target_link_libraries(main hello)
