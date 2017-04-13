cmake_minimum_required(VERSION 3.7)
project(SFMLSwift)

set(CMAKE_CXX_STANDARD 11)

file(GLOB_RECURSE SourceFiles Source/*.swift Package.swift)

add_custom_target(Sample
        COMMAND /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift build --build-path .build/sample -Xcc -fblocks -Xswiftc -I/usr/local/include -Xlinker -L/usr/local/lib
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES ${SourceFiles})