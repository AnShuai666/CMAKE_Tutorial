CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
project(helloworld)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

add_subdirectory(src)
#add_subdirectory(include)
add_subdirectory(src_bin)
