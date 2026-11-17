cmake_minimum_required(VERSION 4.0)
project(terminals)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(cmake/Dependencies.cmake)

add_executable(terminals
    src/main.cpp
)

target_link_libraries(terminals PRIVATE
        SDL3::SDL3
        glm::glm
        EnTT::EnTT
        tinybvh::tinybvh
)

if(WIN32)
    add_custom_command(TARGET terminals POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${SDL3_ARCH_DIR}/bin/SDL3.dll"
            $<TARGET_FILE_DIR:terminals>
    )
endif()