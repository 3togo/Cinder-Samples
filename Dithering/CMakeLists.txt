cmake_minimum_required( VERSION 3.0 FATAL_ERROR )
set( CMAKE_VERBOSE_MAKEFILE ON )
#set(__LINUX__)
#set( CINDER_LINUX TRUE )   #not a must

project( DisplayShift )

#get_filename_component( CINDER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../../Cinder-android" ABSOLUTE )

#include( "${CINDER_PATH}/proj/cmake/modules/cinderMakeApp.cmake" )
#include( "${CINDER_PATH}/proj/cmake/platform_linux.cmake" )


#get_filename_component( CINDER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../Cinder-linux" ABSOLUTE )
get_filename_component( APP_PATH "${CMAKE_CURRENT_SOURCE_DIR}/" ABSOLUTE )

include( "${CINDER_PATH}/proj/cmake/modules/cinderMakeApp.cmake" )

ci_make_app(
	APP_NAME	"Dithering"
	SOURCES		${APP_PATH}/src/DitheringApp.cpp
    CINDER_PATH ${CINDER_PATH}
    INCLUDES    ${APP_PATH}/include
)
