include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  QT
#################
set(CONAN_QT_ROOT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f")
set(CONAN_INCLUDE_DIRS_QT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/mkspecs/macx-clang"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtNetwork"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtSql"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtTest"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtPrintSupport"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtOpenGLWidgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtWidgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtOpenGL"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtGui"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtConcurrent"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtXml"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtCore")
set(CONAN_LIB_DIRS_QT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/plugins/platforms"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/plugins/sqldrivers")
set(CONAN_BIN_DIRS_QT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/bin")
set(CONAN_RES_DIRS_QT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res")
set(CONAN_SRC_DIRS_QT )
set(CONAN_BUILD_DIRS_QT "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Widgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Gui"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Core"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6")
set(CONAN_FRAMEWORK_DIRS_QT )
set(CONAN_LIBS_QT Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6Concurrent Qt6Xml Qt6Core)
set(CONAN_PKG_LIBS_QT Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6Concurrent Qt6Xml Qt6Core)
set(CONAN_SYSTEM_LIBS_QT )
set(CONAN_FRAMEWORKS_QT AppKit Carbon CoreServices CoreVideo IOKit IOSurface Metal QuartzCore)
set(CONAN_FRAMEWORKS_FOUND_QT "")  # Will be filled later
set(CONAN_DEFINES_QT "-DQT_NETWORK_LIB"
			"-DQT_SQL_LIB"
			"-DQT_TEST_LIB"
			"-DQT_PRINTSUPPORT_LIB"
			"-DQT_OPENGLWIDGETS_LIB"
			"-DQT_WIDGETS_LIB"
			"-DQT_OPENGL_LIB"
			"-DQT_GUI_LIB"
			"-DQT_CONCURRENT_LIB"
			"-DQT_XML_LIB"
			"-DQT_CORE_LIB")
set(CONAN_BUILD_MODULES_PATHS_QT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_QT "QT_NETWORK_LIB"
			"QT_SQL_LIB"
			"QT_TEST_LIB"
			"QT_PRINTSUPPORT_LIB"
			"QT_OPENGLWIDGETS_LIB"
			"QT_WIDGETS_LIB"
			"QT_OPENGL_LIB"
			"QT_GUI_LIB"
			"QT_CONCURRENT_LIB"
			"QT_XML_LIB"
			"QT_CORE_LIB")

set(CONAN_C_FLAGS_QT "")
set(CONAN_CXX_FLAGS_QT "-fPIC")
set(CONAN_SHARED_LINKER_FLAGS_QT "")
set(CONAN_EXE_LINKER_FLAGS_QT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_QT_LIST "")
set(CONAN_CXX_FLAGS_QT_LIST "-fPIC")
set(CONAN_SHARED_LINKER_FLAGS_QT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_QT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_QT "${CONAN_FRAMEWORKS_QT}" "_QT" "")
# Append to aggregated values variable
set(CONAN_LIBS_QT ${CONAN_PKG_LIBS_QT} ${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT})


#################
###  PORTAUDIO
#################
set(CONAN_PORTAUDIO_ROOT "/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb")
set(CONAN_INCLUDE_DIRS_PORTAUDIO "/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/include")
set(CONAN_LIB_DIRS_PORTAUDIO "/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/lib")
set(CONAN_BIN_DIRS_PORTAUDIO )
set(CONAN_RES_DIRS_PORTAUDIO )
set(CONAN_SRC_DIRS_PORTAUDIO )
set(CONAN_BUILD_DIRS_PORTAUDIO "/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/")
set(CONAN_FRAMEWORK_DIRS_PORTAUDIO )
set(CONAN_LIBS_PORTAUDIO portaudio)
set(CONAN_PKG_LIBS_PORTAUDIO portaudio)
set(CONAN_SYSTEM_LIBS_PORTAUDIO )
set(CONAN_FRAMEWORKS_PORTAUDIO CoreAudio AudioToolbox AudioUnit CoreServices Carbon)
set(CONAN_FRAMEWORKS_FOUND_PORTAUDIO "")  # Will be filled later
set(CONAN_DEFINES_PORTAUDIO )
set(CONAN_BUILD_MODULES_PATHS_PORTAUDIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PORTAUDIO )

set(CONAN_C_FLAGS_PORTAUDIO "")
set(CONAN_CXX_FLAGS_PORTAUDIO "")
set(CONAN_SHARED_LINKER_FLAGS_PORTAUDIO "")
set(CONAN_EXE_LINKER_FLAGS_PORTAUDIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PORTAUDIO_LIST "")
set(CONAN_CXX_FLAGS_PORTAUDIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PORTAUDIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PORTAUDIO "${CONAN_FRAMEWORKS_PORTAUDIO}" "_PORTAUDIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_PORTAUDIO ${CONAN_PKG_LIBS_PORTAUDIO} ${CONAN_SYSTEM_LIBS_PORTAUDIO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO})


#################
###  OPUS
#################
set(CONAN_OPUS_ROOT "/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_OPUS "/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/opus")
set(CONAN_LIB_DIRS_OPUS "/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_OPUS )
set(CONAN_RES_DIRS_OPUS )
set(CONAN_SRC_DIRS_OPUS )
set(CONAN_BUILD_DIRS_OPUS "/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_OPUS )
set(CONAN_LIBS_OPUS opus)
set(CONAN_PKG_LIBS_OPUS opus)
set(CONAN_SYSTEM_LIBS_OPUS )
set(CONAN_FRAMEWORKS_OPUS )
set(CONAN_FRAMEWORKS_FOUND_OPUS "")  # Will be filled later
set(CONAN_DEFINES_OPUS )
set(CONAN_BUILD_MODULES_PATHS_OPUS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPUS )

set(CONAN_C_FLAGS_OPUS "")
set(CONAN_CXX_FLAGS_OPUS "")
set(CONAN_SHARED_LINKER_FLAGS_OPUS "")
set(CONAN_EXE_LINKER_FLAGS_OPUS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPUS_LIST "")
set(CONAN_CXX_FLAGS_OPUS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPUS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPUS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPUS "${CONAN_FRAMEWORKS_OPUS}" "_OPUS" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPUS ${CONAN_PKG_LIBS_OPUS} ${CONAN_SYSTEM_LIBS_OPUS} ${CONAN_FRAMEWORKS_FOUND_OPUS})


#################
###  ASIO
#################
set(CONAN_ASIO_ROOT "/Users/gabrieldetaxis/.conan/data/asio/1.22.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_ASIO "/Users/gabrieldetaxis/.conan/data/asio/1.22.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_ASIO )
set(CONAN_BIN_DIRS_ASIO )
set(CONAN_RES_DIRS_ASIO )
set(CONAN_SRC_DIRS_ASIO )
set(CONAN_BUILD_DIRS_ASIO "/Users/gabrieldetaxis/.conan/data/asio/1.22.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_ASIO )
set(CONAN_LIBS_ASIO )
set(CONAN_PKG_LIBS_ASIO )
set(CONAN_SYSTEM_LIBS_ASIO )
set(CONAN_FRAMEWORKS_ASIO )
set(CONAN_FRAMEWORKS_FOUND_ASIO "")  # Will be filled later
set(CONAN_DEFINES_ASIO "-DASIO_STANDALONE")
set(CONAN_BUILD_MODULES_PATHS_ASIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ASIO "ASIO_STANDALONE")

set(CONAN_C_FLAGS_ASIO "")
set(CONAN_CXX_FLAGS_ASIO "")
set(CONAN_SHARED_LINKER_FLAGS_ASIO "")
set(CONAN_EXE_LINKER_FLAGS_ASIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ASIO_LIST "")
set(CONAN_CXX_FLAGS_ASIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ASIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ASIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ASIO "${CONAN_FRAMEWORKS_ASIO}" "_ASIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_ASIO ${CONAN_PKG_LIBS_ASIO} ${CONAN_SYSTEM_LIBS_ASIO} ${CONAN_FRAMEWORKS_FOUND_ASIO})


#################
###  SQLITE_ORM
#################
set(CONAN_SQLITE_ORM_ROOT "/Users/gabrieldetaxis/.conan/data/sqlite_orm/1.6/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_SQLITE_ORM "/Users/gabrieldetaxis/.conan/data/sqlite_orm/1.6/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_SQLITE_ORM )
set(CONAN_BIN_DIRS_SQLITE_ORM )
set(CONAN_RES_DIRS_SQLITE_ORM )
set(CONAN_SRC_DIRS_SQLITE_ORM )
set(CONAN_BUILD_DIRS_SQLITE_ORM "/Users/gabrieldetaxis/.conan/data/sqlite_orm/1.6/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_SQLITE_ORM )
set(CONAN_LIBS_SQLITE_ORM )
set(CONAN_PKG_LIBS_SQLITE_ORM )
set(CONAN_SYSTEM_LIBS_SQLITE_ORM )
set(CONAN_FRAMEWORKS_SQLITE_ORM )
set(CONAN_FRAMEWORKS_FOUND_SQLITE_ORM "")  # Will be filled later
set(CONAN_DEFINES_SQLITE_ORM )
set(CONAN_BUILD_MODULES_PATHS_SQLITE_ORM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE_ORM )

set(CONAN_C_FLAGS_SQLITE_ORM "")
set(CONAN_CXX_FLAGS_SQLITE_ORM "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE_ORM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE_ORM_LIST "")
set(CONAN_CXX_FLAGS_SQLITE_ORM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE_ORM "${CONAN_FRAMEWORKS_SQLITE_ORM}" "_SQLITE_ORM" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE_ORM ${CONAN_PKG_LIBS_SQLITE_ORM} ${CONAN_SYSTEM_LIBS_SQLITE_ORM} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM})


#################
###  OPENSSL
#################
set(CONAN_OPENSSL_ROOT "/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_OPENSSL "/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_OPENSSL "/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_OPENSSL "/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin")
set(CONAN_RES_DIRS_OPENSSL )
set(CONAN_SRC_DIRS_OPENSSL )
set(CONAN_BUILD_DIRS_OPENSSL "/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_OPENSSL )
set(CONAN_LIBS_OPENSSL ssl crypto)
set(CONAN_PKG_LIBS_OPENSSL ssl crypto)
set(CONAN_SYSTEM_LIBS_OPENSSL )
set(CONAN_FRAMEWORKS_OPENSSL )
set(CONAN_FRAMEWORKS_FOUND_OPENSSL "")  # Will be filled later
set(CONAN_DEFINES_OPENSSL )
set(CONAN_BUILD_MODULES_PATHS_OPENSSL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENSSL )

set(CONAN_C_FLAGS_OPENSSL "")
set(CONAN_CXX_FLAGS_OPENSSL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENSSL_LIST "")
set(CONAN_CXX_FLAGS_OPENSSL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENSSL "${CONAN_FRAMEWORKS_OPENSSL}" "_OPENSSL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENSSL ${CONAN_PKG_LIBS_OPENSSL} ${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL})


#################
###  PCRE2
#################
set(CONAN_PCRE2_ROOT "/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af")
set(CONAN_INCLUDE_DIRS_PCRE2 "/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/include")
set(CONAN_LIB_DIRS_PCRE2 "/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/lib")
set(CONAN_BIN_DIRS_PCRE2 "/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/bin")
set(CONAN_RES_DIRS_PCRE2 )
set(CONAN_SRC_DIRS_PCRE2 )
set(CONAN_BUILD_DIRS_PCRE2 "/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/")
set(CONAN_FRAMEWORK_DIRS_PCRE2 )
set(CONAN_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_PKG_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_SYSTEM_LIBS_PCRE2 )
set(CONAN_FRAMEWORKS_PCRE2 )
set(CONAN_FRAMEWORKS_FOUND_PCRE2 "")  # Will be filled later
set(CONAN_DEFINES_PCRE2 "-DPCRE2_STATIC")
set(CONAN_BUILD_MODULES_PATHS_PCRE2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE2 "PCRE2_STATIC")

set(CONAN_C_FLAGS_PCRE2 "")
set(CONAN_CXX_FLAGS_PCRE2 "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2 "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE2_LIST "")
set(CONAN_CXX_FLAGS_PCRE2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE2 "${CONAN_FRAMEWORKS_PCRE2}" "_PCRE2" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE2 ${CONAN_PKG_LIBS_PCRE2} ${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2})


#################
###  DOUBLE-CONVERSION
#################
set(CONAN_DOUBLE-CONVERSION_ROOT "/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d")
set(CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION "/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/include")
set(CONAN_LIB_DIRS_DOUBLE-CONVERSION "/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/lib")
set(CONAN_BIN_DIRS_DOUBLE-CONVERSION )
set(CONAN_RES_DIRS_DOUBLE-CONVERSION )
set(CONAN_SRC_DIRS_DOUBLE-CONVERSION )
set(CONAN_BUILD_DIRS_DOUBLE-CONVERSION "/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/")
set(CONAN_FRAMEWORK_DIRS_DOUBLE-CONVERSION )
set(CONAN_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_PKG_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "")  # Will be filled later
set(CONAN_DEFINES_DOUBLE-CONVERSION )
set(CONAN_BUILD_MODULES_PATHS_DOUBLE-CONVERSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION )

set(CONAN_C_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "${CONAN_FRAMEWORKS_DOUBLE-CONVERSION}" "_DOUBLE-CONVERSION" "")
# Append to aggregated values variable
set(CONAN_LIBS_DOUBLE-CONVERSION ${CONAN_PKG_LIBS_DOUBLE-CONVERSION} ${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION})


#################
###  HARFBUZZ
#################
set(CONAN_HARFBUZZ_ROOT "/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3")
set(CONAN_INCLUDE_DIRS_HARFBUZZ "/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/include"
			"/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/include/harfbuzz")
set(CONAN_LIB_DIRS_HARFBUZZ "/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/lib")
set(CONAN_BIN_DIRS_HARFBUZZ )
set(CONAN_RES_DIRS_HARFBUZZ )
set(CONAN_SRC_DIRS_HARFBUZZ )
set(CONAN_BUILD_DIRS_HARFBUZZ "/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/")
set(CONAN_FRAMEWORK_DIRS_HARFBUZZ )
set(CONAN_LIBS_HARFBUZZ harfbuzz)
set(CONAN_PKG_LIBS_HARFBUZZ harfbuzz)
set(CONAN_SYSTEM_LIBS_HARFBUZZ c++)
set(CONAN_FRAMEWORKS_HARFBUZZ CoreFoundation CoreGraphics CoreText)
set(CONAN_FRAMEWORKS_FOUND_HARFBUZZ "")  # Will be filled later
set(CONAN_DEFINES_HARFBUZZ )
set(CONAN_BUILD_MODULES_PATHS_HARFBUZZ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_HARFBUZZ )

set(CONAN_C_FLAGS_HARFBUZZ "")
set(CONAN_CXX_FLAGS_HARFBUZZ "")
set(CONAN_SHARED_LINKER_FLAGS_HARFBUZZ "")
set(CONAN_EXE_LINKER_FLAGS_HARFBUZZ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_HARFBUZZ_LIST "")
set(CONAN_CXX_FLAGS_HARFBUZZ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_HARFBUZZ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_HARFBUZZ "${CONAN_FRAMEWORKS_HARFBUZZ}" "_HARFBUZZ" "")
# Append to aggregated values variable
set(CONAN_LIBS_HARFBUZZ ${CONAN_PKG_LIBS_HARFBUZZ} ${CONAN_SYSTEM_LIBS_HARFBUZZ} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ})


#################
###  SQLITE3
#################
set(CONAN_SQLITE3_ROOT "/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac")
set(CONAN_INCLUDE_DIRS_SQLITE3 "/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/include")
set(CONAN_LIB_DIRS_SQLITE3 "/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/lib")
set(CONAN_BIN_DIRS_SQLITE3 "/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/bin")
set(CONAN_RES_DIRS_SQLITE3 )
set(CONAN_SRC_DIRS_SQLITE3 )
set(CONAN_BUILD_DIRS_SQLITE3 "/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_SQLITE3 )
set(CONAN_LIBS_SQLITE3 sqlite3)
set(CONAN_PKG_LIBS_SQLITE3 sqlite3)
set(CONAN_SYSTEM_LIBS_SQLITE3 )
set(CONAN_FRAMEWORKS_SQLITE3 )
set(CONAN_FRAMEWORKS_FOUND_SQLITE3 "")  # Will be filled later
set(CONAN_DEFINES_SQLITE3 )
set(CONAN_BUILD_MODULES_PATHS_SQLITE3 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE3 )

set(CONAN_C_FLAGS_SQLITE3 "")
set(CONAN_CXX_FLAGS_SQLITE3 "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3 "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE3_LIST "")
set(CONAN_CXX_FLAGS_SQLITE3_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE3 "${CONAN_FRAMEWORKS_SQLITE3}" "_SQLITE3" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE3 ${CONAN_PKG_LIBS_SQLITE3} ${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3})


#################
###  LIBPQ
#################
set(CONAN_LIBPQ_ROOT "/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBPQ "/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBPQ "/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBPQ "/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin")
set(CONAN_RES_DIRS_LIBPQ )
set(CONAN_SRC_DIRS_LIBPQ )
set(CONAN_BUILD_DIRS_LIBPQ "/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBPQ )
set(CONAN_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_PKG_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_SYSTEM_LIBS_LIBPQ )
set(CONAN_FRAMEWORKS_LIBPQ )
set(CONAN_FRAMEWORKS_FOUND_LIBPQ "")  # Will be filled later
set(CONAN_DEFINES_LIBPQ )
set(CONAN_BUILD_MODULES_PATHS_LIBPQ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPQ )

set(CONAN_C_FLAGS_LIBPQ "")
set(CONAN_CXX_FLAGS_LIBPQ "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPQ_LIST "")
set(CONAN_CXX_FLAGS_LIBPQ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPQ "${CONAN_FRAMEWORKS_LIBPQ}" "_LIBPQ" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPQ ${CONAN_PKG_LIBS_LIBPQ} ${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ})


#################
###  ODBC
#################
set(CONAN_ODBC_ROOT "/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036")
set(CONAN_INCLUDE_DIRS_ODBC "/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/include")
set(CONAN_LIB_DIRS_ODBC "/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/lib")
set(CONAN_BIN_DIRS_ODBC "/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/bin")
set(CONAN_RES_DIRS_ODBC )
set(CONAN_SRC_DIRS_ODBC )
set(CONAN_BUILD_DIRS_ODBC "/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/")
set(CONAN_FRAMEWORK_DIRS_ODBC )
set(CONAN_LIBS_ODBC odbc odbcinst odbccr ltdl)
set(CONAN_PKG_LIBS_ODBC odbc odbcinst odbccr ltdl)
set(CONAN_SYSTEM_LIBS_ODBC )
set(CONAN_FRAMEWORKS_ODBC )
set(CONAN_FRAMEWORKS_FOUND_ODBC "")  # Will be filled later
set(CONAN_DEFINES_ODBC )
set(CONAN_BUILD_MODULES_PATHS_ODBC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ODBC )

set(CONAN_C_FLAGS_ODBC "")
set(CONAN_CXX_FLAGS_ODBC "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC "")
set(CONAN_EXE_LINKER_FLAGS_ODBC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ODBC_LIST "")
set(CONAN_CXX_FLAGS_ODBC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ODBC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ODBC "${CONAN_FRAMEWORKS_ODBC}" "_ODBC" "")
# Append to aggregated values variable
set(CONAN_LIBS_ODBC ${CONAN_PKG_LIBS_ODBC} ${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC})


#################
###  OPENGL
#################
set(CONAN_OPENGL_ROOT "/Users/gabrieldetaxis/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_OPENGL )
set(CONAN_LIB_DIRS_OPENGL )
set(CONAN_BIN_DIRS_OPENGL )
set(CONAN_RES_DIRS_OPENGL )
set(CONAN_SRC_DIRS_OPENGL )
set(CONAN_BUILD_DIRS_OPENGL "/Users/gabrieldetaxis/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_OPENGL )
set(CONAN_LIBS_OPENGL )
set(CONAN_PKG_LIBS_OPENGL )
set(CONAN_SYSTEM_LIBS_OPENGL )
set(CONAN_FRAMEWORKS_OPENGL OpenGL)
set(CONAN_FRAMEWORKS_FOUND_OPENGL "")  # Will be filled later
set(CONAN_DEFINES_OPENGL "-DGL_SILENCE_DEPRECATION=1")
set(CONAN_BUILD_MODULES_PATHS_OPENGL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENGL "GL_SILENCE_DEPRECATION=1")

set(CONAN_C_FLAGS_OPENGL "")
set(CONAN_CXX_FLAGS_OPENGL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENGL_LIST "")
set(CONAN_CXX_FLAGS_OPENGL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENGL "${CONAN_FRAMEWORKS_OPENGL}" "_OPENGL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENGL ${CONAN_PKG_LIBS_OPENGL} ${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL})


#################
###  FREETYPE
#################
set(CONAN_FREETYPE_ROOT "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede")
set(CONAN_INCLUDE_DIRS_FREETYPE "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/include"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/include/freetype2")
set(CONAN_LIB_DIRS_FREETYPE "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/lib")
set(CONAN_BIN_DIRS_FREETYPE "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/bin")
set(CONAN_RES_DIRS_FREETYPE "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/res")
set(CONAN_SRC_DIRS_FREETYPE )
set(CONAN_BUILD_DIRS_FREETYPE "/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_FREETYPE )
set(CONAN_LIBS_FREETYPE freetype)
set(CONAN_PKG_LIBS_FREETYPE freetype)
set(CONAN_SYSTEM_LIBS_FREETYPE )
set(CONAN_FRAMEWORKS_FREETYPE )
set(CONAN_FRAMEWORKS_FOUND_FREETYPE "")  # Will be filled later
set(CONAN_DEFINES_FREETYPE )
set(CONAN_BUILD_MODULES_PATHS_FREETYPE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FREETYPE )

set(CONAN_C_FLAGS_FREETYPE "")
set(CONAN_CXX_FLAGS_FREETYPE "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FREETYPE_LIST "")
set(CONAN_CXX_FLAGS_FREETYPE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FREETYPE "${CONAN_FRAMEWORKS_FREETYPE}" "_FREETYPE" "")
# Append to aggregated values variable
set(CONAN_LIBS_FREETYPE ${CONAN_PKG_LIBS_FREETYPE} ${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE})


#################
###  GLIB
#################
set(CONAN_GLIB_ROOT "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03")
set(CONAN_INCLUDE_DIRS_GLIB "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include/gio-unix-2.0"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include/glib-2.0"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/lib/glib-2.0/include")
set(CONAN_LIB_DIRS_GLIB "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/lib")
set(CONAN_BIN_DIRS_GLIB "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/bin")
set(CONAN_RES_DIRS_GLIB "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/res")
set(CONAN_SRC_DIRS_GLIB )
set(CONAN_BUILD_DIRS_GLIB "/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/")
set(CONAN_FRAMEWORK_DIRS_GLIB )
set(CONAN_LIBS_GLIB gthread-2.0 gio-2.0 gmodule-2.0 gobject-2.0 glib-2.0)
set(CONAN_PKG_LIBS_GLIB gthread-2.0 gio-2.0 gmodule-2.0 gobject-2.0 glib-2.0)
set(CONAN_SYSTEM_LIBS_GLIB resolv)
set(CONAN_FRAMEWORKS_GLIB AppKit Foundation CoreServices CoreFoundation)
set(CONAN_FRAMEWORKS_FOUND_GLIB "")  # Will be filled later
set(CONAN_DEFINES_GLIB )
set(CONAN_BUILD_MODULES_PATHS_GLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLIB )

set(CONAN_C_FLAGS_GLIB "")
set(CONAN_CXX_FLAGS_GLIB "")
set(CONAN_SHARED_LINKER_FLAGS_GLIB "")
set(CONAN_EXE_LINKER_FLAGS_GLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLIB_LIST "")
set(CONAN_CXX_FLAGS_GLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLIB "${CONAN_FRAMEWORKS_GLIB}" "_GLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLIB ${CONAN_PKG_LIBS_GLIB} ${CONAN_SYSTEM_LIBS_GLIB} ${CONAN_FRAMEWORKS_FOUND_GLIB})


#################
###  LIBPNG
#################
set(CONAN_LIBPNG_ROOT "/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32")
set(CONAN_INCLUDE_DIRS_LIBPNG "/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/include")
set(CONAN_LIB_DIRS_LIBPNG "/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/lib")
set(CONAN_BIN_DIRS_LIBPNG "/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/bin")
set(CONAN_RES_DIRS_LIBPNG )
set(CONAN_SRC_DIRS_LIBPNG )
set(CONAN_BUILD_DIRS_LIBPNG "/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/")
set(CONAN_FRAMEWORK_DIRS_LIBPNG )
set(CONAN_LIBS_LIBPNG png16)
set(CONAN_PKG_LIBS_LIBPNG png16)
set(CONAN_SYSTEM_LIBS_LIBPNG )
set(CONAN_FRAMEWORKS_LIBPNG )
set(CONAN_FRAMEWORKS_FOUND_LIBPNG "")  # Will be filled later
set(CONAN_DEFINES_LIBPNG )
set(CONAN_BUILD_MODULES_PATHS_LIBPNG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPNG )

set(CONAN_C_FLAGS_LIBPNG "")
set(CONAN_CXX_FLAGS_LIBPNG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPNG_LIST "")
set(CONAN_CXX_FLAGS_LIBPNG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPNG "${CONAN_FRAMEWORKS_LIBPNG}" "_LIBPNG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})


#################
###  BROTLI
#################
set(CONAN_BROTLI_ROOT "/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_BROTLI "/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/brotli")
set(CONAN_LIB_DIRS_BROTLI "/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_BROTLI )
set(CONAN_RES_DIRS_BROTLI )
set(CONAN_SRC_DIRS_BROTLI )
set(CONAN_BUILD_DIRS_BROTLI "/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_BROTLI )
set(CONAN_LIBS_BROTLI brotlidec-static brotlienc-static brotlicommon-static)
set(CONAN_PKG_LIBS_BROTLI brotlidec-static brotlienc-static brotlicommon-static)
set(CONAN_SYSTEM_LIBS_BROTLI )
set(CONAN_FRAMEWORKS_BROTLI )
set(CONAN_FRAMEWORKS_FOUND_BROTLI "")  # Will be filled later
set(CONAN_DEFINES_BROTLI )
set(CONAN_BUILD_MODULES_PATHS_BROTLI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BROTLI )

set(CONAN_C_FLAGS_BROTLI "")
set(CONAN_CXX_FLAGS_BROTLI "")
set(CONAN_SHARED_LINKER_FLAGS_BROTLI "")
set(CONAN_EXE_LINKER_FLAGS_BROTLI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BROTLI_LIST "")
set(CONAN_CXX_FLAGS_BROTLI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BROTLI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BROTLI "${CONAN_FRAMEWORKS_BROTLI}" "_BROTLI" "")
# Append to aggregated values variable
set(CONAN_LIBS_BROTLI ${CONAN_PKG_LIBS_BROTLI} ${CONAN_SYSTEM_LIBS_BROTLI} ${CONAN_FRAMEWORKS_FOUND_BROTLI})


#################
###  LIBFFI
#################
set(CONAN_LIBFFI_ROOT "/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBFFI "/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBFFI "/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBFFI )
set(CONAN_RES_DIRS_LIBFFI )
set(CONAN_SRC_DIRS_LIBFFI )
set(CONAN_BUILD_DIRS_LIBFFI "/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBFFI )
set(CONAN_LIBS_LIBFFI ffi)
set(CONAN_PKG_LIBS_LIBFFI ffi)
set(CONAN_SYSTEM_LIBS_LIBFFI )
set(CONAN_FRAMEWORKS_LIBFFI )
set(CONAN_FRAMEWORKS_FOUND_LIBFFI "")  # Will be filled later
set(CONAN_DEFINES_LIBFFI "-DFFI_BUILDING")
set(CONAN_BUILD_MODULES_PATHS_LIBFFI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBFFI "FFI_BUILDING")

set(CONAN_C_FLAGS_LIBFFI "")
set(CONAN_CXX_FLAGS_LIBFFI "")
set(CONAN_SHARED_LINKER_FLAGS_LIBFFI "")
set(CONAN_EXE_LINKER_FLAGS_LIBFFI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBFFI_LIST "")
set(CONAN_CXX_FLAGS_LIBFFI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBFFI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBFFI "${CONAN_FRAMEWORKS_LIBFFI}" "_LIBFFI" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBFFI ${CONAN_PKG_LIBS_LIBFFI} ${CONAN_SYSTEM_LIBS_LIBFFI} ${CONAN_FRAMEWORKS_FOUND_LIBFFI})


#################
###  PCRE
#################
set(CONAN_PCRE_ROOT "/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755")
set(CONAN_INCLUDE_DIRS_PCRE "/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/include")
set(CONAN_LIB_DIRS_PCRE "/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/lib")
set(CONAN_BIN_DIRS_PCRE "/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/bin")
set(CONAN_RES_DIRS_PCRE )
set(CONAN_SRC_DIRS_PCRE )
set(CONAN_BUILD_DIRS_PCRE "/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/")
set(CONAN_FRAMEWORK_DIRS_PCRE )
set(CONAN_LIBS_PCRE pcreposix pcre pcre16 pcre32)
set(CONAN_PKG_LIBS_PCRE pcreposix pcre pcre16 pcre32)
set(CONAN_SYSTEM_LIBS_PCRE )
set(CONAN_FRAMEWORKS_PCRE )
set(CONAN_FRAMEWORKS_FOUND_PCRE "")  # Will be filled later
set(CONAN_DEFINES_PCRE "-DPCRE_STATIC=1")
set(CONAN_BUILD_MODULES_PATHS_PCRE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE "PCRE_STATIC=1")

set(CONAN_C_FLAGS_PCRE "")
set(CONAN_CXX_FLAGS_PCRE "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE "")
set(CONAN_EXE_LINKER_FLAGS_PCRE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE_LIST "")
set(CONAN_CXX_FLAGS_PCRE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE "${CONAN_FRAMEWORKS_PCRE}" "_PCRE" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE ${CONAN_PKG_LIBS_PCRE} ${CONAN_SYSTEM_LIBS_PCRE} ${CONAN_FRAMEWORKS_FOUND_PCRE})


#################
###  LIBELF
#################
set(CONAN_LIBELF_ROOT "/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBELF "/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/libelf"
			"/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBELF "/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBELF )
set(CONAN_RES_DIRS_LIBELF )
set(CONAN_SRC_DIRS_LIBELF )
set(CONAN_BUILD_DIRS_LIBELF "/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBELF )
set(CONAN_LIBS_LIBELF elf)
set(CONAN_PKG_LIBS_LIBELF elf)
set(CONAN_SYSTEM_LIBS_LIBELF )
set(CONAN_FRAMEWORKS_LIBELF )
set(CONAN_FRAMEWORKS_FOUND_LIBELF "")  # Will be filled later
set(CONAN_DEFINES_LIBELF )
set(CONAN_BUILD_MODULES_PATHS_LIBELF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBELF )

set(CONAN_C_FLAGS_LIBELF "")
set(CONAN_CXX_FLAGS_LIBELF "")
set(CONAN_SHARED_LINKER_FLAGS_LIBELF "")
set(CONAN_EXE_LINKER_FLAGS_LIBELF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBELF_LIST "")
set(CONAN_CXX_FLAGS_LIBELF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBELF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBELF "${CONAN_FRAMEWORKS_LIBELF}" "_LIBELF" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBELF ${CONAN_PKG_LIBS_LIBELF} ${CONAN_SYSTEM_LIBS_LIBELF} ${CONAN_FRAMEWORKS_FOUND_LIBELF})


#################
###  LIBGETTEXT
#################
set(CONAN_LIBGETTEXT_ROOT "/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9")
set(CONAN_INCLUDE_DIRS_LIBGETTEXT "/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/include")
set(CONAN_LIB_DIRS_LIBGETTEXT "/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/lib")
set(CONAN_BIN_DIRS_LIBGETTEXT )
set(CONAN_RES_DIRS_LIBGETTEXT )
set(CONAN_SRC_DIRS_LIBGETTEXT )
set(CONAN_BUILD_DIRS_LIBGETTEXT "/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/")
set(CONAN_FRAMEWORK_DIRS_LIBGETTEXT )
set(CONAN_LIBS_LIBGETTEXT gnuintl)
set(CONAN_PKG_LIBS_LIBGETTEXT gnuintl)
set(CONAN_SYSTEM_LIBS_LIBGETTEXT )
set(CONAN_FRAMEWORKS_LIBGETTEXT CoreFoundation)
set(CONAN_FRAMEWORKS_FOUND_LIBGETTEXT "")  # Will be filled later
set(CONAN_DEFINES_LIBGETTEXT )
set(CONAN_BUILD_MODULES_PATHS_LIBGETTEXT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBGETTEXT )

set(CONAN_C_FLAGS_LIBGETTEXT "")
set(CONAN_CXX_FLAGS_LIBGETTEXT "")
set(CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT "")
set(CONAN_EXE_LINKER_FLAGS_LIBGETTEXT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBGETTEXT_LIST "")
set(CONAN_CXX_FLAGS_LIBGETTEXT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBGETTEXT "${CONAN_FRAMEWORKS_LIBGETTEXT}" "_LIBGETTEXT" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBGETTEXT ${CONAN_PKG_LIBS_LIBGETTEXT} ${CONAN_SYSTEM_LIBS_LIBGETTEXT} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_ZLIB "/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_ZLIB "/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507")
set(CONAN_INCLUDE_DIRS_BZIP2 "/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/include")
set(CONAN_LIB_DIRS_BZIP2 "/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib")
set(CONAN_BIN_DIRS_BZIP2 "/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


#################
###  LIBICONV
#################
set(CONAN_LIBICONV_ROOT "/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBICONV "/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBICONV "/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBICONV "/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin")
set(CONAN_RES_DIRS_LIBICONV )
set(CONAN_SRC_DIRS_LIBICONV )
set(CONAN_BUILD_DIRS_LIBICONV "/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBICONV )
set(CONAN_LIBS_LIBICONV iconv charset)
set(CONAN_PKG_LIBS_LIBICONV iconv charset)
set(CONAN_SYSTEM_LIBS_LIBICONV )
set(CONAN_FRAMEWORKS_LIBICONV )
set(CONAN_FRAMEWORKS_FOUND_LIBICONV "")  # Will be filled later
set(CONAN_DEFINES_LIBICONV )
set(CONAN_BUILD_MODULES_PATHS_LIBICONV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBICONV )

set(CONAN_C_FLAGS_LIBICONV "")
set(CONAN_CXX_FLAGS_LIBICONV "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBICONV_LIST "")
set(CONAN_CXX_FLAGS_LIBICONV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBICONV "${CONAN_FRAMEWORKS_LIBICONV}" "_LIBICONV" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBICONV ${CONAN_PKG_LIBS_LIBICONV} ${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "apple-clang")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libc++")
set(CONAN_SETTINGS_COMPILER_VERSION "13.0")
set(CONAN_SETTINGS_OS "Macos")
set(CONAN_SETTINGS_OS_BUILD "Macos")

set(CONAN_DEPENDENCIES qt portaudio opus asio sqlite_orm openssl pcre2 double-conversion harfbuzz sqlite3 libpq odbc opengl freetype glib libpng brotli libffi pcre libelf libgettext zlib bzip2 libiconv)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/mkspecs/macx-clang"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtNetwork"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtSql"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtTest"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtPrintSupport"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtOpenGLWidgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtWidgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtOpenGL"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtGui"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtConcurrent"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtXml"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/include/QtCore"
			"/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/include"
			"/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/opus"
			"/Users/gabrieldetaxis/.conan/data/asio/1.22.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/gabrieldetaxis/.conan/data/sqlite_orm/1.6/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/include"
			"/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/include"
			"/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/include"
			"/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/include/harfbuzz"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/include"
			"/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/include"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/include"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/include/freetype2"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include/gio-unix-2.0"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/include/glib-2.0"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/lib/glib-2.0/include"
			"/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/include"
			"/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/brotli"
			"/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/include"
			"/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include/libelf"
			"/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/include"
			"/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/include"
			"/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/plugins/platforms"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res/archdatadir/plugins/sqldrivers"
			"/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/lib"
			"/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/lib"
			"/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/lib"
			"/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/lib"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/lib"
			"/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/lib"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/lib"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/lib"
			"/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/lib"
			"/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/lib"
			"/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/lib"
			"/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib"
			"/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/bin"
			"/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin"
			"/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/bin"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/bin"
			"/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin"
			"/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/bin"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/bin"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/bin"
			"/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/bin"
			"/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/bin"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/bin"
			"/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/res"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/res"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6Concurrent Qt6Xml Qt6Core portaudio opus ssl crypto pcre2-posix pcre2-8 pcre2-16 pcre2-32 double-conversion harfbuzz sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib odbc odbcinst odbccr ltdl freetype gthread-2.0 gio-2.0 gmodule-2.0 gobject-2.0 glib-2.0 png16 brotlidec-static brotlienc-static brotlicommon-static ffi pcreposix pcre pcre16 pcre32 elf gnuintl z bz2 iconv charset ${CONAN_LIBS})
set(CONAN_PKG_LIBS Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6Concurrent Qt6Xml Qt6Core portaudio opus ssl crypto pcre2-posix pcre2-8 pcre2-16 pcre2-32 double-conversion harfbuzz sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib odbc odbcinst odbccr ltdl freetype gthread-2.0 gio-2.0 gmodule-2.0 gobject-2.0 glib-2.0 png16 brotlidec-static brotlienc-static brotlicommon-static ffi pcreposix pcre pcre16 pcre32 elf gnuintl z bz2 iconv charset ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS c++ resolv ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS CoreVideo IOKit IOSurface Metal QuartzCore CoreAudio AudioToolbox AudioUnit Carbon CoreGraphics CoreText OpenGL AppKit Foundation CoreServices CoreFoundation ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DPCRE_STATIC=1"
			"-DFFI_BUILDING"
			"-DGL_SILENCE_DEPRECATION=1"
			"-DPCRE2_STATIC"
			"-DASIO_STANDALONE"
			"-DQT_NETWORK_LIB"
			"-DQT_SQL_LIB"
			"-DQT_TEST_LIB"
			"-DQT_PRINTSUPPORT_LIB"
			"-DQT_OPENGLWIDGETS_LIB"
			"-DQT_WIDGETS_LIB"
			"-DQT_OPENGL_LIB"
			"-DQT_GUI_LIB"
			"-DQT_CONCURRENT_LIB"
			"-DQT_XML_LIB"
			"-DQT_CORE_LIB" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Widgets"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Gui"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6Core"
			"/Users/gabrieldetaxis/.conan/data/qt/6.2.3/_/_/package/5c3571ebb06853472a699b16cf9c8c127dea976f/lib/cmake/Qt6"
			"/Users/gabrieldetaxis/.conan/data/portaudio/19.7.0/bincrafters/stable/package/56f70d51690acb0f2dc150edb60c5aa7fae90bdb/"
			"/Users/gabrieldetaxis/.conan/data/opus/1.3.1/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/asio/1.22.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/gabrieldetaxis/.conan/data/sqlite_orm/1.6/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/gabrieldetaxis/.conan/data/openssl/1.1.1m/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/pcre2/10.37/_/_/package/821b78acf7d26281b12b22529d6ac5e59961c3af/"
			"/Users/gabrieldetaxis/.conan/data/double-conversion/3.2.0/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/"
			"/Users/gabrieldetaxis/.conan/data/harfbuzz/4.0.1/_/_/package/63cbb23fb88a41d66c0d0c46dcbe2ca503cfead3/"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/"
			"/Users/gabrieldetaxis/.conan/data/sqlite3/3.36.0/_/_/package/105a8d60f8f74509af4922daa14b32b1e2ace8ac/lib/cmake"
			"/Users/gabrieldetaxis/.conan/data/libpq/13.6/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/odbc/2.3.9/_/_/package/a378317c51ebc76840b3893182ac29a3ab19e036/"
			"/Users/gabrieldetaxis/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/"
			"/Users/gabrieldetaxis/.conan/data/freetype/2.11.1/_/_/package/926ec86ec76de2940f5d319a90b247e8ad515ede/lib/cmake"
			"/Users/gabrieldetaxis/.conan/data/glib/2.71.3/_/_/package/e43ee50087f3fa60baa4fa925414977a9fa41b03/"
			"/Users/gabrieldetaxis/.conan/data/libpng/1.6.37/_/_/package/3978f8c84ac945c9ab651ab4a771af89cb8ccf32/"
			"/Users/gabrieldetaxis/.conan/data/brotli/1.0.9/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/libffi/3.4.2/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/pcre/8.45/_/_/package/a86359bb8915e4a8a57e48ce80b6c346f70f9755/"
			"/Users/gabrieldetaxis/.conan/data/libelf/0.8.13/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/libgettext/0.21/_/_/package/093defb2b8902dbb1cd5737e8d24a7f794ccc2d9/"
			"/Users/gabrieldetaxis/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/"
			"/Users/gabrieldetaxis/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib/cmake"
			"/Users/gabrieldetaxis/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS "-fPIC ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::harfbuzz CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT}" "${CONAN_LIB_DIRS_QT}"
                                  CONAN_PACKAGE_TARGETS_QT "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}"
                                  "" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_QT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_QT_DEBUG} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::harfbuzz CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_DEBUG}" "${CONAN_LIB_DIRS_QT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_QT_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}"
                                  "debug" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_QT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_QT_RELEASE} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::harfbuzz CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELEASE}" "${CONAN_LIB_DIRS_QT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_QT_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}"
                                  "release" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_QT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_QT_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::harfbuzz CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_QT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_QT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_QT_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::harfbuzz CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_MINSIZEREL}" "${CONAN_LIB_DIRS_QT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_QT_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" qt)

    add_library(CONAN_PKG::qt INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_QT} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_QT_RELEASE} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_QT_MINSIZEREL} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_QT_DEBUG} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_QT_LIST} ${CONAN_CXX_FLAGS_QT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_QT_RELEASE_LIST} ${CONAN_CXX_FLAGS_QT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_QT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_QT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_QT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_QT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_QT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PORTAUDIO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO}" "${CONAN_LIB_DIRS_PORTAUDIO}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}"
                                  "" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PORTAUDIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_DEBUG}" "${CONAN_LIB_DIRS_PORTAUDIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_DEBUG "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}"
                                  "debug" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PORTAUDIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_RELEASE}" "${CONAN_LIB_DIRS_PORTAUDIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_RELEASE "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}"
                                  "release" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PORTAUDIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PORTAUDIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PORTAUDIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_MINSIZEREL}" "${CONAN_LIB_DIRS_PORTAUDIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_MINSIZEREL "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" portaudio)

    add_library(CONAN_PKG::portaudio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PORTAUDIO} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_RELEASE} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_MINSIZEREL} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_DEBUG} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PORTAUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PORTAUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PORTAUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PORTAUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PORTAUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PORTAUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PORTAUDIO_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PORTAUDIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PORTAUDIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PORTAUDIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PORTAUDIO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPUS} ${CONAN_FRAMEWORKS_FOUND_OPUS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS}" "${CONAN_LIB_DIRS_OPUS}"
                                  CONAN_PACKAGE_TARGETS_OPUS "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}"
                                  "" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPUS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPUS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_DEBUG}" "${CONAN_LIB_DIRS_OPUS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPUS_DEBUG "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}"
                                  "debug" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPUS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPUS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_RELEASE}" "${CONAN_LIB_DIRS_OPUS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPUS_RELEASE "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}"
                                  "release" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPUS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPUS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPUS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPUS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPUS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPUS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_MINSIZEREL}" "${CONAN_LIB_DIRS_OPUS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPUS_MINSIZEREL "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opus)

    add_library(CONAN_PKG::opus INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPUS} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPUS_RELEASE} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPUS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPUS_MINSIZEREL} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPUS_DEBUG} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPUS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPUS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPUS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPUS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPUS_DEBUG}>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPUS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPUS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPUS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPUS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPUS_DEBUG}>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPUS_LIST} ${CONAN_CXX_FLAGS_OPUS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPUS_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPUS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPUS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPUS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPUS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPUS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ASIO} ${CONAN_FRAMEWORKS_FOUND_ASIO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO}" "${CONAN_LIB_DIRS_ASIO}"
                                  CONAN_PACKAGE_TARGETS_ASIO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}"
                                  "" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ASIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ASIO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_DEBUG}" "${CONAN_LIB_DIRS_ASIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ASIO_DEBUG "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}"
                                  "debug" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ASIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ASIO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_RELEASE}" "${CONAN_LIB_DIRS_ASIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ASIO_RELEASE "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}"
                                  "release" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ASIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ASIO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ASIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ASIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ASIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ASIO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_MINSIZEREL}" "${CONAN_LIB_DIRS_ASIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ASIO_MINSIZEREL "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" asio)

    add_library(CONAN_PKG::asio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ASIO} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ASIO_RELEASE} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ASIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ASIO_MINSIZEREL} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ASIO_DEBUG} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ASIO_LIST} ${CONAN_CXX_FLAGS_ASIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ASIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_ASIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ASIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ASIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ASIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ASIO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE_ORM} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM} CONAN_PKG::sqlite3")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE_ORM}" "${CONAN_LIB_DIRS_SQLITE_ORM}"
                                  CONAN_PACKAGE_TARGETS_SQLITE_ORM "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES}"
                                  "" sqlite_orm)
    set(_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE_ORM_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM_DEBUG} CONAN_PKG::sqlite3")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE_ORM_DEBUG}" "${CONAN_LIB_DIRS_SQLITE_ORM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE_ORM_DEBUG "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite_orm)
    set(_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE_ORM_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM_RELEASE} CONAN_PKG::sqlite3")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE_ORM_RELEASE}" "${CONAN_LIB_DIRS_SQLITE_ORM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE_ORM_RELEASE "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELEASE}"
                                  "release" sqlite_orm)
    set(_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE_ORM_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM_RELWITHDEBINFO} CONAN_PKG::sqlite3")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE_ORM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE_ORM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE_ORM_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite_orm)
    set(_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE_ORM_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE_ORM_MINSIZEREL} CONAN_PKG::sqlite3")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE_ORM_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE_ORM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE_ORM_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite_orm)

    add_library(CONAN_PKG::sqlite_orm INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite_orm PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE_ORM} ${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE_ORM_RELEASE} ${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE_ORM_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE_ORM_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE_ORM_DEBUG} ${_CONAN_PKG_LIBS_SQLITE_ORM_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE_ORM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE_ORM_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite_orm PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE_ORM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE_ORM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE_ORM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE_ORM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE_ORM_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite_orm PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE_ORM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE_ORM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE_ORM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE_ORM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE_ORM_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite_orm PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE_ORM_LIST} ${CONAN_CXX_FLAGS_SQLITE_ORM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE_ORM_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE_ORM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE_ORM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE_ORM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE_ORM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE_ORM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE_ORM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE_ORM_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL}" "${CONAN_LIB_DIRS_OPENSSL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}"
                                  "" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENSSL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_DEBUG}" "${CONAN_LIB_DIRS_OPENSSL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}"
                                  "debug" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENSSL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELEASE}" "${CONAN_LIB_DIRS_OPENSSL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}"
                                  "release" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENSSL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENSSL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENSSL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENSSL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openssl)

    add_library(CONAN_PKG::openssl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENSSL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENSSL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENSSL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENSSL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENSSL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENSSL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENSSL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2}" "${CONAN_LIB_DIRS_PCRE2}"
                                  CONAN_PACKAGE_TARGETS_PCRE2 "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}"
                                  "" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE2_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_DEBUG}" "${CONAN_LIB_DIRS_PCRE2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}"
                                  "debug" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELEASE}" "${CONAN_LIB_DIRS_PCRE2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}"
                                  "release" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE2_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre2)

    add_library(CONAN_PKG::pcre2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE2} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE2_RELEASE} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE2_DEBUG} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE2_LIST} ${CONAN_CXX_FLAGS_PCRE2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE2_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}"
                                  "" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEBUG}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}"
                                  "debug" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELEASE}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}"
                                  "release" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_MINSIZEREL}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" double-conversion)

    add_library(CONAN_PKG::double-conversion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_HARFBUZZ} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ}" "${CONAN_LIB_DIRS_HARFBUZZ}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}"
                                  "" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_HARFBUZZ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_DEBUG} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_DEBUG}" "${CONAN_LIB_DIRS_HARFBUZZ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_DEBUG "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}"
                                  "debug" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_HARFBUZZ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_RELEASE} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_RELEASE}" "${CONAN_LIB_DIRS_HARFBUZZ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_RELEASE "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}"
                                  "release" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_HARFBUZZ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_RELWITHDEBINFO} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_HARFBUZZ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_HARFBUZZ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_MINSIZEREL} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_MINSIZEREL}" "${CONAN_LIB_DIRS_HARFBUZZ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_MINSIZEREL "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" harfbuzz)

    add_library(CONAN_PKG::harfbuzz INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_HARFBUZZ} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_RELEASE} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_MINSIZEREL} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_DEBUG} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_HARFBUZZ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_HARFBUZZ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_HARFBUZZ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_HARFBUZZ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_HARFBUZZ_DEBUG}>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_HARFBUZZ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_DEBUG}>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_HARFBUZZ_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_HARFBUZZ_RELEASE_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_HARFBUZZ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_HARFBUZZ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_HARFBUZZ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3}" "${CONAN_LIB_DIRS_SQLITE3}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3 "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}"
                                  "" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE3_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_DEBUG}" "${CONAN_LIB_DIRS_SQLITE3_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE3_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELEASE}" "${CONAN_LIB_DIRS_SQLITE3_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}"
                                  "release" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE3_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE3_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE3_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE3_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite3)

    add_library(CONAN_PKG::sqlite3 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE3} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE3_LIST} ${CONAN_CXX_FLAGS_SQLITE3_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE3_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE3_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE3_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE3_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE3_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ}" "${CONAN_LIB_DIRS_LIBPQ}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}"
                                  "" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPQ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_DEBUG}" "${CONAN_LIB_DIRS_LIBPQ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}"
                                  "debug" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPQ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELEASE}" "${CONAN_LIB_DIRS_LIBPQ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}"
                                  "release" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPQ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPQ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPQ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPQ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpq)

    add_library(CONAN_PKG::libpq INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPQ} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPQ_LIST} ${CONAN_CXX_FLAGS_LIBPQ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPQ_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPQ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPQ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPQ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPQ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC}" "${CONAN_LIB_DIRS_ODBC}"
                                  CONAN_PACKAGE_TARGETS_ODBC "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}"
                                  "" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ODBC_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ODBC_DEBUG} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_DEBUG}" "${CONAN_LIB_DIRS_ODBC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ODBC_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}"
                                  "debug" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ODBC_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELEASE} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELEASE}" "${CONAN_LIB_DIRS_ODBC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}"
                                  "release" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ODBC_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELWITHDEBINFO} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ODBC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ODBC_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ODBC_MINSIZEREL} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_MINSIZEREL}" "${CONAN_LIB_DIRS_ODBC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" odbc)

    add_library(CONAN_PKG::odbc INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ODBC} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ODBC_RELEASE} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ODBC_DEBUG} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ODBC_LIST} ${CONAN_CXX_FLAGS_ODBC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ODBC_RELEASE_LIST} ${CONAN_CXX_FLAGS_ODBC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ODBC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ODBC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ODBC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ODBC_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL}" "${CONAN_LIB_DIRS_OPENGL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}"
                                  "" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENGL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENGL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_DEBUG}" "${CONAN_LIB_DIRS_OPENGL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}"
                                  "debug" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENGL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELEASE}" "${CONAN_LIB_DIRS_OPENGL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}"
                                  "release" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENGL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENGL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENGL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENGL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENGL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opengl)

    add_library(CONAN_PKG::opengl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENGL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENGL_RELEASE} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENGL_DEBUG} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENGL_LIST} ${CONAN_CXX_FLAGS_OPENGL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENGL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENGL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENGL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENGL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENGL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE}" "${CONAN_LIB_DIRS_FREETYPE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}"
                                  "" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FREETYPE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_DEBUG} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_DEBUG}" "${CONAN_LIB_DIRS_FREETYPE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}"
                                  "debug" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FREETYPE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELEASE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELEASE}" "${CONAN_LIB_DIRS_FREETYPE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}"
                                  "release" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FREETYPE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELWITHDEBINFO} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FREETYPE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FREETYPE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_MINSIZEREL} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_MINSIZEREL}" "${CONAN_LIB_DIRS_FREETYPE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" freetype)

    add_library(CONAN_PKG::freetype INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FREETYPE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FREETYPE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FREETYPE_RELEASE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FREETYPE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FREETYPE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FREETYPE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FREETYPE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLIB} ${CONAN_FRAMEWORKS_FOUND_GLIB} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB}" "${CONAN_LIB_DIRS_GLIB}"
                                  CONAN_PACKAGE_TARGETS_GLIB "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}"
                                  "" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLIB_DEBUG} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_DEBUG}" "${CONAN_LIB_DIRS_GLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLIB_DEBUG "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}"
                                  "debug" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLIB_RELEASE} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_RELEASE}" "${CONAN_LIB_DIRS_GLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLIB_RELEASE "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}"
                                  "release" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLIB_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLIB_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_GLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLIB_MINSIZEREL "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glib)

    add_library(CONAN_PKG::glib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLIB} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLIB_RELEASE} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLIB_DEBUG} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLIB_LIST} ${CONAN_CXX_FLAGS_GLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG}" "${CONAN_LIB_DIRS_LIBPNG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}"
                                  "" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPNG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_DEBUG}" "${CONAN_LIB_DIRS_LIBPNG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}"
                                  "debug" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPNG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELEASE}" "${CONAN_LIB_DIRS_LIBPNG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}"
                                  "release" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPNG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPNG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPNG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPNG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpng)

    add_library(CONAN_PKG::libpng INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPNG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPNG_LIST} ${CONAN_CXX_FLAGS_LIBPNG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPNG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPNG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BROTLI} ${CONAN_FRAMEWORKS_FOUND_BROTLI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI}" "${CONAN_LIB_DIRS_BROTLI}"
                                  CONAN_PACKAGE_TARGETS_BROTLI "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}"
                                  "" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BROTLI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BROTLI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_DEBUG}" "${CONAN_LIB_DIRS_BROTLI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_DEBUG "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}"
                                  "debug" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BROTLI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BROTLI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_RELEASE}" "${CONAN_LIB_DIRS_BROTLI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_RELEASE "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}"
                                  "release" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BROTLI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BROTLI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BROTLI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BROTLI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BROTLI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_MINSIZEREL}" "${CONAN_LIB_DIRS_BROTLI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_MINSIZEREL "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" brotli)

    add_library(CONAN_PKG::brotli INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BROTLI} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BROTLI_RELEASE} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BROTLI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BROTLI_MINSIZEREL} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BROTLI_DEBUG} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BROTLI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BROTLI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BROTLI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BROTLI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BROTLI_DEBUG}>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BROTLI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BROTLI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BROTLI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BROTLI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BROTLI_DEBUG}>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BROTLI_LIST} ${CONAN_CXX_FLAGS_BROTLI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BROTLI_RELEASE_LIST} ${CONAN_CXX_FLAGS_BROTLI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BROTLI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BROTLI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BROTLI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BROTLI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBFFI} ${CONAN_FRAMEWORKS_FOUND_LIBFFI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI}" "${CONAN_LIB_DIRS_LIBFFI}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}"
                                  "" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBFFI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_DEBUG}" "${CONAN_LIB_DIRS_LIBFFI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_DEBUG "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}"
                                  "debug" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBFFI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_RELEASE}" "${CONAN_LIB_DIRS_LIBFFI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_RELEASE "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}"
                                  "release" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBFFI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBFFI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBFFI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBFFI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_MINSIZEREL "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libffi)

    add_library(CONAN_PKG::libffi INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBFFI} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBFFI_RELEASE} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBFFI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBFFI_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBFFI_DEBUG} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBFFI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBFFI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBFFI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBFFI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBFFI_DEBUG}>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBFFI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_DEBUG}>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBFFI_LIST} ${CONAN_CXX_FLAGS_LIBFFI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBFFI_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBFFI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBFFI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBFFI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBFFI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE} ${CONAN_FRAMEWORKS_FOUND_PCRE} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE}" "${CONAN_LIB_DIRS_PCRE}"
                                  CONAN_PACKAGE_TARGETS_PCRE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}"
                                  "" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE_DEBUG} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_DEBUG}" "${CONAN_LIB_DIRS_PCRE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE_DEBUG "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}"
                                  "debug" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE_RELEASE} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_RELEASE}" "${CONAN_LIB_DIRS_PCRE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE_RELEASE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}"
                                  "release" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE_RELWITHDEBINFO} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE_MINSIZEREL} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre)

    add_library(CONAN_PKG::pcre INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE_RELEASE} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE_DEBUG} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE_LIST} ${CONAN_CXX_FLAGS_PCRE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBELF} ${CONAN_FRAMEWORKS_FOUND_LIBELF} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF}" "${CONAN_LIB_DIRS_LIBELF}"
                                  CONAN_PACKAGE_TARGETS_LIBELF "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}"
                                  "" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBELF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBELF_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_DEBUG}" "${CONAN_LIB_DIRS_LIBELF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_DEBUG "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}"
                                  "debug" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBELF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBELF_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_RELEASE}" "${CONAN_LIB_DIRS_LIBELF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_RELEASE "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}"
                                  "release" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBELF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBELF_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBELF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBELF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBELF_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBELF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_MINSIZEREL "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libelf)

    add_library(CONAN_PKG::libelf INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBELF} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBELF_RELEASE} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBELF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBELF_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBELF_DEBUG} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBELF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBELF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBELF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBELF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBELF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBELF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBELF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBELF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBELF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBELF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBELF_LIST} ${CONAN_CXX_FLAGS_LIBELF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBELF_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBELF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBELF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBELF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBELF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBELF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBGETTEXT} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGETTEXT}" "${CONAN_LIB_DIRS_LIBGETTEXT}"
                                  CONAN_PACKAGE_TARGETS_LIBGETTEXT "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES}"
                                  "" libgettext)
    set(_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBGETTEXT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT_DEBUG} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGETTEXT_DEBUG}" "${CONAN_LIB_DIRS_LIBGETTEXT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBGETTEXT_DEBUG "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_DEBUG}"
                                  "debug" libgettext)
    set(_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBGETTEXT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT_RELEASE} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGETTEXT_RELEASE}" "${CONAN_LIB_DIRS_LIBGETTEXT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBGETTEXT_RELEASE "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELEASE}"
                                  "release" libgettext)
    set(_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBGETTEXT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT_RELWITHDEBINFO} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGETTEXT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBGETTEXT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBGETTEXT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libgettext)
    set(_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBGETTEXT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBGETTEXT_MINSIZEREL} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGETTEXT_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBGETTEXT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBGETTEXT_MINSIZEREL "${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libgettext)

    add_library(CONAN_PKG::libgettext INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libgettext PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBGETTEXT} ${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBGETTEXT_RELEASE} ${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBGETTEXT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBGETTEXT_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBGETTEXT_DEBUG} ${_CONAN_PKG_LIBS_LIBGETTEXT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGETTEXT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGETTEXT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libgettext PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBGETTEXT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBGETTEXT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBGETTEXT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBGETTEXT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBGETTEXT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libgettext PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBGETTEXT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBGETTEXT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBGETTEXT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBGETTEXT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBGETTEXT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libgettext PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBGETTEXT_LIST} ${CONAN_CXX_FLAGS_LIBGETTEXT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBGETTEXT_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBGETTEXT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBGETTEXT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBGETTEXT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBGETTEXT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBGETTEXT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBGETTEXT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBGETTEXT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV}" "${CONAN_LIB_DIRS_LIBICONV}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}"
                                  "" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBICONV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_DEBUG}" "${CONAN_LIB_DIRS_LIBICONV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}"
                                  "debug" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBICONV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELEASE}" "${CONAN_LIB_DIRS_LIBICONV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}"
                                  "release" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBICONV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBICONV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBICONV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBICONV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libiconv)

    add_library(CONAN_PKG::libiconv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBICONV} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBICONV_LIST} ${CONAN_CXX_FLAGS_LIBICONV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBICONV_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBICONV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBICONV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBICONV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBICONV_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::qt CONAN_PKG::portaudio CONAN_PKG::opus CONAN_PKG::asio CONAN_PKG::sqlite_orm CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::harfbuzz CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::opengl CONAN_PKG::freetype CONAN_PKG::glib CONAN_PKG::libpng CONAN_PKG::brotli CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libgettext CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libiconv)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT((MSVC_VERSION EQUAL 1930) OR (MSVC_VERSION GREATER 1930))) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(${CONAN_COMPILER_MAJOR} VERSION_GREATER_EQUAL "13" AND "${CONAN_COMPILER_MINOR}" STREQUAL "" AND ${CONAN_COMPILER_MAJOR} VERSION_EQUAL ${VERSION_MAJOR})
           # This is correct,  13.X is considered 13
        elseif(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_FREETYPE_LIBTOOL_VERSION "24.1.18")