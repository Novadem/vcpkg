include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NobilisNC/core
    REF 979ce9116daae7886c8c6e0c338201cbc7c7b516
    SHA512 dcd62250f4d33f57062e54aa60f8564ed43b8f3282ae53143694d8b65ea8503837d0fde72ae509555f99379d51e16fe5e72f036b2db6a91d33713df7a71fadf2
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

#Remove include debug files
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Move and rename library
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${CURRENT_PACKAGES_DIR}/library/core.lib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(RENAME ${CURRENT_PACKAGES_DIR}/lib/core.lib ${CURRENT_PACKAGES_DIR}/lib/corvusoft-core.lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/library)

# Do the same for debug build
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/lib)
file(COPY ${CURRENT_PACKAGES_DIR}/debug/library/core.lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)
file(RENAME ${CURRENT_PACKAGES_DIR}/debug/lib/core.lib ${CURRENT_PACKAGES_DIR}/debug/lib/corvusoft-core.lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/library)

# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/corvusoft-core)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/corvusoft-core/LICENSE ${CURRENT_PACKAGES_DIR}/share/corvusoft-core/copyright)