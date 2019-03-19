set(CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS "-fPIC")

set(CMAKE_BUILD_TYPE "Debug")

include_directories(../include)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
add_executable(MakeTable MakeTable.cpp)

add_custom_command(
		OUTPUT ${PROJECT_SOURCE_DIR}/include/Table.h
		COMMAND ${PROJECT_SOURCE_DIR}/bin/MakeTable ${PROJECT_SOURCE_DIR}/include/Table.h
		DEPENDS ${PROJECT_SOURCE_DIR}/bin/MakeTable
)

set(HEADERS_HELLO
		../include/hello.h
	)

set(SOURCE_FILES_HELLO
	hello.cpp
	)

set(HEADERS_MYMATH
		../include/mysqrt.h
		)

set(SOURCE_FILES_MYMATH
		mysqrt.cpp
		)


set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
add_library(hello SHARED ${HEADERS_HELLO} ${SOURCE_FILES_HELLO})

add_library(mysqrt SHARED ${HEADERS_MYMATH} ${SOURCE_FILES_MYMATH})

install(TARGETS hello DESTINATION lib)
install(TARGETS mysqrt DESTINATION lib)

install(FILES ../include/hello.h DESTINATION include)
install(FILES ../include/mysqrt.h DESTINATION include)



