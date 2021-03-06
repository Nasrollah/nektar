SET(THIRDPARTY_BUILD_METIS ON CACHE BOOL
    "Build ModMetis library from ThirdParty")

IF (THIRDPARTY_BUILD_METIS)
    INCLUDE(ExternalProject)
    EXTERNALPROJECT_ADD(
        modmetis-5.1.0
        PREFIX ${TPSRC}
        URL ${TPURL}/modmetis-5.1.0_1.tar.bz2
        URL_MD5 "6c6816aea0f53db6c71b1d98ed4ad42b"
        DOWNLOAD_DIR ${TPSRC}
        CONFIGURE_COMMAND ${CMAKE_COMMAND}
            -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
            -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
            -DCMAKE_INSTALL_PREFIX:PATH=${TPSRC}/dist
            -DCMAKE_C_FLAGS:STRING=-fPIC
            -DGKLIB_PATH:PATH=${TPSRC}/src/modmetis-5.1.0/GKlib
            ${TPSRC}/src/modmetis-5.1.0
    )
    SET(METIS_LIB metis CACHE FILEPATH
        "METIS library" FORCE)
    MARK_AS_ADVANCED(METIS_LIB)
    LINK_DIRECTORIES(${TPSRC}/dist/lib)
    INCLUDE_DIRECTORIES(${TPSRC}/dist/include)
    MESSAGE(STATUS "Build Metis: ${TPSRC}/dist/lib/lib${METIS_LIB}.a")
ELSE (THIRDPARTY_BUILD_METIS)
    INCLUDE (FindMetis)
ENDIF (THIRDPARTY_BUILD_METIS)

