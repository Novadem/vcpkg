include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO podsvirov/osgqtquick
    REF 86319c6ee527b4d25efbb515d75aba99727bb4f4
    SHA512 0416ee5e4d478e9a08d2b40a1f5fcb776caf8806369142889e9e16ecc626ca355b198ddd6c08010b81a6a295855ff115822fca29d586a42883d0ddd8614b3aa7
    HEAD_REF develop
)


vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES 
	${CMAKE_CURRENT_LIST_DIR}/fix-removed-features.patch # hack until patch from developper
	${CMAKE_CURRENT_LIST_DIR}/fix-qt-private-headers-path.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
	OPTIONS
		-DosgQtQuick_WITH_OSGQT=OFF
		#-DosgQtQuick_WITH_QT_PRIVATE=OFF
		-DINCLUDE_DIRECTORIES=C:/vcpkg/installed/x64-windows/include/QtQml/5.9.2/QtQml
)

vcpkg_install_cmake()

#Release
set(OSGQTQUICK_CMAKE_TOOLS_PATH ${CURRENT_PACKAGES_DIR}/share/cmake)

file(MAKE_DIRECTORY ${OSGQTQUICK_CMAKE_TOOLS_PATH})

file(GLOB OSGQTQUICK_CMAKE_TOOLS ${CURRENT_PACKAGES_DIR}/lib/cmake/*)
file(COPY ${OSGQTQUICK_CMAKE_TOOLS} DESTINATION	${OSGQTQUICK_CMAKE_TOOLS_PATH})
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)

#Debug
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/cmake)


#Licence
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/osg-qtquick)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/osg-qtquick/LICENSE ${CURRENT_PACKAGES_DIR}/share/osg-qtquick/copyright)