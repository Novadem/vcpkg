include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO podsvirov/osgqtquick
    REF de9bafd9df4a68cd2a0b81e3a2be2ec245b8cc39
    SHA512 7f383f0db4c3d698713289bcc6a4c9988fba2eda837c452195fa1aaf0f40f47235b4be2bc2beb37611b4c524dbcf78b77d95a5d65fd565c80cffb9eb2447d404
    HEAD_REF develop
)


vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES 
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