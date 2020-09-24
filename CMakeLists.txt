cmake_minimum_required(VERSION 3.16.3)
project(goaldis)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)

add_executable(goaldis
        src/disasm.cpp
        src/goaldis.h
        src/link.cpp
        src/machine.cpp
        src/main.cpp
        src/meta.cpp
        src/opcodes.h)

set(CMAKE_CXX_FLAGS "-fpermissive") #Fix this at some point.

set_target_properties(goaldis PROPERTIES COMPILE_OPTIONS "-m32" LINK_FLAGS "-m32") #32bit
