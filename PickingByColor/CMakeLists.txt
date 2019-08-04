cmake_minimum_required(VERSION 3.0)
set( CMAKE_VERBOSE_MAKEFILE ON )

project(PickingByColor)

get_filename_component( CINDER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../Cinder" ABSOLUTE )
get_filename_component( APP_PATH "${CMAKE_CURRENT_SOURCE_DIR}/" ABSOLUTE )
file(GLOB_RECURSE SRC_FILES ${APP_PATH}/src/*.cpp)
#aux_source_directory(./src ${SRC_FILES})
include( "${CINDER_PATH}/proj/cmake/modules/cinderMakeApp.cmake" )
#set(IrrKlang_LIBRARIES ${APP_PATH})
#add_library(IrrKlang)
#check_library_exists(IrrKlang "/usr/lib" HAVE_IRRKLANG)
#if(HAVE_IRRKLANG)
SET(CMAKE_CXX_STANDARD_LIBRARIES  "${CMAKE_CXX_STANDARD_LIBRARIES} -lIrrKlang")
#endif()
ci_make_app(
	APP_NAME	"PickingByColor"
	CINDER_PATH ${CINDER_PATH}
	#SOURCES		${APP_PATH}/src/toolsApp.cpp
	SOURCES		${APP_PATH}/src/PickingByColorApp.cpp
	SOURCES		${APP_PATH}/../TextRendering/include/text/FontStore.cpp
	SOURCES		${APP_PATH}/../TextRendering/include/text/Text.cpp
	SOURCES		${APP_PATH}/../TextRendering/include/text/TextBox.cpp
	SOURCES		${APP_PATH}/../TextRendering/include/text/TextLabels.cpp
	SOURCES		${APP_PATH}/../TextRendering/include/text/Font.cpp
    INCLUDES    ${APP_PATH}/include
    INCLUDES    ${APP_PATH}/src
    INCLUDES    ${APP_PATH}/../All/common
    INCLUDES 	${APP_PATH}/../TextRendering/include
    INCLUDES 	${APP_PATH}/../TextRendering/include/text
    INCLUDES 	${APP_PATH}/../tools/irrKlang/include

)
