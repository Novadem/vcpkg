# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#

include(vcpkg_common_functions)


vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO pulzed/mINI
	REF  a4d9aa5588bcc30fe18d26b1dd4b180ec9389b4d
	SHA512 274f891725f08466fe4f5675cacb17f49f3e16c4ea9c24e4421bf059c8928bf695fdfcf7a4e282f3a3b1f634ba8fd803a1b4d18740b443e1c16daf9545aa93ec
	)

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/include)	
file(COPY ${SOURCE_PATH}/src/mini DESTINATION ${CURRENT_PACKAGES_DIR}/include)

	
# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/mini)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/mini/LICENSE ${CURRENT_PACKAGES_DIR}/share/mini/copyright)