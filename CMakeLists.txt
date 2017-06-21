cmake_minimum_required(VERSION 3.7)
project(SFMLSwift)

set(CMAKE_CXX_STANDARD 11)

set(SWIFT_PATH /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift)
set(BUILD_PATH .build/sample)

file(GLOB_RECURSE SourceFiles Source/*.swift Package.swift)

add_custom_target(Sample
        COMMAND ${SWIFT_PATH} build
            --build-path ${BUILD_PATH}
            -Xcc
            -fblocks
            -Xswiftc -I/usr/local/include
            -Xlinker -L/usr/local/lib

        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES ${SourceFiles})
