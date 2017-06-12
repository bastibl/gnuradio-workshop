INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_WORKSHOP workshop)

FIND_PATH(
    WORKSHOP_INCLUDE_DIRS
    NAMES workshop/api.h
    HINTS $ENV{WORKSHOP_DIR}/include
        ${PC_WORKSHOP_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    WORKSHOP_LIBRARIES
    NAMES gnuradio-workshop
    HINTS $ENV{WORKSHOP_DIR}/lib
        ${PC_WORKSHOP_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(WORKSHOP DEFAULT_MSG WORKSHOP_LIBRARIES WORKSHOP_INCLUDE_DIRS)
MARK_AS_ADVANCED(WORKSHOP_LIBRARIES WORKSHOP_INCLUDE_DIRS)

