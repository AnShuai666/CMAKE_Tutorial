#project(helloworld)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

include_directories(../include)

set(HEADERS 
	../include/hello.h
	)

set(SOURCE_FILES 
	hello.cpp	
	)

set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
add_library(hello SHARED ${HEADERS} ${SOURCE_FILES})

