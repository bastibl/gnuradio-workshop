INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_STDOUT stdout)

FIND_PATH(
    STDOUT_INCLUDE_DIRS
    NAMES stdout/api.h
    HINTS $ENV{STDOUT_DIR}/include
        ${PC_STDOUT_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    STDOUT_LIBRARIES
    NAMES gnuradio-stdout
    HINTS $ENV{STDOUT_DIR}/lib
        ${PC_STDOUT_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(STDOUT DEFAULT_MSG STDOUT_LIBRARIES STDOUT_INCLUDE_DIRS)
MARK_AS_ADVANCED(STDOUT_LIBRARIES STDOUT_INCLUDE_DIRS)

