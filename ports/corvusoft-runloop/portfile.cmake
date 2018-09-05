include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NobilisNC/runloop
    REF be0327601cb3610bd9734926c6711bf0f54404de
    SHA512 31349616811fb69d668d0ca9fde4c15768fabf52b5ac8786fc000cbce401bf9993a7cca819d66763e15c6c22037bb938e6216890592ceb5e3a00110d09911ff9
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
file(COPY ${CURRENT_PACKAGES_DIR}/library/runloop.lib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(RENAME ${CURRENT_PACKAGES_DIR}/lib/runloop.lib ${CURRENT_PACKAGES_DIR}/lib/corvusoft-runloop.lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/library)

# Do the same for debug build
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/lib)
file(COPY ${CURRENT_PACKAGES_DIR}/debug/library/runloop.lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)
file(RENAME ${CURRENT_PACKAGES_DIR}/debug/lib/runloop.lib ${CURRENT_PACKAGES_DIR}/debug/lib/corvusoft-runloop.lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/library)


# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop/LICENSE ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop/copyright)