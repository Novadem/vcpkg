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

# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop/LICENSE ${CURRENT_PACKAGES_DIR}/share/corvusoft-runloop/copyright)