set(EXTERNAL_DIR "${CMAKE_SOURCE_DIR}/external")

# SDL3
set(SDL3_ROOT "${EXTERNAL_DIR}/SDL3" CACHE PATH "SDL3 Root dir")

set(SDL3_ARCH "x86_64-w64-mingw32")
set(SDL3_ARCH_DIR "${SDL3_ROOT}/${SDL3_ARCH}")

if(NOT TARGET SDL3::SDL3)
    add_library(SDL3::SDL3 SHARED IMPORTED)

    set_target_properties(SDL3::SDL3 PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${SDL3_ARCH_DIR}/include"
            IMPORTED_IMPLIB               "${SDL3_ARCH_DIR}/lib/libSDL3.dll.a"
            IMPORTED_LOCATION             "${SDL3_ARCH_DIR}/bin/SDL3.dll"
    )
endif()

# EnTT
set(ENTT_INCLUDE_DIR "${EXTERNAL_DIR}/entt" CACHE PATH "EnTT include dir")

if (NOT TARGET EnTT::EnTT)
    add_library(EnTT::EnTT INTERFACE IMPORTED)
    set_target_properties(EnTT::EnTT PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${ENTT_INCLUDE_DIR}"
    )
endif()

# TinyBVH
set(TINYBVH_INCLUDE_DIR "${EXTERNAL_DIR}/tinybvh" CACHE PATH "TinyBVH include dir")
if(NOT TARGET tinybvh::tinybvh)
    add_library(tinybvh::tinybvh INTERFACE IMPORTED)
    set_target_properties(tinybvh::tinybvh PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${TINYBVH_INCLUDE_DIR}"
    )
endif()

# GLM
set(GLM_DIR "${EXTERNAL_DIR}/glm" CACHE PATH "GLM include dir")
if(NOT TARGET glm::glm)
    add_library(glm::glm INTERFACE IMPORTED)
    set_target_properties(glm::glm PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${GLM_INCLUDE_DIR}"
    )
endif()